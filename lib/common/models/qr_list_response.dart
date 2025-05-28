import 'package:freezed_annotation/freezed_annotation.dart';
import 'qr_response.dart';

part 'qr_list_response.freezed.dart';
part 'qr_list_response.g.dart';

@freezed
class QrListResponse with _$QrListResponse {
  const factory QrListResponse({
    required String status,
    required List<QrResponse> result,
  }) = _QrListResponse;

  factory QrListResponse.fromJson(Map<String, dynamic> json) => _$QrListResponseFromJson(json);
}
