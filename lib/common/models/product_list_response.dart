import 'package:freezed_annotation/freezed_annotation.dart';
import 'server_product.dart';

part 'product_list_response.freezed.dart';
part 'product_list_response.g.dart';

@freezed
class ProductListResponse with _$ProductListResponse {
  const factory ProductListResponse({
    required String status,
    required List<ServerProduct> result,
  }) = _ProductListResponse;

  factory ProductListResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductListResponseFromJson(json);
}
