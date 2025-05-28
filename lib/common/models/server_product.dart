import 'package:freezed_annotation/freezed_annotation.dart';

part 'server_product.freezed.dart';
part 'server_product.g.dart';

@freezed
class ServerProduct with _$ServerProduct {
  const factory ServerProduct({
    required String no,
    @JsonKey(name: 'company_no') required String companyNo,
    @JsonKey(name: 'prod_type') required String prodType,
    @JsonKey(name: 'total_qr') required String totalQr,
    @JsonKey(name: 'publish_qr') required String publishQr,
    @JsonKey(name: 'free_qr') required String freeQr,
    required String amount,
    @JsonKey(name: 'class') required String unit,
    @JsonKey(name: 'creation_date') required String creationDate,
    @JsonKey(name: 'updated_date') String? updatedDate,
    @JsonKey(name: 'menu_name') String? menuName,
  }) = _ServerProduct;

  factory ServerProduct.fromJson(Map<String, dynamic> json) => _$ServerProductFromJson(json);
}
