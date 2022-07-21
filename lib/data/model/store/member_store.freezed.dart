// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'member_store.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MemberStore _$MemberStoreFromJson(Map<String, dynamic> json) {
  return _MemberStore.fromJson(json);
}

/// @nodoc
mixin _$MemberStore {
  int get storeId => throw _privateConstructorUsedError;
  String get storeName => throw _privateConstructorUsedError;
  double get lngX => throw _privateConstructorUsedError;
  double get latY => throw _privateConstructorUsedError;
  double? get congestionScoreAvg => throw _privateConstructorUsedError;
  @JsonKey(name: 'storeImageDto')
  ImageIdPair get imageIdPair => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MemberStoreCopyWith<MemberStore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemberStoreCopyWith<$Res> {
  factory $MemberStoreCopyWith(
          MemberStore value, $Res Function(MemberStore) then) =
      _$MemberStoreCopyWithImpl<$Res>;
  $Res call(
      {int storeId,
      String storeName,
      double lngX,
      double latY,
      double? congestionScoreAvg,
      @JsonKey(name: 'storeImageDto') ImageIdPair imageIdPair});

  $ImageIdPairCopyWith<$Res> get imageIdPair;
}

/// @nodoc
class _$MemberStoreCopyWithImpl<$Res> implements $MemberStoreCopyWith<$Res> {
  _$MemberStoreCopyWithImpl(this._value, this._then);

  final MemberStore _value;
  // ignore: unused_field
  final $Res Function(MemberStore) _then;

  @override
  $Res call({
    Object? storeId = freezed,
    Object? storeName = freezed,
    Object? lngX = freezed,
    Object? latY = freezed,
    Object? congestionScoreAvg = freezed,
    Object? imageIdPair = freezed,
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
      lngX: lngX == freezed
          ? _value.lngX
          : lngX // ignore: cast_nullable_to_non_nullable
              as double,
      latY: latY == freezed
          ? _value.latY
          : latY // ignore: cast_nullable_to_non_nullable
              as double,
      congestionScoreAvg: congestionScoreAvg == freezed
          ? _value.congestionScoreAvg
          : congestionScoreAvg // ignore: cast_nullable_to_non_nullable
              as double?,
      imageIdPair: imageIdPair == freezed
          ? _value.imageIdPair
          : imageIdPair // ignore: cast_nullable_to_non_nullable
              as ImageIdPair,
    ));
  }

  @override
  $ImageIdPairCopyWith<$Res> get imageIdPair {
    return $ImageIdPairCopyWith<$Res>(_value.imageIdPair, (value) {
      return _then(_value.copyWith(imageIdPair: value));
    });
  }
}

/// @nodoc
abstract class _$$_MemberStoreCopyWith<$Res>
    implements $MemberStoreCopyWith<$Res> {
  factory _$$_MemberStoreCopyWith(
          _$_MemberStore value, $Res Function(_$_MemberStore) then) =
      __$$_MemberStoreCopyWithImpl<$Res>;
  @override
  $Res call(
      {int storeId,
      String storeName,
      double lngX,
      double latY,
      double? congestionScoreAvg,
      @JsonKey(name: 'storeImageDto') ImageIdPair imageIdPair});

  @override
  $ImageIdPairCopyWith<$Res> get imageIdPair;
}

/// @nodoc
class __$$_MemberStoreCopyWithImpl<$Res> extends _$MemberStoreCopyWithImpl<$Res>
    implements _$$_MemberStoreCopyWith<$Res> {
  __$$_MemberStoreCopyWithImpl(
      _$_MemberStore _value, $Res Function(_$_MemberStore) _then)
      : super(_value, (v) => _then(v as _$_MemberStore));

  @override
  _$_MemberStore get _value => super._value as _$_MemberStore;

  @override
  $Res call({
    Object? storeId = freezed,
    Object? storeName = freezed,
    Object? lngX = freezed,
    Object? latY = freezed,
    Object? congestionScoreAvg = freezed,
    Object? imageIdPair = freezed,
  }) {
    return _then(_$_MemberStore(
      storeId: storeId == freezed
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as int,
      storeName: storeName == freezed
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String,
      lngX: lngX == freezed
          ? _value.lngX
          : lngX // ignore: cast_nullable_to_non_nullable
              as double,
      latY: latY == freezed
          ? _value.latY
          : latY // ignore: cast_nullable_to_non_nullable
              as double,
      congestionScoreAvg: congestionScoreAvg == freezed
          ? _value.congestionScoreAvg
          : congestionScoreAvg // ignore: cast_nullable_to_non_nullable
              as double?,
      imageIdPair: imageIdPair == freezed
          ? _value.imageIdPair
          : imageIdPair // ignore: cast_nullable_to_non_nullable
              as ImageIdPair,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MemberStore implements _MemberStore {
  _$_MemberStore(
      {required this.storeId,
      required this.storeName,
      required this.lngX,
      required this.latY,
      this.congestionScoreAvg,
      @JsonKey(name: 'storeImageDto') required this.imageIdPair});

  factory _$_MemberStore.fromJson(Map<String, dynamic> json) =>
      _$$_MemberStoreFromJson(json);

  @override
  final int storeId;
  @override
  final String storeName;
  @override
  final double lngX;
  @override
  final double latY;
  @override
  final double? congestionScoreAvg;
  @override
  @JsonKey(name: 'storeImageDto')
  final ImageIdPair imageIdPair;

  @override
  String toString() {
    return 'MemberStore(storeId: $storeId, storeName: $storeName, lngX: $lngX, latY: $latY, congestionScoreAvg: $congestionScoreAvg, imageIdPair: $imageIdPair)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MemberStore &&
            const DeepCollectionEquality().equals(other.storeId, storeId) &&
            const DeepCollectionEquality().equals(other.storeName, storeName) &&
            const DeepCollectionEquality().equals(other.lngX, lngX) &&
            const DeepCollectionEquality().equals(other.latY, latY) &&
            const DeepCollectionEquality()
                .equals(other.congestionScoreAvg, congestionScoreAvg) &&
            const DeepCollectionEquality()
                .equals(other.imageIdPair, imageIdPair));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(storeId),
      const DeepCollectionEquality().hash(storeName),
      const DeepCollectionEquality().hash(lngX),
      const DeepCollectionEquality().hash(latY),
      const DeepCollectionEquality().hash(congestionScoreAvg),
      const DeepCollectionEquality().hash(imageIdPair));

  @JsonKey(ignore: true)
  @override
  _$$_MemberStoreCopyWith<_$_MemberStore> get copyWith =>
      __$$_MemberStoreCopyWithImpl<_$_MemberStore>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MemberStoreToJson(this);
  }
}

abstract class _MemberStore implements MemberStore {
  factory _MemberStore(
      {required final int storeId,
      required final String storeName,
      required final double lngX,
      required final double latY,
      final double? congestionScoreAvg,
      @JsonKey(name: 'storeImageDto')
          required final ImageIdPair imageIdPair}) = _$_MemberStore;

  factory _MemberStore.fromJson(Map<String, dynamic> json) =
      _$_MemberStore.fromJson;

  @override
  int get storeId => throw _privateConstructorUsedError;
  @override
  String get storeName => throw _privateConstructorUsedError;
  @override
  double get lngX => throw _privateConstructorUsedError;
  @override
  double get latY => throw _privateConstructorUsedError;
  @override
  double? get congestionScoreAvg => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'storeImageDto')
  ImageIdPair get imageIdPair => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_MemberStoreCopyWith<_$_MemberStore> get copyWith =>
      throw _privateConstructorUsedError;
}
