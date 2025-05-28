// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductListResponse _$ProductListResponseFromJson(Map<String, dynamic> json) {
  return _ProductListResponse.fromJson(json);
}

/// @nodoc
mixin _$ProductListResponse {
  String get status => throw _privateConstructorUsedError;
  List<ServerProduct> get result => throw _privateConstructorUsedError;

  /// Serializes this ProductListResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductListResponseCopyWith<ProductListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductListResponseCopyWith<$Res> {
  factory $ProductListResponseCopyWith(
          ProductListResponse value, $Res Function(ProductListResponse) then) =
      _$ProductListResponseCopyWithImpl<$Res, ProductListResponse>;
  @useResult
  $Res call({String status, List<ServerProduct> result});
}

/// @nodoc
class _$ProductListResponseCopyWithImpl<$Res, $Val extends ProductListResponse>
    implements $ProductListResponseCopyWith<$Res> {
  _$ProductListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductListResponse
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
              as List<ServerProduct>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductListResponseImplCopyWith<$Res>
    implements $ProductListResponseCopyWith<$Res> {
  factory _$$ProductListResponseImplCopyWith(_$ProductListResponseImpl value,
          $Res Function(_$ProductListResponseImpl) then) =
      __$$ProductListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, List<ServerProduct> result});
}

/// @nodoc
class __$$ProductListResponseImplCopyWithImpl<$Res>
    extends _$ProductListResponseCopyWithImpl<$Res, _$ProductListResponseImpl>
    implements _$$ProductListResponseImplCopyWith<$Res> {
  __$$ProductListResponseImplCopyWithImpl(_$ProductListResponseImpl _value,
      $Res Function(_$ProductListResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? result = null,
  }) {
    return _then(_$ProductListResponseImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      result: null == result
          ? _value._result
          : result // ignore: cast_nullable_to_non_nullable
              as List<ServerProduct>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductListResponseImpl implements _ProductListResponse {
  const _$ProductListResponseImpl(
      {required this.status, required final List<ServerProduct> result})
      : _result = result;

  factory _$ProductListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductListResponseImplFromJson(json);

  @override
  final String status;
  final List<ServerProduct> _result;
  @override
  List<ServerProduct> get result {
    if (_result is EqualUnmodifiableListView) return _result;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_result);
  }

  @override
  String toString() {
    return 'ProductListResponse(status: $status, result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductListResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._result, _result));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_result));

  /// Create a copy of ProductListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductListResponseImplCopyWith<_$ProductListResponseImpl> get copyWith =>
      __$$ProductListResponseImplCopyWithImpl<_$ProductListResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductListResponseImplToJson(
      this,
    );
  }
}

abstract class _ProductListResponse implements ProductListResponse {
  const factory _ProductListResponse(
      {required final String status,
      required final List<ServerProduct> result}) = _$ProductListResponseImpl;

  factory _ProductListResponse.fromJson(Map<String, dynamic> json) =
      _$ProductListResponseImpl.fromJson;

  @override
  String get status;
  @override
  List<ServerProduct> get result;

  /// Create a copy of ProductListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductListResponseImplCopyWith<_$ProductListResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
