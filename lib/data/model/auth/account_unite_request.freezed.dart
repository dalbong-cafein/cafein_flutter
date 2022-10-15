// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'account_unite_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AccountUniteRequest _$AccountUniteRequestFromJson(Map<String, dynamic> json) {
  return _AccountUniteRequest.fromJson(json);
}

/// @nodoc
mixin _$AccountUniteRequest {
  String get newOauthId => throw _privateConstructorUsedError;
  String get newAuthProvider => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountUniteRequestCopyWith<AccountUniteRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountUniteRequestCopyWith<$Res> {
  factory $AccountUniteRequestCopyWith(
          AccountUniteRequest value, $Res Function(AccountUniteRequest) then) =
      _$AccountUniteRequestCopyWithImpl<$Res, AccountUniteRequest>;
  @useResult
  $Res call({String newOauthId, String newAuthProvider});
}

/// @nodoc
class _$AccountUniteRequestCopyWithImpl<$Res, $Val extends AccountUniteRequest>
    implements $AccountUniteRequestCopyWith<$Res> {
  _$AccountUniteRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newOauthId = null,
    Object? newAuthProvider = null,
  }) {
    return _then(_value.copyWith(
      newOauthId: null == newOauthId
          ? _value.newOauthId
          : newOauthId // ignore: cast_nullable_to_non_nullable
              as String,
      newAuthProvider: null == newAuthProvider
          ? _value.newAuthProvider
          : newAuthProvider // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AccountUniteRequestCopyWith<$Res>
    implements $AccountUniteRequestCopyWith<$Res> {
  factory _$$_AccountUniteRequestCopyWith(_$_AccountUniteRequest value,
          $Res Function(_$_AccountUniteRequest) then) =
      __$$_AccountUniteRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String newOauthId, String newAuthProvider});
}

/// @nodoc
class __$$_AccountUniteRequestCopyWithImpl<$Res>
    extends _$AccountUniteRequestCopyWithImpl<$Res, _$_AccountUniteRequest>
    implements _$$_AccountUniteRequestCopyWith<$Res> {
  __$$_AccountUniteRequestCopyWithImpl(_$_AccountUniteRequest _value,
      $Res Function(_$_AccountUniteRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newOauthId = null,
    Object? newAuthProvider = null,
  }) {
    return _then(_$_AccountUniteRequest(
      newOauthId: null == newOauthId
          ? _value.newOauthId
          : newOauthId // ignore: cast_nullable_to_non_nullable
              as String,
      newAuthProvider: null == newAuthProvider
          ? _value.newAuthProvider
          : newAuthProvider // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AccountUniteRequest implements _AccountUniteRequest {
  _$_AccountUniteRequest(
      {required this.newOauthId, required this.newAuthProvider});

  factory _$_AccountUniteRequest.fromJson(Map<String, dynamic> json) =>
      _$$_AccountUniteRequestFromJson(json);

  @override
  final String newOauthId;
  @override
  final String newAuthProvider;

  @override
  String toString() {
    return 'AccountUniteRequest(newOauthId: $newOauthId, newAuthProvider: $newAuthProvider)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountUniteRequest &&
            (identical(other.newOauthId, newOauthId) ||
                other.newOauthId == newOauthId) &&
            (identical(other.newAuthProvider, newAuthProvider) ||
                other.newAuthProvider == newAuthProvider));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, newOauthId, newAuthProvider);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AccountUniteRequestCopyWith<_$_AccountUniteRequest> get copyWith =>
      __$$_AccountUniteRequestCopyWithImpl<_$_AccountUniteRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AccountUniteRequestToJson(
      this,
    );
  }
}

abstract class _AccountUniteRequest implements AccountUniteRequest {
  factory _AccountUniteRequest(
      {required final String newOauthId,
      required final String newAuthProvider}) = _$_AccountUniteRequest;

  factory _AccountUniteRequest.fromJson(Map<String, dynamic> json) =
      _$_AccountUniteRequest.fromJson;

  @override
  String get newOauthId;
  @override
  String get newAuthProvider;
  @override
  @JsonKey(ignore: true)
  _$$_AccountUniteRequestCopyWith<_$_AccountUniteRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
