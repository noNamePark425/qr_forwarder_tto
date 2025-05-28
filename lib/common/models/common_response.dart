// 파일명: qr_response.dart
import 'package:freezed_annotation/freezed_annotation.dart';

// Freezed 코드 생성용
part 'common_response.freezed.dart';

// JsonSerializable 코드 생성용
part 'common_response.g.dart';

@freezed
// QR 응답 모델 클래스
class CommonResponse with _$CommonResponse {
  const factory CommonResponse({
    required String status,
    required String result,
  }) = _CommonResponse;

  factory CommonResponse.fromJson(Map<String, dynamic> json) => _$CommonResponseFromJson(json);
}
