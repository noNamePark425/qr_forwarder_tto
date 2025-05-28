import 'package:dio/dio.dart';
import 'package:qr_forwarder/common/api_services/api/qr_api.dart';
import 'package:qr_forwarder/common/api_services/server_communication_service.dart';
import 'package:qr_forwarder/common/constants/app_constants.dart';

class ApiService {
  static final ApiService _instance = ApiService._internal();

  factory ApiService() => _instance;

  late Dio dio;

  late final ServerCommunicationService serverCommunicationService;

  ApiService._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.baseUrl,
        connectTimeout: const Duration(seconds: 50),
        receiveTimeout: const Duration(seconds: 50),
      ),
    );

    dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      responseBody: true,
      error: true,
    ));

    final qrApi = QrApi(dio);
    serverCommunicationService = ServerCommunicationService(qrApi);

    // final signupApi = SignupApi(dio);
    // signupService = SignupService(signupApi);
  }

  void clearHeaders() {
    dio.options.headers.clear();
  }
}
