import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:qr_forwarder/common/models/qr_list_response.dart';
import 'package:qr_forwarder/common/models/token_response.dart';
import 'package:qr_forwarder/common/models/product_list_response.dart';
import 'package:qr_forwarder/common/models/common_response.dart';
// import 'package:qr_forwarder/common/models/product_list_response.dart';

part 'qr_api.g.dart';

// 서버 통신용 API
// @RestApi(baseUrl: "https://dev.trashbag-trace.com")
@RestApi(baseUrl: "https://dcwon.trashbag-trace.com")
abstract class QrApi {
  factory QrApi(Dio dio, {String baseUrl}) = _QrApi;

  @GET("/api/V3/get_qr")
  Future<QrListResponse> getQrCodes(
    @Query("cnt") int count,
    @Query("token") String token,
  );

  @GET("/api/V3/get_token")
  Future<TokenResponse> getToken(
    @Query("cnt") int count,
    @Query("prod_type") int productType,
  );

  @GET("/api/V3/product_list")
  Future<ProductListResponse> getProductList(
    @Query("company_no") int companyNumber,
  );

  @POST("/api/V3/return_token")
  Future<CommonResponse> returnToken(
    @Query("token") String token,
  );
}
