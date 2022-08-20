// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'more_view_count_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MoreViewCountResponse _$MoreViewCountResponseFromJson(
    Map<String, dynamic> json) {
  return _MoreViewCountResponse.fromJson(json);
}

/// @nodoc
mixin _$MoreViewCountResponse {
  int get storeCnt => throw _privateConstructorUsedError;
  int get reviewCnt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MoreViewCountResponseCopyWith<MoreViewCountResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoreViewCountResponseCopyWith<$Res> {
  factory $MoreViewCountResponseCopyWith(MoreViewCountResponse value,
          $Res Function(MoreViewCountResponse) then) =
      _$MoreViewCountResponseCopyWithImpl<$Res>;
  $Res call({int storeCnt, int reviewCnt});
}

/// @nodoc
class _$MoreViewCountResponseCopyWithImpl<$Res>
    implements $MoreViewCountResponseCopyWith<$Res> {
  _$MoreViewCountResponseCopyWithImpl(this._value, this._then);

  final MoreViewCountResponse _value;
  // ignore: unused_field
  final $Res Function(MoreViewCountResponse) _then;

  @override
  $Res call({
    Object? storeCnt = freezed,
    Object? reviewCnt = freezed,
  }) {
    return _then(_value.copyWith(
      storeCnt: storeCnt == freezed
          ? _value.storeCnt
          : storeCnt // ignore: cast_nullable_to_non_nullable
              as int,
      reviewCnt: reviewCnt == freezed
          ? _value.reviewCnt
          : reviewCnt // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_MoreViewCountResponseCopyWith<$Res>
    implements $MoreViewCountResponseCopyWith<$Res> {
  factory _$$_MoreViewCountResponseCopyWith(_$_MoreViewCountResponse value,
          $Res Function(_$_MoreViewCountResponse) then) =
      __$$_MoreViewCountResponseCopyWithImpl<$Res>;
  @override
  $Res call({int storeCnt, int reviewCnt});
}

/// @nodoc
class __$$_MoreViewCountResponseCopyWithImpl<$Res>
    extends _$MoreViewCountResponseCopyWithImpl<$Res>
    implements _$$_MoreViewCountResponseCopyWith<$Res> {
  __$$_MoreViewCountResponseCopyWithImpl(_$_MoreViewCountResponse _value,
      $Res Function(_$_MoreViewCountResponse) _then)
      : super(_value, (v) => _then(v as _$_MoreViewCountResponse));

  @override
  _$_MoreViewCountResponse get _value =>
      super._value as _$_MoreViewCountResponse;

  @override
  $Res call({
    Object? storeCnt = freezed,
    Object? reviewCnt = freezed,
  }) {
    return _then(_$_MoreViewCountResponse(
      storeCnt: storeCnt == freezed
          ? _value.storeCnt
          : storeCnt // ignore: cast_nullable_to_non_nullable
              as int,
      reviewCnt: reviewCnt == freezed
          ? _value.reviewCnt
          : reviewCnt // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MoreViewCountResponse implements _MoreViewCountResponse {
  _$_MoreViewCountResponse({required this.storeCnt, required this.reviewCnt});

  factory _$_MoreViewCountResponse.fromJson(Map<String, dynamic> json) =>
      _$$_MoreViewCountResponseFromJson(json);

  @override
  final int storeCnt;
  @override
  final int reviewCnt;

  @override
  String toString() {
    return 'MoreViewCountResponse(storeCnt: $storeCnt, reviewCnt: $reviewCnt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MoreViewCountResponse &&
            const DeepCollectionEquality().equals(other.storeCnt, storeCnt) &&
            const DeepCollectionEquality().equals(other.reviewCnt, reviewCnt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(storeCnt),
      const DeepCollectionEquality().hash(reviewCnt));

  @JsonKey(ignore: true)
  @override
  _$$_MoreViewCountResponseCopyWith<_$_MoreViewCountResponse> get copyWith =>
      __$$_MoreViewCountResponseCopyWithImpl<_$_MoreViewCountResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MoreViewCountResponseToJson(this);
  }
}

abstract class _MoreViewCountResponse implements MoreViewCountResponse {
  factory _MoreViewCountResponse(
      {required final int storeCnt,
      required final int reviewCnt}) = _$_MoreViewCountResponse;

  factory _MoreViewCountResponse.fromJson(Map<String, dynamic> json) =
      _$_MoreViewCountResponse.fromJson;

  @override
  int get storeCnt => throw _privateConstructorUsedError;
  @override
  int get reviewCnt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_MoreViewCountResponseCopyWith<_$_MoreViewCountResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
