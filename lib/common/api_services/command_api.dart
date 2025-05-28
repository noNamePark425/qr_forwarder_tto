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
      return await service.responseStream.first.timeout(
        Duration(seconds: 2),
      );
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

      final packet = service.getSendData(jsonEncode(printData.toJson()));
      await service.sendData(packet);

      final response = await _handleResponse(service);
      if (response != null) {
        final jsonStr = _encryptionHelper.prettyJson(response);
        print('프린터 응답: $jsonStr');
      }
    } catch (e) {
      print('오류: 명령어 처리 중 오류가 발생했습니다.\n오류 내용: $e');
      rethrow;
    }
  }

  Future<void> startPrint(SocketConnectService service) async {
    final now = DateTime.now();
    final timeStamp = CrcHelper.getTimeStamp(now);
    final sign = EncryptionHelper.md5Encrypt(timeStamp);

    final printData = PrintData(
      fun: 'StartPrint',
      timeStamp: timeStamp,
      dataType: '0',
      sign: sign,
    );

    await _sendCommandAndHandleResponse(service, printData);
  }

  Future<void> stopPrint(SocketConnectService service) async {
    final now = DateTime.now();
    final timeStamp = CrcHelper.getTimeStamp(now);
    final sign = EncryptionHelper.md5Encrypt(timeStamp);

    final printData = PrintData(
      fun: 'StopPrint',
      timeStamp: timeStamp,
      dataType: '0',
      sign: sign,
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
