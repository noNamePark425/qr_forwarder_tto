import 'dart:convert';
import 'dart:async';
import 'package:qr_forwarder/common/api_services/socket_connect_service.dart';
import 'package:qr_forwarder/common/utils/crc_helper.dart';
import 'package:qr_forwarder/common/utils/encryption_helper.dart';
import 'package:qr_forwarder/common/models/print_data.dart';
import 'package:qr_forwarder/common/models/print_response_data.dart';

class CommandApi {
  final SocketConnectService? _qrMarkingConnectService;
  final CrcHelper _crcHelper = CrcHelper();
  final EncryptionHelper _encryptionHelper = EncryptionHelper();

  CommandApi({SocketConnectService? qrMarkingConnectService})
      : _qrMarkingConnectService = qrMarkingConnectService;

  /// 응답 처리 공통 메서드
  Future<PrintResponseData?> _handleResponse(SocketConnectService service) async {
    try {
      final response = await service.responseStream.first.timeout(
        Duration(seconds: 2),
      );

      // ✅ 응답 바이트 로그 추가 (rawBytes 확인)
      if (response.rawBytes != null && response.rawBytes!.isNotEmpty) {
        final hexStr = response.rawBytes!.map((b) => b.toRadixString(16).padLeft(2, '0')).join(' ');
        print('📥 프린터 응답 HEX (in _handleResponse): $hexStr');
      }

      print("여기서 찍어야함.");

      return response;
    } on TimeoutException {
      print('오류: 서버 응답이 없습니다.');
      return null;
    }
  }

  /// 명령어 전송 및 응답 처리 공통 메서드
  Future<void> _sendCommandAndHandleResponse(
    SocketConnectService service,
    PrintData printData,
  ) async {
    try {
      final jsonSendStr = _encryptionHelper.prettySendJson(printData);
      print('start command ::: ${jsonEncode(printData.toJson())}');
      print('pretty JSON ::: $jsonSendStr');

      // final packet = service.getSendData(jsonEncode(printData.toJson()));
      final packet = service.getSendData(jsonEncode(printData.toJson()));
      print('send packet HEX: ${packet.map((b) => b.toRadixString(16).padLeft(2, '0')).join(' ')}');

      await service.sendData(packet);

      final response = await _handleResponse(service);
      if (response != null) {
        // ✅ HEX 로그 (중복 방지를 위해 이 위치에만 두어도 OK)
        if (response.rawBytes != null) {
          final hexStr =
              response.rawBytes!.map((b) => b.toRadixString(16).padLeft(2, '0')).join(' ');
          print('📥 프린터 응답 HEX: $hexStr');
        }

        final jsonStr = _encryptionHelper.prettyJson(response);
        print('프린터 응답 (파싱): $jsonStr');
      }
    } catch (e) {
      print('오류: 명령어 처리 중 오류가 발생했습니다.\n오류 내용: $e');
      rethrow;
    }
  }

  Future<void> startPrint(SocketConnectService service) async {
    await _sendCommand(service, 'StartPrint');
  }

  Future<void> stopPrint(SocketConnectService service) async {
    await _sendCommand(service, 'StopPrint');
  }

  Future<void> getPrintList(SocketConnectService service) async {
    await _sendCommand(service, 'GetPrintList');
  }

  Future<void> clearCache(SocketConnectService service) async {
    await _sendCommand(service, 'ClearCache');
  }

  Future<void> getPrinterStatus(SocketConnectService service) async {
    await _sendCommand(service, 'GetPrinterStatus');
  }

  Future<void> clearErrorState(SocketConnectService service) async {
    await _sendCommand(service, 'RecoveryErrorState');
  }

  // Future<void> queryPrintCount(SocketConnectService service) async {
  //   final now = DateTime.now();
  //   final timeStamp = CrcHelper.getTimeStamp(now);
  //   final sign = EncryptionHelper.md5Encrypt(timeStamp);

  //   final printData = PrintData(
  //     fun: 'QueryInfo',
  //     timeStamp: timeStamp,
  //     sign: sign,
  //     dataType: '0',
  //     query: 'SearchPrintCount',
  //   );

  //   await _sendCommandAndHandleResponse(service, printData);
  // }

  Future<void> _sendCommand(SocketConnectService service, String fun) async {
    final now = DateTime.now();
    final timeStamp = CrcHelper.getTimeStamp(now);
    final sign = EncryptionHelper.md5Encrypt(timeStamp.toString());

    final printData = PrintData(
      fun: fun,
      timeStamp: timeStamp,
      sign: sign,
      dataType: '0',
    );

    await _sendCommandAndHandleResponse(service, printData);
  }

  Future<void> sendPrintData(SocketConnectService service) async {
    final now = DateTime.now();
    final timeStamp = CrcHelper.getTimeStamp(now);
    final sign = EncryptionHelper.md5Encrypt(timeStamp);

    final List<List<PrintDataItem>> testData = [
      [
        PrintDataItem(id: '1', content: 'Test Data 1'),
        PrintDataItem(id: '2', content: 'Test Data 2'),
      ],
    ];

    final printData = PrintData(
      fun: 'SendPrintData',
      timeStamp: timeStamp,
      dataType: '0',
      sign: sign,
    );

    await _sendCommandAndHandleResponse(service, printData);
  }
}
