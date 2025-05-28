import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:qr_forwarder/common/models/qr_response.dart';
import 'package:qr_forwarder/common/api_services/api_service.dart';
import 'package:qr_forwarder/common/api_services/socket_connect_service.dart';
import 'package:qr_forwarder/common/api_services/command_api.dart';
import 'package:qr_forwarder/app/pages/mains/home_page/home_page.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:qr_forwarder/common/models/server_product.dart';

class HomePageController extends ChangeNotifier {
  // Socket? printerConnection;
  // Socket? _socket;
  bool isPrinterConnected = false;
  List<ServerProduct> serverProducts = []; // 서버에서 받은 제품 목록 저장
  int currentQRIndex = 0;
  String? selectedBagType;
  bool isReturnToken = false;

  final TextEditingController printerIpController;
  final TextEditingController printerPortController;

  final _apiService = ApiService();
  SocketConnectService? qrMarkingConnectService;

  final CommandApi _commandApi;

  final List<TabItemController> tabControllers = [];

  int currentCount = 0;
  int amountCount = 0;

  HomePageController({
    required this.printerIpController,
    required this.printerPortController,
  }) : _commandApi = CommandApi();

  /// QR 코드 요청 및 저장
  Future<void> fetchAndSaveQrCodes(int count, int selectedTabIndex) async {
    try {
      // 1. 토큰 발급
      final token = await _apiService.serverCommunicationService.getToken(count, 27);

      // 2. QR 코드 요청
      final qrListResponse = await _apiService.serverCommunicationService.getQrCode(count, token);
      await saveQrCodes(selectedTabIndex, qrListResponse.result);
      currentQRIndex = 0;
    } catch (e) {
      debugPrint('Error fetching QR codes: $e');
      Logger().e(e);
      rethrow;
    }
  }

  /// QR 코드 프린터로 전송
  Future<void> sendQrCodesToPrinter(int selectedTabIndex) async {
    try {
      // 저장된 QR 코드 불러오기
      final savedCodes = await loadQrCodes(selectedTabIndex);
      if (savedCodes == null || savedCodes.isEmpty) {
        throw StateError('No QR codes found in storage');
      }

      final tabController = tabControllers[selectedTabIndex];
      final service = tabController.socketConnectService;

      if (service == null || !tabController.isPrinterConnected) {
        throw StateError('Printer not connected');
      }
    } catch (e) {
      debugPrint('Error sending QR codes to printer: $e');
      Logger().e(e);
      rethrow;
    }
  }

  /// 기존 fetchQrcodes 메서드 수정
  Future<void> fetchQrcodes(int count, int selectedTabIndex) async {
    try {
      amountCount = count;
      isReturnToken = false;
      // 3. QR 코드 요청 및 저장
      await fetchAndSaveQrCodes(count, selectedTabIndex);
      await Future.delayed(const Duration(seconds: 1));
      // 4. QR 코드 프린터로 전송
      await sendQrCodesToPrinter(selectedTabIndex);
    } catch (e) {
      debugPrint('Error in fetchQrcodes: $e');
      Logger().e(e);
      rethrow;
    }
  }

  /// 프린터 시작 설정
  Future<void> startPrint(int tabIndex) async {
    if (!_isValidTabIndex(tabIndex)) {
      throw ArgumentError('Invalid tab index: $tabIndex');
    }
    //상태 조회 결과값 추가
    // await requestStatus(tabIndex);

    final tabController = tabControllers[tabIndex];
    final service = tabController.socketConnectService;

    if (service == null) {
      throw StateError('Printer not connected');
    }

    try {
      await _commandApi.startPrint(service);
    } catch (e) {
      debugPrint('Failed to stop printer: $e');
      Logger().e(e);
      rethrow;
    }
  }

  /// 프린터 중지
  Future<void> stopPrint(int tabIndex) async {
    if (!_isValidTabIndex(tabIndex)) {
      throw ArgumentError('Invalid tab index: $tabIndex');
    }
    //상태 조회 결과값 추가
    // await requestStatus(tabIndex);

    final tabController = tabControllers[tabIndex];
    final service = tabController.socketConnectService;

    if (service == null) {
      throw StateError('Printer not connected');
    }

    try {
      await _commandApi.stopPrint(service);
    } catch (e) {
      debugPrint('Failed to stop printer: $e');
      Logger().e(e);
      rethrow;
    }
  }

  /// 프린터 시작 설정
  Future<void> getPrintList(int tabIndex) async {
    if (!_isValidTabIndex(tabIndex)) {
      throw ArgumentError('Invalid tab index: $tabIndex');
    }
    //상태 조회 결과값 추가
    // await requestStatus(tabIndex);

    final tabController = tabControllers[tabIndex];
    final service = tabController.socketConnectService;

    if (service == null) {
      throw StateError('Printer not connected');
    }

    try {
      await _commandApi.getPrintList(service);
    } catch (e) {
      debugPrint('Failed to stop printer: $e');
      Logger().e(e);
      rethrow;
    }
  }

  /// 프린터 시작 설정
  Future<void> clearCache(int tabIndex) async {
    if (!_isValidTabIndex(tabIndex)) {
      throw ArgumentError('Invalid tab index: $tabIndex');
    }
    //상태 조회 결과값 추가
    // await requestStatus(tabIndex);

    final tabController = tabControllers[tabIndex];
    final service = tabController.socketConnectService;

    if (service == null) {
      throw StateError('Printer not connected');
    }

    try {
      await _commandApi.clearCache(service);
    } catch (e) {
      debugPrint('Failed to stop printer: $e');
      Logger().e(e);
      rethrow;
    }
  }

  /// 프린터 시작 설정
  Future<void> getPrinterStatus(int tabIndex) async {
    if (!_isValidTabIndex(tabIndex)) {
      throw ArgumentError('Invalid tab index: $tabIndex');
    }
    //상태 조회 결과값 추가
    // await requestStatus(tabIndex);

    final tabController = tabControllers[tabIndex];
    final service = tabController.socketConnectService;

    if (service == null) {
      throw StateError('Printer not connected');
    }

    try {
      await _commandApi.getPrinterStatus(service);
    } catch (e) {
      debugPrint('Failed to stop printer: $e');
      Logger().e(e);
      rethrow;
    }
  }

  /// 프린터 시작 설정
  Future<void> clearErrorState(int tabIndex) async {
    if (!_isValidTabIndex(tabIndex)) {
      throw ArgumentError('Invalid tab index: $tabIndex');
    }
    //상태 조회 결과값 추가
    // await requestStatus(tabIndex);

    final tabController = tabControllers[tabIndex];
    final service = tabController.socketConnectService;

    if (service == null) {
      throw StateError('Printer not connected');
    }

    try {
      await _commandApi.clearErrorState(service);
    } catch (e) {
      debugPrint('Failed to stop printer: $e');
      Logger().e(e);
      rethrow;
    }
  }

  /// 프린터 상태 조회
  // Future<void> requestStatus(int tabIndex) async {
  //   if (!_isValidTabIndex(tabIndex)) {
  //     throw ArgumentError('Invalid tab index: $tabIndex');
  //   }

  //   final tabController = tabControllers[tabIndex];
  //   final service = tabController.socketConnectService;

  //   if (service == null) {
  //     throw StateError('Printer not connected');
  //   }

  //   try {
  //     await CommandApi.requestStatus(service);
  //   } catch (e) {
  //     debugPrint('Failed to stop printer: $e');
  //     Logger().e(e);
  //     rethrow;
  //   }
  // }

  /// 탭 인덱스 유효성 검사
  bool _isValidTabIndex(int index) {
    return index >= 0 && index < tabControllers.length;
  }

  Future<void> returnTokens(int tabIndex) async {
    isReturnToken = true;
    try {
      //상태 조회 결과값 추가
      // await requestStatus(tabIndex);

      // 저장된 QR 코드 불러오기
      final savedCodes = await loadQrCodes(tabIndex);
      if (savedCodes != null && savedCodes.isNotEmpty) {
        final token = await _apiService.serverCommunicationService.getToken(savedCodes.length, 1);
        final success = await _apiService.serverCommunicationService.returnToken(token);

        if (success) {
          await stopPrint(tabIndex); // 토큰 반환 성공 후 프린터 중지
          // 로컬 저장소에서 QR 코드 삭제
          final prefs = await SharedPreferences.getInstance();
          await prefs.remove('qr_codes_$tabIndex');
          currentQRIndex = 0;
        } else {
          throw Exception('토큰 반환 실패');
        }
      }
    } catch (e) {
      debugPrint('리턴 토큰 실패: $e');
      Logger().e(e);
    }
  }

  Future<void> requestGetProductList(int tabIndex) async {
    try {
      final companyNumber = 95;
      final products = await _apiService.serverCommunicationService.getProductList(companyNumber);
      serverProducts = products; // 서버에서 받은 제품 목록으로 업데이트
      notifyListeners();
    } catch (e) {
      debugPrint('Error fetching product list: $e');
      Logger().e(e);
      rethrow;
    }
  }

  // 제품 목록 가져오기
  List<ServerProduct> getProductList() {
    return serverProducts;
  }

  // 특정 제품 찾기
  ServerProduct? findProduct(String productNo) {
    try {
      return serverProducts.firstWhere((product) => product.no == productNo);
    } catch (e) {
      return null;
    }
  }

  Future<void> connectPrinter(String ip, String portText) async {
    debugPrint('입력된 IP: "$ip", 입력된 Port: "$portText"');
    try {
      final port = int.parse(portText);
      debugPrint('프린터 연결 시도: IP = $ip, Port = $port');

      qrMarkingConnectService =
          SocketConnectService(ipAddress: ip, port: port, homePageController: this);
      await qrMarkingConnectService!.connect(ip, port);

      isPrinterConnected = true;
      Logger().d("연결 되었습니다. $isPrinterConnected");

      notifyListeners();
    } catch (e) {
      debugPrint('Error connecting to printer: $e');
      isPrinterConnected = false;
      notifyListeners();
    }
  }

  void disconnectPrinter() {
    qrMarkingConnectService?.disconnect();
    qrMarkingConnectService = null;
    isPrinterConnected = false;
    Logger().d("연결 해제 되었습니다. $isPrinterConnected");
    notifyListeners();
  }

  // 탭 추가 메서드
  void addTab(TabItemController controller) {
    tabControllers.add(controller);
    notifyListeners();
  }

  // 탭 제거 메서드
  void removeTab(int index) {
    if (index < tabControllers.length) {
      tabControllers[index].disconnectPrinter(); // 연결 해제
      tabControllers.removeAt(index);
      notifyListeners();
    }
  }

  // QR 코드 저장
  Future<void> saveQrCodes(int tabIndex, List<QrResponse> codes) async {
    final prefs = await SharedPreferences.getInstance();
    final codesJson = codes.map((code) => code.toJson()).toList();
    await prefs.setString('qr_codes_$tabIndex', jsonEncode(codesJson));
  }

  // QR 코드 불러오기
  Future<List<QrResponse>?> loadQrCodes(int tabIndex) async {
    final prefs = await SharedPreferences.getInstance();
    final codesJson = prefs.getString('qr_codes_$tabIndex');
    if (codesJson != null) {
      final List<dynamic> decoded = jsonDecode(codesJson);
      return decoded.map((json) => QrResponse.fromJson(json)).toList();
    }
    return null;
  }

  /// QR 코드 재전송
  Future<void> resendQrcodes(int count, int selectedTabIndex) async {
    try {
      // 3. 새로운 QR 코드 요청 및 저장
      await fetchAndSaveQrCodes(count, selectedTabIndex);
      await Future.delayed(const Duration(seconds: 1));

      // 4. QR 코드 프린터로 전송
      await sendQrCodesToPrinter(selectedTabIndex);
    } catch (e) {
      debugPrint('Error resending QR codes: $e');
      Logger().e(e);
      rethrow;
    }
  }
}
