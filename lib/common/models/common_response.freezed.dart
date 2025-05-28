// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'common_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CommonResponse _$CommonResponseFromJson(Map<String, dynamic> json) {
  return _CommonResponse.fromJson(json);
}

/// @nodoc
mixin _$CommonResponse {
  String get status => throw _privateConstructorUsedError;
  String get result => throw _privateConstructorUsedError;

  /// Serializes this CommonResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommonResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommonResponseCopyWith<CommonResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommonResponseCopyWith<$Res> {
  factory $CommonResponseCopyWith(
          CommonResponse value, $Res Function(CommonResponse) then) =
      _$CommonResponseCopyWithImpl<$Res, CommonResponse>;
  @useResult
  $Res call({String status, String result});
}

/// @nodoc
class _$CommonResponseCopyWithImpl<$Res, $Val extends CommonResponse>
    implements $CommonResponseCopyWith<$Res> {
  _$CommonResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommonResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? result = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommonResponseImplCopyWith<$Res>
    implements $CommonResponseCopyWith<$Res> {
  factory _$$CommonResponseImplCopyWith(_$CommonResponseImpl value,
          $Res Function(_$CommonResponseImpl) then) =
      __$$CommonResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, String result});
}

/// @nodoc
class __$$CommonResponseImplCopyWithImpl<$Res>
    extends _$CommonResponseCopyWithImpl<$Res, _$CommonResponseImpl>
    implements _$$CommonResponseImplCopyWith<$Res> {
  __$$CommonResponseImplCopyWithImpl(
      _$CommonResponseImpl _value, $Res Function(_$CommonResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommonResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? result = null,
  }) {
    return _then(_$CommonResponseImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommonResponseImpl implements _CommonResponse {
  const _$CommonResponseImpl({required this.status, required this.result});

  factory _$CommonResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommonResponseImplFromJson(json);

  @override
  final String status;
  @override
  final String result;

  @override
  String toString() {
    return 'CommonResponse(status: $status, result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommonResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.result, result) || other.result == result));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, result);

  /// Create a copy of CommonResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommonResponseImplCopyWith<_$CommonResponseImpl> get copyWith =>
      __$$CommonResponseImplCopyWithImpl<_$CommonResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommonResponseImplToJson(
      this,
    );
  }
}

abstract class _CommonResponse implements CommonResponse {
  const factory _CommonResponse(
      {required final String status,
      required final String result}) = _$CommonResponseImpl;

  factory _CommonResponse.fromJson(Map<String, dynamic> json) =
      _$CommonResponseImpl.fromJson;

  @override
  String get status;
  @override
  String get result;

  /// Create a copy of CommonResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommonResponseImplCopyWith<_$CommonResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
