// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServerProductImpl _$$ServerProductImplFromJson(Map<String, dynamic> json) =>
    _$ServerProductImpl(
      no: json['no'] as String,
      companyNo: json['company_no'] as String,
      prodType: json['prod_type'] as String,
      totalQr: json['total_qr'] as String,
      publishQr: json['publish_qr'] as String,
      freeQr: json['free_qr'] as String,
      amount: json['amount'] as String,
      unit: json['class'] as String,
      creationDate: json['creation_date'] as String,
      updatedDate: json['updated_date'] as String?,
      menuName: json['menu_name'] as String?,
    );

Map<String, dynamic> _$$ServerProductImplToJson(_$ServerProductImpl instance) =>
    <String, dynamic>{
      'no': instance.no,
      'company_no': instance.companyNo,
      'prod_type': instance.prodType,
      'total_qr': instance.totalQr,
      'publish_qr': instance.publishQr,
      'free_qr': instance.freeQr,
      'amount': instance.amount,
      'class': instance.unit,
      'creation_date': instance.creationDate,
      'updated_date': instance.updatedDate,
      'menu_name': instance.menuName,
    };
