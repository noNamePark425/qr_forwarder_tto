import 'dart:io';
import 'dart:async';
import 'dart:typed_data';
import 'package:qr_forwarder/common/utils/encryption_helper.dart';
import 'package:qr_forwarder/common/utils/crc_helper.dart';
import 'package:qr_forwarder/app/controller/home_page_controller.dart';
import 'package:qr_forwarder/common/models/print_response_data.dart';
import 'dart:convert';

// Socket 연결 관리만 담당
class SocketConnectService {
  Socket? _socket;
  final String ipAddress;
  final int port;
  final HomePageController homePageController;
  final CrcHelper _crcHelper = CrcHelper();
  static const List<int> _reserve = [0xFF, 0xFF, 0xFF, 0xFF]; // 예약 바이트

  // 응답 스트림 컨트롤러 타입 변경
  final StreamController<PrintResponseData> _responseController = StreamController.broadcast();
  Stream<PrintResponseData> get responseStream => _responseController.stream;

  // 연결 상태를 관찰할 수 있는 스트림 컨트롤러
  final _connectionStateController = StreamController<bool>.broadcast();
  Stream<bool> get connectionState => _connectionStateController.stream;

  SocketConnectService({
    required this.ipAddress,
    required this.port,
    required this.homePageController,
  });

  Future<void> connect(String host, int port) async {
    try {
      _socket = await Socket.connect(ipAddress, this.port);
      _setupListeners();
      _connectionStateController.add(true);
    } catch (e) {
      _connectionStateController.add(false);
      throw ConnectionException('Failed to connect: $e');
    }
  }

  void _setupListeners() {
    _socket?.listen(
      (Uint8List data) {
        _handleReceivedData(data);
      },
      onError: (error) {
        print('Socket error: $error');
      },
      onDone: () {
        print('Socket connection closed');
      },
    );
  }

  void _handleReceivedData(Uint8List data) {
    try {
      if (data.length < 14) {
        print('패킷 길이 부족');
        return;
      }

      if (data[0] != 0xFE || data[1] != 0xAD) {
        print('헤더 불일치');
        return;
      }

      int length = EncryptionHelper.bytesToInt(data.sublist(2, 6));
      if (data.length != length) {
        print('길이 불일치: 패킷 ${data.length}, 명시된 길이 $length');
        return;
      }

      int paramStart = 10;
      int paramEnd = length - 4;
      Uint8List paramBytes = data.sublist(paramStart, paramEnd);

      int tailStart = length - 2;
      Uint8List tailBytes = data.sublist(tailStart);
      if (tailBytes[0] != 0xED || tailBytes[1] != 0xAA) {
        print('Tail 불일치!');
        return;
      }

      final jsonString = utf8.decode(paramBytes);
      final Map<String, dynamic> json = jsonDecode(jsonString);

      // 여기! rawBytes 추가
      final response = PrintResponseData.fromJson(json, rawBytes: data);
      print('응답 파싱 완료: $response');

      _responseController.add(response);
    } catch (e) {
      print('응답 파싱 오류: $e');
    }
  }

  // void _handleReceivedData(Uint8List data) {
  //   try {
  //     // 1. 헤더 확인
  //     if (data.length < 14) {
  //       print('패킷 길이 부족');
  //       return;
  //     }
  //     if (data[0] != 0xFE || data[1] != 0xAD) {
  //       print('헤더 불일치');
  //       return;
  //     }

  //     // 2. 길이 읽기 (4B, big-endian)
  //     int length = EncryptionHelper.bytesToInt(data.sublist(2, 6));
  //     if (data.length != length) {
  //       print('길이 불일치: 패킷 ${data.length}, 명시된 길이 $length');
  //       return;
  //     }

  //     // 3. 바디(파라미터) 추출 (헤더2 + 길이4 + reserve4 = 10, CRC2 + tail2 = 4)
  //     int paramStart = 10;
  //     int paramEnd = length - 4; // CRC2 + tail2
  //     Uint8List paramBytes = data.sublist(paramStart, paramEnd);

  //     // 4. Tail만 검증 (마지막 2바이트)
  //     int tailStart = length - 2;
  //     Uint8List tailBytes = data.sublist(tailStart);
  //     if (tailBytes[0] != 0xED || tailBytes[1] != 0xAA) {
  //       print('Tail 불일치!');
  //       return;
  //     }

  //     // 5. JSON 파싱
  //     final jsonString = utf8.decode(paramBytes);
  //     final Map<String, dynamic> json = jsonDecode(jsonString);
  //     final response = PrintResponseData.fromJson(json);
  //     print('응답 파싱 완료: $response');
  //     _responseController.add(response);
  //   } catch (e) {
  //     print('응답 파싱 오류: $e');
  //   }
  // }

  Future<void> sendData(Uint8List data) async {
    // print('sendData 메서드 ! : $data');
    if (_socket == null) {
      print('소켓이 null입니다!');
      throw Exception('Socket not connected');
    }

    try {
      // final packet = _createPacket(data);
      final packet = data;
      _socket?.add(packet);
    } catch (e) {
      print('sendData 오류: $e');
      throw Exception('Failed to send data: $e');
    }
  }

  Future<void> sendPrintCommand(Object data) async {
    // toJson()이 있는 객체라면 JSON 문자열로 변환
    final jsonStr = jsonEncode((data as dynamic).toJson());
    print('sendPrintCommand: $jsonStr');
    final bytes = Uint8List.fromList(utf8.encode(jsonStr));
    await sendData(bytes);
  }

  // // C# GetSendData와 동일한 메서드
  // Uint8List getSendData(String txtMsg) {
  //   try {
  //     // 1. 문자열을 UTF-8로 인코딩
  //     final buffer = utf8.encode(txtMsg);

  //     // 2. CRC 계산 (C#의 crc(buffer)와 동일)
  //     final check = _crcHelper.crc(Uint8List.fromList(buffer));

  //     // 3. 패킷 생성
  //     final List<int> packet = [];
  //     packet.addAll([0xFE, 0xAD]); // 헤더
  //     packet.addAll(EncryptionHelper.intToBytes(buffer.length + 14)); // 전체 길이 (4B, big-endian)
  //     packet.addAll([0xFF, 0xFF, 0xFF, 0xFF]); // reserve
  //     packet.addAll(buffer); // 데이터
  //     packet.addAll(check); // CRC
  //     packet.addAll([0xED, 0xAA]); // 테일

  //     return Uint8List.fromList(packet);
  //   } catch (e) {
  //     print('getSendData 오류: $e');
  //     return Uint8List(0);
  //   }
  // }

  Uint8List getSendData(String txtMsg) {
    print("get Send Data (commandApi)");
    try {
      final buffer = utf8.encode(txtMsg); // JSON payload
      final head = [0xFE, 0xAD];
      final reserve = [0xFF, 0xFF, 0xFF, 0xFF];
      final totalLength = buffer.length + 2 + 4 + 4 + 2 + 2; // 전체 패킷 길이
      final lengthBytes = EncryptionHelper.intToBytes(totalLength); // Big-endian

      // ✅ CRC 대상은 JSON payload만!
      final check = _crcHelper.crc(Uint8List.fromList(buffer));

      // ✅ 최종 패킷 조립
      final packet = <int>[
        ...head,
        ...lengthBytes,
        ...reserve,
        ...buffer,
        ...check,
        0xED,
        0xAA,
      ];

      return Uint8List.fromList(packet);
    } catch (e) {
      print('getSendData 오류: $e');
      return Uint8List(0);
    }
  }

  // Uint8List getSendData(String txtMsg) {
  //   print("get Send Data (commandApi)");
  //   try {
  //     final buffer = utf8.encode(txtMsg); // JSON payload
  //     final head = [0xFE, 0xAD];
  //     final reserve = [0xFF, 0xFF, 0xFF, 0xFF];
  //     final totalLength =
  //         buffer.length + 2 + 4 + 4 + 2 + 2; // payload + head + length + reserve + CRC + tail
  //     final lengthBytes = EncryptionHelper.intToBytes(totalLength); // 4B, big-endian
  //
  //     // CRC 계산 대상: head + length + reserve + payload
  //     final crcTarget = <int>[
  //       ...head,
  //       ...lengthBytes,
  //       ...reserve,
  //       ...buffer,
  //     ];
  //     final check = _crcHelper.crc(Uint8List.fromList(crcTarget)); // ✅ CRC 대상 수정됨
  //
  //     // 최종 패킷 조립
  //     final packet = <int>[
  //       ...head,
  //       ...lengthBytes,
  //       ...reserve,
  //       ...buffer,
  //       ...check,
  //       0xED, 0xAA, // Tail
  //     ];
  //
  //     return Uint8List.fromList(packet);
  //   } catch (e) {
  //     print('getSendData 오류: $e');
  //     return Uint8List(0);
  //   }
  // }

  void disconnect() {
    _socket?.destroy();
    _socket = null;
    _connectionStateController.add(false);
  }

  void dispose() {
    disconnect();
    _connectionStateController.close();
  }
}

/// 연결 관련 예외 클래스
class ConnectionException implements Exception {
  final String message;
  ConnectionException(this.message);

  @override
  String toString() => 'ConnectionException: $message';
}
