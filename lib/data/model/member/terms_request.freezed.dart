// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'terms_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TermsRequest _$TermsRequestFromJson(Map<String, dynamic> json) {
  return _TermsRequest.fromJson(json);
}

/// @nodoc
mixin _$TermsRequest {
  bool get isAgreeLocation => throw _privateConstructorUsedError;
  bool get isAgreeMarketingPush => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TermsRequestCopyWith<TermsRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TermsRequestCopyWith<$Res> {
  factory $TermsRequestCopyWith(
          TermsRequest value, $Res Function(TermsRequest) then) =
      _$TermsRequestCopyWithImpl<$Res, TermsRequest>;
  @useResult
  $Res call({bool isAgreeLocation, bool isAgreeMarketingPush});
}

/// @nodoc
class _$TermsRequestCopyWithImpl<$Res, $Val extends TermsRequest>
    implements $TermsRequestCopyWith<$Res> {
  _$TermsRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAgreeLocation = null,
    Object? isAgreeMarketingPush = null,
  }) {
    return _then(_value.copyWith(
      isAgreeLocation: null == isAgreeLocation
          ? _value.isAgreeLocation
          : isAgreeLocation // ignore: cast_nullable_to_non_nullable
              as bool,
      isAgreeMarketingPush: null == isAgreeMarketingPush
          ? _value.isAgreeMarketingPush
          : isAgreeMarketingPush // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TermsRequestCopyWith<$Res>
    implements $TermsRequestCopyWith<$Res> {
  factory _$$_TermsRequestCopyWith(
          _$_TermsRequest value, $Res Function(_$_TermsRequest) then) =
      __$$_TermsRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isAgreeLocation, bool isAgreeMarketingPush});
}

/// @nodoc
class __$$_TermsRequestCopyWithImpl<$Res>
    extends _$TermsRequestCopyWithImpl<$Res, _$_TermsRequest>
    implements _$$_TermsRequestCopyWith<$Res> {
  __$$_TermsRequestCopyWithImpl(
      _$_TermsRequest _value, $Res Function(_$_TermsRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAgreeLocation = null,
    Object? isAgreeMarketingPush = null,
  }) {
    return _then(_$_TermsRequest(
      isAgreeLocation: null == isAgreeLocation
          ? _value.isAgreeLocation
          : isAgreeLocation // ignore: cast_nullable_to_non_nullable
              as bool,
      isAgreeMarketingPush: null == isAgreeMarketingPush
          ? _value.isAgreeMarketingPush
          : isAgreeMarketingPush // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TermsRequest implements _TermsRequest {
  const _$_TermsRequest(
      {required this.isAgreeLocation, required this.isAgreeMarketingPush});

  factory _$_TermsRequest.fromJson(Map<String, dynamic> json) =>
      _$$_TermsRequestFromJson(json);

  @override
  final bool isAgreeLocation;
  @override
  final bool isAgreeMarketingPush;

  @override
  String toString() {
    return 'TermsRequest(isAgreeLocation: $isAgreeLocation, isAgreeMarketingPush: $isAgreeMarketingPush)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TermsRequest &&
            (identical(other.isAgreeLocation, isAgreeLocation) ||
                other.isAgreeLocation == isAgreeLocation) &&
            (identical(other.isAgreeMarketingPush, isAgreeMarketingPush) ||
                other.isAgreeMarketingPush == isAgreeMarketingPush));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, isAgreeLocation, isAgreeMarketingPush);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TermsRequestCopyWith<_$_TermsRequest> get copyWith =>
      __$$_TermsRequestCopyWithImpl<_$_TermsRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TermsRequestToJson(
      this,
    );
  }
}

abstract class _TermsRequest implements TermsRequest {
  const factory _TermsRequest(
      {required final bool isAgreeLocation,
      required final bool isAgreeMarketingPush}) = _$_TermsRequest;

  factory _TermsRequest.fromJson(Map<String, dynamic> json) =
      _$_TermsRequest.fromJson;

  @override
  bool get isAgreeLocation;
  @override
  bool get isAgreeMarketingPush;
  @override
  @JsonKey(ignore: true)
  _$$_TermsRequestCopyWith<_$_TermsRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
