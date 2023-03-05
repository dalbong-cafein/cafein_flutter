// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auto_completed_store.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AutoCompletedStore _$AutoCompletedStoreFromJson(Map<String, dynamic> json) {
  return _AutoCompletedStore.fromJson(json);
}

/// @nodoc
mixin _$AutoCompletedStore {
  @JsonKey(name: 'storeId')
  int get storeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'storeName')
  String get storeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'fullAddress')
  String get fullAddress => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AutoCompletedStoreCopyWith<AutoCompletedStore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AutoCompletedStoreCopyWith<$Res> {
  factory $AutoCompletedStoreCopyWith(
          AutoCompletedStore value, $Res Function(AutoCompletedStore) then) =
      _$AutoCompletedStoreCopyWithImpl<$Res, AutoCompletedStore>;
  @useResult
  $Res call(
      {@JsonKey(name: 'storeId') int storeId,
      @JsonKey(name: 'storeName') String storeName,
      @JsonKey(name: 'fullAddress') String fullAddress});
}

/// @nodoc
class _$AutoCompletedStoreCopyWithImpl<$Res, $Val extends AutoCompletedStore>
    implements $AutoCompletedStoreCopyWith<$Res> {
  _$AutoCompletedStoreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeId = null,
    Object? storeName = null,
    Object? fullAddress = null,
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
      fullAddress: null == fullAddress
          ? _value.fullAddress
          : fullAddress // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AutoCompletedStoreCopyWith<$Res>
    implements $AutoCompletedStoreCopyWith<$Res> {
  factory _$$_AutoCompletedStoreCopyWith(_$_AutoCompletedStore value,
          $Res Function(_$_AutoCompletedStore) then) =
      __$$_AutoCompletedStoreCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'storeId') int storeId,
      @JsonKey(name: 'storeName') String storeName,
      @JsonKey(name: 'fullAddress') String fullAddress});
}

/// @nodoc
class __$$_AutoCompletedStoreCopyWithImpl<$Res>
    extends _$AutoCompletedStoreCopyWithImpl<$Res, _$_AutoCompletedStore>
    implements _$$_AutoCompletedStoreCopyWith<$Res> {
  __$$_AutoCompletedStoreCopyWithImpl(
      _$_AutoCompletedStore _value, $Res Function(_$_AutoCompletedStore) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeId = null,
    Object? storeName = null,
    Object? fullAddress = null,
  }) {
    return _then(_$_AutoCompletedStore(
      storeId: null == storeId
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as int,
      storeName: null == storeName
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String,
      fullAddress: null == fullAddress
          ? _value.fullAddress
          : fullAddress // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AutoCompletedStore implements _AutoCompletedStore {
  _$_AutoCompletedStore(
      {@JsonKey(name: 'storeId') required this.storeId,
      @JsonKey(name: 'storeName') required this.storeName,
      @JsonKey(name: 'fullAddress') required this.fullAddress});

  factory _$_AutoCompletedStore.fromJson(Map<String, dynamic> json) =>
      _$$_AutoCompletedStoreFromJson(json);

  @override
  @JsonKey(name: 'storeId')
  final int storeId;
  @override
  @JsonKey(name: 'storeName')
  final String storeName;
  @override
  @JsonKey(name: 'fullAddress')
  final String fullAddress;

  @override
  String toString() {
    return 'AutoCompletedStore(storeId: $storeId, storeName: $storeName, fullAddress: $fullAddress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AutoCompletedStore &&
            (identical(other.storeId, storeId) || other.storeId == storeId) &&
            (identical(other.storeName, storeName) ||
                other.storeName == storeName) &&
            (identical(other.fullAddress, fullAddress) ||
                other.fullAddress == fullAddress));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, storeId, storeName, fullAddress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AutoCompletedStoreCopyWith<_$_AutoCompletedStore> get copyWith =>
      __$$_AutoCompletedStoreCopyWithImpl<_$_AutoCompletedStore>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AutoCompletedStoreToJson(
      this,
    );
  }
}

abstract class _AutoCompletedStore implements AutoCompletedStore {
  factory _AutoCompletedStore(
          {@JsonKey(name: 'storeId') required final int storeId,
          @JsonKey(name: 'storeName') required final String storeName,
          @JsonKey(name: 'fullAddress') required final String fullAddress}) =
      _$_AutoCompletedStore;

  factory _AutoCompletedStore.fromJson(Map<String, dynamic> json) =
      _$_AutoCompletedStore.fromJson;

  @override
  @JsonKey(name: 'storeId')
  int get storeId;
  @override
  @JsonKey(name: 'storeName')
  String get storeName;
  @override
  @JsonKey(name: 'fullAddress')
  String get fullAddress;
  @override
  @JsonKey(ignore: true)
  _$$_AutoCompletedStoreCopyWith<_$_AutoCompletedStore> get copyWith =>
      throw _privateConstructorUsedError;
}
