// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'token_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TokenData {
  @HiveField(0)
  String get accessToken => throw _privateConstructorUsedError;
  @HiveField(1)
  String get refreshToken => throw _privateConstructorUsedError;
  @HiveField(2)
  String get accessTokenType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TokenDataCopyWith<TokenData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenDataCopyWith<$Res> {
  factory $TokenDataCopyWith(TokenData value, $Res Function(TokenData) then) =
      _$TokenDataCopyWithImpl<$Res, TokenData>;
  @useResult
  $Res call(
      {@HiveField(0) String accessToken,
      @HiveField(1) String refreshToken,
      @HiveField(2) String accessTokenType});
}

/// @nodoc
class _$TokenDataCopyWithImpl<$Res, $Val extends TokenData>
    implements $TokenDataCopyWith<$Res> {
  _$TokenDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? accessTokenType = null,
  }) {
    return _then(_value.copyWith(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      accessTokenType: null == accessTokenType
          ? _value.accessTokenType
          : accessTokenType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TokenDataCopyWith<$Res> implements $TokenDataCopyWith<$Res> {
  factory _$$_TokenDataCopyWith(
          _$_TokenData value, $Res Function(_$_TokenData) then) =
      __$$_TokenDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String accessToken,
      @HiveField(1) String refreshToken,
      @HiveField(2) String accessTokenType});
}

/// @nodoc
class __$$_TokenDataCopyWithImpl<$Res>
    extends _$TokenDataCopyWithImpl<$Res, _$_TokenData>
    implements _$$_TokenDataCopyWith<$Res> {
  __$$_TokenDataCopyWithImpl(
      _$_TokenData _value, $Res Function(_$_TokenData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? accessTokenType = null,
  }) {
    return _then(_$_TokenData(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      accessTokenType: null == accessTokenType
          ? _value.accessTokenType
          : accessTokenType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 1, adapterName: 'TokenDataAdapter')
class _$_TokenData implements _TokenData {
  _$_TokenData(
      {@HiveField(0) required this.accessToken,
      @HiveField(1) required this.refreshToken,
      @HiveField(2) this.accessTokenType = 'Bearer'});

  @override
  @HiveField(0)
  final String accessToken;
  @override
  @HiveField(1)
  final String refreshToken;
  @override
  @JsonKey()
  @HiveField(2)
  final String accessTokenType;

  @override
  String toString() {
    return 'TokenData(accessToken: $accessToken, refreshToken: $refreshToken, accessTokenType: $accessTokenType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TokenData &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.accessTokenType, accessTokenType) ||
                other.accessTokenType == accessTokenType));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, accessToken, refreshToken, accessTokenType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TokenDataCopyWith<_$_TokenData> get copyWith =>
      __$$_TokenDataCopyWithImpl<_$_TokenData>(this, _$identity);
}

abstract class _TokenData implements TokenData {
  factory _TokenData(
      {@HiveField(0) required final String accessToken,
      @HiveField(1) required final String refreshToken,
      @HiveField(2) final String accessTokenType}) = _$_TokenData;

  @override
  @HiveField(0)
  String get accessToken;
  @override
  @HiveField(1)
  String get refreshToken;
  @override
  @HiveField(2)
  String get accessTokenType;
  @override
  @JsonKey(ignore: true)
  _$$_TokenDataCopyWith<_$_TokenData> get copyWith =>
      throw _privateConstructorUsedError;
}
