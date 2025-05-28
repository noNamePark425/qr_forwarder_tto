// 파일명: qr_response.dart
import 'package:freezed_annotation/freezed_annotation.dart';

// Freezed 코드 생성용
part 'qr_response.freezed.dart';

// JsonSerializable 코드 생성용
part 'qr_response.g.dart';

@freezed
// QR 응답 모델 클래스
class QrResponse with _$QrResponse {
  const factory QrResponse({
    required String qrcode,
    required String number,
  }) = _QrResponse;

  factory QrResponse.fromJson(Map<String, dynamic> json) => _$QrResponseFromJson(json);
}
