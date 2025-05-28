import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:qr_forwarder/common/api_services/api/qr_api.dart';
// import 'package:qr_forwarder/common/models/qr_list_response.dart';
// import 'package:qr_forwarder/common/models/token_response.dart';
// import 'package:qr_forwarder/common/models/product_list_response.dart';
// import 'package:qr_forwarder/common/models/common_response.dart';
import 'package:qr_forwarder/common/models/server_product.dart';
import 'package:qr_forwarder/common/models/qr_list_response.dart';

class ServerCommunicationService {
  final QrApi api;
  ServerCommunicationService(this.api);

  Future<QrListResponse> getQrCode(int count, String token) async {
    try {
      final response = await api.getQrCodes(count, token);
      if (response.status == "OK") {
        return response;
      }
      throw Exception(response.result.toString());
    } on DioException catch (e) {
      Logger().d(e.response);
      rethrow;
    }
  }

  Future<String> getToken(int count, int productType) async {
    try {
      final response = await api.getToken(count, productType);
      if (response.status == "OK") {
        return response.result;
      }
      throw Exception(response.result);
    } on DioException catch (e) {
      Logger().d(e.response);
      rethrow;
    }
  }

  Future<List<ServerProduct>> getProductList(int companyNumber) async {
    try {
      final response = await api.getProductList(companyNumber);
      if (response.status == "OK") {
        return response.result;
      }
      throw Exception(response.result.toString());
    } on DioException catch (e) {
      Logger().d(e.response);
      rethrow;
    }
  }

  Future<bool> returnToken(String token) async {
    try {
      final response = await api.returnToken(token);
      return response.status == "OK";
    } on DioException catch (e) {
      Logger().d(e.response);
      rethrow;
    }
  }
}
