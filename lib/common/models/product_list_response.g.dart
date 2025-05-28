// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductListResponseImpl _$$ProductListResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductListResponseImpl(
      status: json['status'] as String,
      result: (json['result'] as List<dynamic>)
          .map((e) => ServerProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProductListResponseImplToJson(
        _$ProductListResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.result,
    };
