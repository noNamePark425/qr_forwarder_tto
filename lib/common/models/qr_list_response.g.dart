// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QrListResponseImpl _$$QrListResponseImplFromJson(Map<String, dynamic> json) =>
    _$QrListResponseImpl(
      status: json['status'] as String,
      result: (json['result'] as List<dynamic>)
          .map((e) => QrResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$QrListResponseImplToJson(
        _$QrListResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.result,
    };
