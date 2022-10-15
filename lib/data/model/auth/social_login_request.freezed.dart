// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'social_login_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SocialLoginRequest _$SocialLoginRequestFromJson(Map<String, dynamic> json) {
  return _SocialLoginRequest.fromJson(json);
}

/// @nodoc
mixin _$SocialLoginRequest {
  AuthProvider get authProvider => throw _privateConstructorUsedError;
  String get authToken => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SocialLoginRequestCopyWith<SocialLoginRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SocialLoginRequestCopyWith<$Res> {
  factory $SocialLoginRequestCopyWith(
          SocialLoginRequest value, $Res Function(SocialLoginRequest) then) =
      _$SocialLoginRequestCopyWithImpl<$Res, SocialLoginRequest>;
  @useResult
  $Res call({AuthProvider authProvider, String authToken, String? username});
}

/// @nodoc
class _$SocialLoginRequestCopyWithImpl<$Res, $Val extends SocialLoginRequest>
    implements $SocialLoginRequestCopyWith<$Res> {
  _$SocialLoginRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authProvider = null,
    Object? authToken = null,
    Object? username = freezed,
  }) {
    return _then(_value.copyWith(
      authProvider: null == authProvider
          ? _value.authProvider
          : authProvider // ignore: cast_nullable_to_non_nullable
              as AuthProvider,
      authToken: null == authToken
          ? _value.authToken
          : authToken // ignore: cast_nullable_to_non_nullable
              as String,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SocialLoginRequestCopyWith<$Res>
    implements $SocialLoginRequestCopyWith<$Res> {
  factory _$$_SocialLoginRequestCopyWith(_$_SocialLoginRequest value,
          $Res Function(_$_SocialLoginRequest) then) =
      __$$_SocialLoginRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AuthProvider authProvider, String authToken, String? username});
}

/// @nodoc
class __$$_SocialLoginRequestCopyWithImpl<$Res>
    extends _$SocialLoginRequestCopyWithImpl<$Res, _$_SocialLoginRequest>
    implements _$$_SocialLoginRequestCopyWith<$Res> {
  __$$_SocialLoginRequestCopyWithImpl(
      _$_SocialLoginRequest _value, $Res Function(_$_SocialLoginRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authProvider = null,
    Object? authToken = null,
    Object? username = freezed,
  }) {
    return _then(_$_SocialLoginRequest(
      authProvider: null == authProvider
          ? _value.authProvider
          : authProvider // ignore: cast_nullable_to_non_nullable
              as AuthProvider,
      authToken: null == authToken
          ? _value.authToken
          : authToken // ignore: cast_nullable_to_non_nullable
              as String,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SocialLoginRequest implements _SocialLoginRequest {
  _$_SocialLoginRequest(
      {required this.authProvider, required this.authToken, this.username});

  factory _$_SocialLoginRequest.fromJson(Map<String, dynamic> json) =>
      _$$_SocialLoginRequestFromJson(json);

  @override
  final AuthProvider authProvider;
  @override
  final String authToken;
  @override
  final String? username;

  @override
  String toString() {
    return 'SocialLoginRequest(authProvider: $authProvider, authToken: $authToken, username: $username)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SocialLoginRequest &&
            (identical(other.authProvider, authProvider) ||
                other.authProvider == authProvider) &&
            (identical(other.authToken, authToken) ||
                other.authToken == authToken) &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, authProvider, authToken, username);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SocialLoginRequestCopyWith<_$_SocialLoginRequest> get copyWith =>
      __$$_SocialLoginRequestCopyWithImpl<_$_SocialLoginRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SocialLoginRequestToJson(
      this,
    );
  }
}

abstract class _SocialLoginRequest implements SocialLoginRequest {
  factory _SocialLoginRequest(
      {required final AuthProvider authProvider,
      required final String authToken,
      final String? username}) = _$_SocialLoginRequest;

  factory _SocialLoginRequest.fromJson(Map<String, dynamic> json) =
      _$_SocialLoginRequest.fromJson;

  @override
  AuthProvider get authProvider;
  @override
  String get authToken;
  @override
  String? get username;
  @override
  @JsonKey(ignore: true)
  _$$_SocialLoginRequestCopyWith<_$_SocialLoginRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
