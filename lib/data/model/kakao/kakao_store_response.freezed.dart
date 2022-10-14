// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'kakao_store_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

KakaoStoreResponse _$KakaoStoreResponseFromJson(Map<String, dynamic> json) {
  return _KakaoStoreResponse.fromJson(json);
}

/// @nodoc
mixin _$KakaoStoreResponse {
  String get placeName => throw _privateConstructorUsedError;
  String get roadAddressName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KakaoStoreResponseCopyWith<KakaoStoreResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KakaoStoreResponseCopyWith<$Res> {
  factory $KakaoStoreResponseCopyWith(
          KakaoStoreResponse value, $Res Function(KakaoStoreResponse) then) =
      _$KakaoStoreResponseCopyWithImpl<$Res>;
  $Res call({String placeName, String roadAddressName});
}

/// @nodoc
class _$KakaoStoreResponseCopyWithImpl<$Res>
    implements $KakaoStoreResponseCopyWith<$Res> {
  _$KakaoStoreResponseCopyWithImpl(this._value, this._then);

  final KakaoStoreResponse _value;
  // ignore: unused_field
  final $Res Function(KakaoStoreResponse) _then;

  @override
  $Res call({
    Object? placeName = freezed,
    Object? roadAddressName = freezed,
  }) {
    return _then(_value.copyWith(
      placeName: placeName == freezed
          ? _value.placeName
          : placeName // ignore: cast_nullable_to_non_nullable
              as String,
      roadAddressName: roadAddressName == freezed
          ? _value.roadAddressName
          : roadAddressName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_KakaoStoreResponseCopyWith<$Res>
    implements $KakaoStoreResponseCopyWith<$Res> {
  factory _$$_KakaoStoreResponseCopyWith(_$_KakaoStoreResponse value,
          $Res Function(_$_KakaoStoreResponse) then) =
      __$$_KakaoStoreResponseCopyWithImpl<$Res>;
  @override
  $Res call({String placeName, String roadAddressName});
}

/// @nodoc
class __$$_KakaoStoreResponseCopyWithImpl<$Res>
    extends _$KakaoStoreResponseCopyWithImpl<$Res>
    implements _$$_KakaoStoreResponseCopyWith<$Res> {
  __$$_KakaoStoreResponseCopyWithImpl(
      _$_KakaoStoreResponse _value, $Res Function(_$_KakaoStoreResponse) _then)
      : super(_value, (v) => _then(v as _$_KakaoStoreResponse));

  @override
  _$_KakaoStoreResponse get _value => super._value as _$_KakaoStoreResponse;

  @override
  $Res call({
    Object? placeName = freezed,
    Object? roadAddressName = freezed,
  }) {
    return _then(_$_KakaoStoreResponse(
      placeName: placeName == freezed
          ? _value.placeName
          : placeName // ignore: cast_nullable_to_non_nullable
              as String,
      roadAddressName: roadAddressName == freezed
          ? _value.roadAddressName
          : roadAddressName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_KakaoStoreResponse implements _KakaoStoreResponse {
  _$_KakaoStoreResponse(
      {required this.placeName, required this.roadAddressName});

  factory _$_KakaoStoreResponse.fromJson(Map<String, dynamic> json) =>
      _$$_KakaoStoreResponseFromJson(json);

  @override
  final String placeName;
  @override
  final String roadAddressName;

  @override
  String toString() {
    return 'KakaoStoreResponse(placeName: $placeName, roadAddressName: $roadAddressName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_KakaoStoreResponse &&
            const DeepCollectionEquality().equals(other.placeName, placeName) &&
            const DeepCollectionEquality()
                .equals(other.roadAddressName, roadAddressName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(placeName),
      const DeepCollectionEquality().hash(roadAddressName));

  @JsonKey(ignore: true)
  @override
  _$$_KakaoStoreResponseCopyWith<_$_KakaoStoreResponse> get copyWith =>
      __$$_KakaoStoreResponseCopyWithImpl<_$_KakaoStoreResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_KakaoStoreResponseToJson(
      this,
    );
  }
}

abstract class _KakaoStoreResponse implements KakaoStoreResponse {
  factory _KakaoStoreResponse(
      {required final String placeName,
      required final String roadAddressName}) = _$_KakaoStoreResponse;

  factory _KakaoStoreResponse.fromJson(Map<String, dynamic> json) =
      _$_KakaoStoreResponse.fromJson;

  @override
  String get placeName;
  @override
  String get roadAddressName;
  @override
  @JsonKey(ignore: true)
  _$$_KakaoStoreResponseCopyWith<_$_KakaoStoreResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
