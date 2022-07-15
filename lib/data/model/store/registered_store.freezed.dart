// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'registered_store.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RegisteredStore _$RegisteredStoreFromJson(Map<String, dynamic> json) {
  return _RegisteredStore.fromJson(json);
}

/// @nodoc
mixin _$RegisteredStore {
  int get storeId => throw _privateConstructorUsedError;
  String get storeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'businessHoursInfoDto')
  BusinessInfo get businessInfo => throw _privateConstructorUsedError;
  double? get congestionScoreAvg => throw _privateConstructorUsedError;
  @JsonKey(name: 'storeImageDto')
  ImageIdPair get imageIdPair => throw _privateConstructorUsedError;
  @JsonKey(name: 'regDateTime')
  String get registeredDateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegisteredStoreCopyWith<RegisteredStore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisteredStoreCopyWith<$Res> {
  factory $RegisteredStoreCopyWith(
          RegisteredStore value, $Res Function(RegisteredStore) then) =
      _$RegisteredStoreCopyWithImpl<$Res>;
  $Res call(
      {int storeId,
      String storeName,
      @JsonKey(name: 'businessHoursInfoDto') BusinessInfo businessInfo,
      double? congestionScoreAvg,
      @JsonKey(name: 'storeImageDto') ImageIdPair imageIdPair,
      @JsonKey(name: 'regDateTime') String registeredDateTime});

  $BusinessInfoCopyWith<$Res> get businessInfo;
  $ImageIdPairCopyWith<$Res> get imageIdPair;
}

/// @nodoc
class _$RegisteredStoreCopyWithImpl<$Res>
    implements $RegisteredStoreCopyWith<$Res> {
  _$RegisteredStoreCopyWithImpl(this._value, this._then);

  final RegisteredStore _value;
  // ignore: unused_field
  final $Res Function(RegisteredStore) _then;

  @override
  $Res call({
    Object? storeId = freezed,
    Object? storeName = freezed,
    Object? businessInfo = freezed,
    Object? congestionScoreAvg = freezed,
    Object? imageIdPair = freezed,
    Object? registeredDateTime = freezed,
  }) {
    return _then(_value.copyWith(
      storeId: storeId == freezed
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as int,
      storeName: storeName == freezed
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String,
      businessInfo: businessInfo == freezed
          ? _value.businessInfo
          : businessInfo // ignore: cast_nullable_to_non_nullable
              as BusinessInfo,
      congestionScoreAvg: congestionScoreAvg == freezed
          ? _value.congestionScoreAvg
          : congestionScoreAvg // ignore: cast_nullable_to_non_nullable
              as double?,
      imageIdPair: imageIdPair == freezed
          ? _value.imageIdPair
          : imageIdPair // ignore: cast_nullable_to_non_nullable
              as ImageIdPair,
      registeredDateTime: registeredDateTime == freezed
          ? _value.registeredDateTime
          : registeredDateTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $BusinessInfoCopyWith<$Res> get businessInfo {
    return $BusinessInfoCopyWith<$Res>(_value.businessInfo, (value) {
      return _then(_value.copyWith(businessInfo: value));
    });
  }

  @override
  $ImageIdPairCopyWith<$Res> get imageIdPair {
    return $ImageIdPairCopyWith<$Res>(_value.imageIdPair, (value) {
      return _then(_value.copyWith(imageIdPair: value));
    });
  }
}

/// @nodoc
abstract class _$$_RegisteredStoreCopyWith<$Res>
    implements $RegisteredStoreCopyWith<$Res> {
  factory _$$_RegisteredStoreCopyWith(
          _$_RegisteredStore value, $Res Function(_$_RegisteredStore) then) =
      __$$_RegisteredStoreCopyWithImpl<$Res>;
  @override
  $Res call(
      {int storeId,
      String storeName,
      @JsonKey(name: 'businessHoursInfoDto') BusinessInfo businessInfo,
      double? congestionScoreAvg,
      @JsonKey(name: 'storeImageDto') ImageIdPair imageIdPair,
      @JsonKey(name: 'regDateTime') String registeredDateTime});

  @override
  $BusinessInfoCopyWith<$Res> get businessInfo;
  @override
  $ImageIdPairCopyWith<$Res> get imageIdPair;
}

/// @nodoc
class __$$_RegisteredStoreCopyWithImpl<$Res>
    extends _$RegisteredStoreCopyWithImpl<$Res>
    implements _$$_RegisteredStoreCopyWith<$Res> {
  __$$_RegisteredStoreCopyWithImpl(
      _$_RegisteredStore _value, $Res Function(_$_RegisteredStore) _then)
      : super(_value, (v) => _then(v as _$_RegisteredStore));

  @override
  _$_RegisteredStore get _value => super._value as _$_RegisteredStore;

  @override
  $Res call({
    Object? storeId = freezed,
    Object? storeName = freezed,
    Object? businessInfo = freezed,
    Object? congestionScoreAvg = freezed,
    Object? imageIdPair = freezed,
    Object? registeredDateTime = freezed,
  }) {
    return _then(_$_RegisteredStore(
      storeId: storeId == freezed
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as int,
      storeName: storeName == freezed
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String,
      businessInfo: businessInfo == freezed
          ? _value.businessInfo
          : businessInfo // ignore: cast_nullable_to_non_nullable
              as BusinessInfo,
      congestionScoreAvg: congestionScoreAvg == freezed
          ? _value.congestionScoreAvg
          : congestionScoreAvg // ignore: cast_nullable_to_non_nullable
              as double?,
      imageIdPair: imageIdPair == freezed
          ? _value.imageIdPair
          : imageIdPair // ignore: cast_nullable_to_non_nullable
              as ImageIdPair,
      registeredDateTime: registeredDateTime == freezed
          ? _value.registeredDateTime
          : registeredDateTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RegisteredStore implements _RegisteredStore {
  _$_RegisteredStore(
      {required this.storeId,
      required this.storeName,
      @JsonKey(name: 'businessHoursInfoDto') required this.businessInfo,
      this.congestionScoreAvg,
      @JsonKey(name: 'storeImageDto') required this.imageIdPair,
      @JsonKey(name: 'regDateTime') required this.registeredDateTime});

  factory _$_RegisteredStore.fromJson(Map<String, dynamic> json) =>
      _$$_RegisteredStoreFromJson(json);

  @override
  final int storeId;
  @override
  final String storeName;
  @override
  @JsonKey(name: 'businessHoursInfoDto')
  final BusinessInfo businessInfo;
  @override
  final double? congestionScoreAvg;
  @override
  @JsonKey(name: 'storeImageDto')
  final ImageIdPair imageIdPair;
  @override
  @JsonKey(name: 'regDateTime')
  final String registeredDateTime;

  @override
  String toString() {
    return 'RegisteredStore(storeId: $storeId, storeName: $storeName, businessInfo: $businessInfo, congestionScoreAvg: $congestionScoreAvg, imageIdPair: $imageIdPair, registeredDateTime: $registeredDateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegisteredStore &&
            const DeepCollectionEquality().equals(other.storeId, storeId) &&
            const DeepCollectionEquality().equals(other.storeName, storeName) &&
            const DeepCollectionEquality()
                .equals(other.businessInfo, businessInfo) &&
            const DeepCollectionEquality()
                .equals(other.congestionScoreAvg, congestionScoreAvg) &&
            const DeepCollectionEquality()
                .equals(other.imageIdPair, imageIdPair) &&
            const DeepCollectionEquality()
                .equals(other.registeredDateTime, registeredDateTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(storeId),
      const DeepCollectionEquality().hash(storeName),
      const DeepCollectionEquality().hash(businessInfo),
      const DeepCollectionEquality().hash(congestionScoreAvg),
      const DeepCollectionEquality().hash(imageIdPair),
      const DeepCollectionEquality().hash(registeredDateTime));

  @JsonKey(ignore: true)
  @override
  _$$_RegisteredStoreCopyWith<_$_RegisteredStore> get copyWith =>
      __$$_RegisteredStoreCopyWithImpl<_$_RegisteredStore>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RegisteredStoreToJson(this);
  }
}

abstract class _RegisteredStore implements RegisteredStore {
  factory _RegisteredStore(
      {required final int storeId,
      required final String storeName,
      @JsonKey(name: 'businessHoursInfoDto')
          required final BusinessInfo businessInfo,
      final double? congestionScoreAvg,
      @JsonKey(name: 'storeImageDto')
          required final ImageIdPair imageIdPair,
      @JsonKey(name: 'regDateTime')
          required final String registeredDateTime}) = _$_RegisteredStore;

  factory _RegisteredStore.fromJson(Map<String, dynamic> json) =
      _$_RegisteredStore.fromJson;

  @override
  int get storeId => throw _privateConstructorUsedError;
  @override
  String get storeName => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'businessHoursInfoDto')
  BusinessInfo get businessInfo => throw _privateConstructorUsedError;
  @override
  double? get congestionScoreAvg => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'storeImageDto')
  ImageIdPair get imageIdPair => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'regDateTime')
  String get registeredDateTime => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_RegisteredStoreCopyWith<_$_RegisteredStore> get copyWith =>
      throw _privateConstructorUsedError;
}
