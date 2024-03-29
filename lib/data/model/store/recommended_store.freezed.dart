// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'recommended_store.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecommendedStore _$RecommendedStoreFromJson(Map<String, dynamic> json) {
  return _RecommendedStore.fromJson(json);
}

/// @nodoc
mixin _$RecommendedStore {
  int get storeId => throw _privateConstructorUsedError;
  String get storeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'address')
  AddressInfo get addressInfo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecommendedStoreCopyWith<RecommendedStore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecommendedStoreCopyWith<$Res> {
  factory $RecommendedStoreCopyWith(
          RecommendedStore value, $Res Function(RecommendedStore) then) =
      _$RecommendedStoreCopyWithImpl<$Res, RecommendedStore>;
  @useResult
  $Res call(
      {int storeId,
      String storeName,
      @JsonKey(name: 'address') AddressInfo addressInfo});

  $AddressInfoCopyWith<$Res> get addressInfo;
}

/// @nodoc
class _$RecommendedStoreCopyWithImpl<$Res, $Val extends RecommendedStore>
    implements $RecommendedStoreCopyWith<$Res> {
  _$RecommendedStoreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeId = null,
    Object? storeName = null,
    Object? addressInfo = null,
  }) {
    return _then(_value.copyWith(
      storeId: null == storeId
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as int,
      storeName: null == storeName
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String,
      addressInfo: null == addressInfo
          ? _value.addressInfo
          : addressInfo // ignore: cast_nullable_to_non_nullable
              as AddressInfo,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressInfoCopyWith<$Res> get addressInfo {
    return $AddressInfoCopyWith<$Res>(_value.addressInfo, (value) {
      return _then(_value.copyWith(addressInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_RecommendedStoreCopyWith<$Res>
    implements $RecommendedStoreCopyWith<$Res> {
  factory _$$_RecommendedStoreCopyWith(
          _$_RecommendedStore value, $Res Function(_$_RecommendedStore) then) =
      __$$_RecommendedStoreCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int storeId,
      String storeName,
      @JsonKey(name: 'address') AddressInfo addressInfo});

  @override
  $AddressInfoCopyWith<$Res> get addressInfo;
}

/// @nodoc
class __$$_RecommendedStoreCopyWithImpl<$Res>
    extends _$RecommendedStoreCopyWithImpl<$Res, _$_RecommendedStore>
    implements _$$_RecommendedStoreCopyWith<$Res> {
  __$$_RecommendedStoreCopyWithImpl(
      _$_RecommendedStore _value, $Res Function(_$_RecommendedStore) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeId = null,
    Object? storeName = null,
    Object? addressInfo = null,
  }) {
    return _then(_$_RecommendedStore(
      storeId: null == storeId
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as int,
      storeName: null == storeName
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String,
      addressInfo: null == addressInfo
          ? _value.addressInfo
          : addressInfo // ignore: cast_nullable_to_non_nullable
              as AddressInfo,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RecommendedStore implements _RecommendedStore {
  _$_RecommendedStore(
      {required this.storeId,
      required this.storeName,
      @JsonKey(name: 'address') required this.addressInfo});

  factory _$_RecommendedStore.fromJson(Map<String, dynamic> json) =>
      _$$_RecommendedStoreFromJson(json);

  @override
  final int storeId;
  @override
  final String storeName;
  @override
  @JsonKey(name: 'address')
  final AddressInfo addressInfo;

  @override
  String toString() {
    return 'RecommendedStore(storeId: $storeId, storeName: $storeName, addressInfo: $addressInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecommendedStore &&
            (identical(other.storeId, storeId) || other.storeId == storeId) &&
            (identical(other.storeName, storeName) ||
                other.storeName == storeName) &&
            (identical(other.addressInfo, addressInfo) ||
                other.addressInfo == addressInfo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, storeId, storeName, addressInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RecommendedStoreCopyWith<_$_RecommendedStore> get copyWith =>
      __$$_RecommendedStoreCopyWithImpl<_$_RecommendedStore>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecommendedStoreToJson(
      this,
    );
  }
}

abstract class _RecommendedStore implements RecommendedStore {
  factory _RecommendedStore(
          {required final int storeId,
          required final String storeName,
          @JsonKey(name: 'address') required final AddressInfo addressInfo}) =
      _$_RecommendedStore;

  factory _RecommendedStore.fromJson(Map<String, dynamic> json) =
      _$_RecommendedStore.fromJson;

  @override
  int get storeId;
  @override
  String get storeName;
  @override
  @JsonKey(name: 'address')
  AddressInfo get addressInfo;
  @override
  @JsonKey(ignore: true)
  _$$_RecommendedStoreCopyWith<_$_RecommendedStore> get copyWith =>
      throw _privateConstructorUsedError;
}
