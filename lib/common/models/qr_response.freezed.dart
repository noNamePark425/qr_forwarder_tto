// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qr_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QrResponse _$QrResponseFromJson(Map<String, dynamic> json) {
  return _QrResponse.fromJson(json);
}

/// @nodoc
mixin _$QrResponse {
  String get qrcode => throw _privateConstructorUsedError;
  String get number => throw _privateConstructorUsedError;

  /// Serializes this QrResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QrResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QrResponseCopyWith<QrResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QrResponseCopyWith<$Res> {
  factory $QrResponseCopyWith(
          QrResponse value, $Res Function(QrResponse) then) =
      _$QrResponseCopyWithImpl<$Res, QrResponse>;
  @useResult
  $Res call({String qrcode, String number});
}

/// @nodoc
class _$QrResponseCopyWithImpl<$Res, $Val extends QrResponse>
    implements $QrResponseCopyWith<$Res> {
  _$QrResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QrResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qrcode = null,
    Object? number = null,
  }) {
    return _then(_value.copyWith(
      qrcode: null == qrcode
          ? _value.qrcode
          : qrcode // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QrResponseImplCopyWith<$Res>
    implements $QrResponseCopyWith<$Res> {
  factory _$$QrResponseImplCopyWith(
          _$QrResponseImpl value, $Res Function(_$QrResponseImpl) then) =
      __$$QrResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String qrcode, String number});
}

/// @nodoc
class __$$QrResponseImplCopyWithImpl<$Res>
    extends _$QrResponseCopyWithImpl<$Res, _$QrResponseImpl>
    implements _$$QrResponseImplCopyWith<$Res> {
  __$$QrResponseImplCopyWithImpl(
      _$QrResponseImpl _value, $Res Function(_$QrResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of QrResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qrcode = null,
    Object? number = null,
  }) {
    return _then(_$QrResponseImpl(
      qrcode: null == qrcode
          ? _value.qrcode
          : qrcode // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QrResponseImpl implements _QrResponse {
  const _$QrResponseImpl({required this.qrcode, required this.number});

  factory _$QrResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$QrResponseImplFromJson(json);

  @override
  final String qrcode;
  @override
  final String number;

  @override
  String toString() {
    return 'QrResponse(qrcode: $qrcode, number: $number)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QrResponseImpl &&
            (identical(other.qrcode, qrcode) || other.qrcode == qrcode) &&
            (identical(other.number, number) || other.number == number));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, qrcode, number);

  /// Create a copy of QrResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QrResponseImplCopyWith<_$QrResponseImpl> get copyWith =>
      __$$QrResponseImplCopyWithImpl<_$QrResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QrResponseImplToJson(
      this,
    );
  }
}

abstract class _QrResponse implements QrResponse {
  const factory _QrResponse(
      {required final String qrcode,
      required final String number}) = _$QrResponseImpl;

  factory _QrResponse.fromJson(Map<String, dynamic> json) =
      _$QrResponseImpl.fromJson;

  @override
  String get qrcode;
  @override
  String get number;

  /// Create a copy of QrResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QrResponseImplCopyWith<_$QrResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
