// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'server_product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ServerProduct _$ServerProductFromJson(Map<String, dynamic> json) {
  return _ServerProduct.fromJson(json);
}

/// @nodoc
mixin _$ServerProduct {
  String get no => throw _privateConstructorUsedError;
  @JsonKey(name: 'company_no')
  String get companyNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'prod_type')
  String get prodType => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_qr')
  String get totalQr => throw _privateConstructorUsedError;
  @JsonKey(name: 'publish_qr')
  String get publishQr => throw _privateConstructorUsedError;
  @JsonKey(name: 'free_qr')
  String get freeQr => throw _privateConstructorUsedError;
  String get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'class')
  String get unit => throw _privateConstructorUsedError;
  @JsonKey(name: 'creation_date')
  String get creationDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_date')
  String? get updatedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'menu_name')
  String? get menuName => throw _privateConstructorUsedError;

  /// Serializes this ServerProduct to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ServerProduct
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ServerProductCopyWith<ServerProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerProductCopyWith<$Res> {
  factory $ServerProductCopyWith(
          ServerProduct value, $Res Function(ServerProduct) then) =
      _$ServerProductCopyWithImpl<$Res, ServerProduct>;
  @useResult
  $Res call(
      {String no,
      @JsonKey(name: 'company_no') String companyNo,
      @JsonKey(name: 'prod_type') String prodType,
      @JsonKey(name: 'total_qr') String totalQr,
      @JsonKey(name: 'publish_qr') String publishQr,
      @JsonKey(name: 'free_qr') String freeQr,
      String amount,
      @JsonKey(name: 'class') String unit,
      @JsonKey(name: 'creation_date') String creationDate,
      @JsonKey(name: 'updated_date') String? updatedDate,
      @JsonKey(name: 'menu_name') String? menuName});
}

/// @nodoc
class _$ServerProductCopyWithImpl<$Res, $Val extends ServerProduct>
    implements $ServerProductCopyWith<$Res> {
  _$ServerProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ServerProduct
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? no = null,
    Object? companyNo = null,
    Object? prodType = null,
    Object? totalQr = null,
    Object? publishQr = null,
    Object? freeQr = null,
    Object? amount = null,
    Object? unit = null,
    Object? creationDate = null,
    Object? updatedDate = freezed,
    Object? menuName = freezed,
  }) {
    return _then(_value.copyWith(
      no: null == no
          ? _value.no
          : no // ignore: cast_nullable_to_non_nullable
              as String,
      companyNo: null == companyNo
          ? _value.companyNo
          : companyNo // ignore: cast_nullable_to_non_nullable
              as String,
      prodType: null == prodType
          ? _value.prodType
          : prodType // ignore: cast_nullable_to_non_nullable
              as String,
      totalQr: null == totalQr
          ? _value.totalQr
          : totalQr // ignore: cast_nullable_to_non_nullable
              as String,
      publishQr: null == publishQr
          ? _value.publishQr
          : publishQr // ignore: cast_nullable_to_non_nullable
              as String,
      freeQr: null == freeQr
          ? _value.freeQr
          : freeQr // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      creationDate: null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as String,
      updatedDate: freezed == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      menuName: freezed == menuName
          ? _value.menuName
          : menuName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServerProductImplCopyWith<$Res>
    implements $ServerProductCopyWith<$Res> {
  factory _$$ServerProductImplCopyWith(
          _$ServerProductImpl value, $Res Function(_$ServerProductImpl) then) =
      __$$ServerProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String no,
      @JsonKey(name: 'company_no') String companyNo,
      @JsonKey(name: 'prod_type') String prodType,
      @JsonKey(name: 'total_qr') String totalQr,
      @JsonKey(name: 'publish_qr') String publishQr,
      @JsonKey(name: 'free_qr') String freeQr,
      String amount,
      @JsonKey(name: 'class') String unit,
      @JsonKey(name: 'creation_date') String creationDate,
      @JsonKey(name: 'updated_date') String? updatedDate,
      @JsonKey(name: 'menu_name') String? menuName});
}

/// @nodoc
class __$$ServerProductImplCopyWithImpl<$Res>
    extends _$ServerProductCopyWithImpl<$Res, _$ServerProductImpl>
    implements _$$ServerProductImplCopyWith<$Res> {
  __$$ServerProductImplCopyWithImpl(
      _$ServerProductImpl _value, $Res Function(_$ServerProductImpl) _then)
      : super(_value, _then);

  /// Create a copy of ServerProduct
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? no = null,
    Object? companyNo = null,
    Object? prodType = null,
    Object? totalQr = null,
    Object? publishQr = null,
    Object? freeQr = null,
    Object? amount = null,
    Object? unit = null,
    Object? creationDate = null,
    Object? updatedDate = freezed,
    Object? menuName = freezed,
  }) {
    return _then(_$ServerProductImpl(
      no: null == no
          ? _value.no
          : no // ignore: cast_nullable_to_non_nullable
              as String,
      companyNo: null == companyNo
          ? _value.companyNo
          : companyNo // ignore: cast_nullable_to_non_nullable
              as String,
      prodType: null == prodType
          ? _value.prodType
          : prodType // ignore: cast_nullable_to_non_nullable
              as String,
      totalQr: null == totalQr
          ? _value.totalQr
          : totalQr // ignore: cast_nullable_to_non_nullable
              as String,
      publishQr: null == publishQr
          ? _value.publishQr
          : publishQr // ignore: cast_nullable_to_non_nullable
              as String,
      freeQr: null == freeQr
          ? _value.freeQr
          : freeQr // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      creationDate: null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as String,
      updatedDate: freezed == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      menuName: freezed == menuName
          ? _value.menuName
          : menuName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServerProductImpl implements _ServerProduct {
  const _$ServerProductImpl(
      {required this.no,
      @JsonKey(name: 'company_no') required this.companyNo,
      @JsonKey(name: 'prod_type') required this.prodType,
      @JsonKey(name: 'total_qr') required this.totalQr,
      @JsonKey(name: 'publish_qr') required this.publishQr,
      @JsonKey(name: 'free_qr') required this.freeQr,
      required this.amount,
      @JsonKey(name: 'class') required this.unit,
      @JsonKey(name: 'creation_date') required this.creationDate,
      @JsonKey(name: 'updated_date') this.updatedDate,
      @JsonKey(name: 'menu_name') this.menuName});

  factory _$ServerProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServerProductImplFromJson(json);

  @override
  final String no;
  @override
  @JsonKey(name: 'company_no')
  final String companyNo;
  @override
  @JsonKey(name: 'prod_type')
  final String prodType;
  @override
  @JsonKey(name: 'total_qr')
  final String totalQr;
  @override
  @JsonKey(name: 'publish_qr')
  final String publishQr;
  @override
  @JsonKey(name: 'free_qr')
  final String freeQr;
  @override
  final String amount;
  @override
  @JsonKey(name: 'class')
  final String unit;
  @override
  @JsonKey(name: 'creation_date')
  final String creationDate;
  @override
  @JsonKey(name: 'updated_date')
  final String? updatedDate;
  @override
  @JsonKey(name: 'menu_name')
  final String? menuName;

  @override
  String toString() {
    return 'ServerProduct(no: $no, companyNo: $companyNo, prodType: $prodType, totalQr: $totalQr, publishQr: $publishQr, freeQr: $freeQr, amount: $amount, unit: $unit, creationDate: $creationDate, updatedDate: $updatedDate, menuName: $menuName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerProductImpl &&
            (identical(other.no, no) || other.no == no) &&
            (identical(other.companyNo, companyNo) ||
                other.companyNo == companyNo) &&
            (identical(other.prodType, prodType) ||
                other.prodType == prodType) &&
            (identical(other.totalQr, totalQr) || other.totalQr == totalQr) &&
            (identical(other.publishQr, publishQr) ||
                other.publishQr == publishQr) &&
            (identical(other.freeQr, freeQr) || other.freeQr == freeQr) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.creationDate, creationDate) ||
                other.creationDate == creationDate) &&
            (identical(other.updatedDate, updatedDate) ||
                other.updatedDate == updatedDate) &&
            (identical(other.menuName, menuName) ||
                other.menuName == menuName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, no, companyNo, prodType, totalQr,
      publishQr, freeQr, amount, unit, creationDate, updatedDate, menuName);

  /// Create a copy of ServerProduct
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerProductImplCopyWith<_$ServerProductImpl> get copyWith =>
      __$$ServerProductImplCopyWithImpl<_$ServerProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServerProductImplToJson(
      this,
    );
  }
}

abstract class _ServerProduct implements ServerProduct {
  const factory _ServerProduct(
          {required final String no,
          @JsonKey(name: 'company_no') required final String companyNo,
          @JsonKey(name: 'prod_type') required final String prodType,
          @JsonKey(name: 'total_qr') required final String totalQr,
          @JsonKey(name: 'publish_qr') required final String publishQr,
          @JsonKey(name: 'free_qr') required final String freeQr,
          required final String amount,
          @JsonKey(name: 'class') required final String unit,
          @JsonKey(name: 'creation_date') required final String creationDate,
          @JsonKey(name: 'updated_date') final String? updatedDate,
          @JsonKey(name: 'menu_name') final String? menuName}) =
      _$ServerProductImpl;

  factory _ServerProduct.fromJson(Map<String, dynamic> json) =
      _$ServerProductImpl.fromJson;

  @override
  String get no;
  @override
  @JsonKey(name: 'company_no')
  String get companyNo;
  @override
  @JsonKey(name: 'prod_type')
  String get prodType;
  @override
  @JsonKey(name: 'total_qr')
  String get totalQr;
  @override
  @JsonKey(name: 'publish_qr')
  String get publishQr;
  @override
  @JsonKey(name: 'free_qr')
  String get freeQr;
  @override
  String get amount;
  @override
  @JsonKey(name: 'class')
  String get unit;
  @override
  @JsonKey(name: 'creation_date')
  String get creationDate;
  @override
  @JsonKey(name: 'updated_date')
  String? get updatedDate;
  @override
  @JsonKey(name: 'menu_name')
  String? get menuName;

  /// Create a copy of ServerProduct
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServerProductImplCopyWith<_$ServerProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
