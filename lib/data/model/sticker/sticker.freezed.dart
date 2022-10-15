// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sticker.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Sticker _$StickerFromJson(Map<String, dynamic> json) {
  return _Sticker.fromJson(json);
}

/// @nodoc
mixin _$Sticker {
  String get stickerType => throw _privateConstructorUsedError;
  String get storeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'regDateTime')
  String get registeredDateTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'expDateTime')
  String get expiredDateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StickerCopyWith<Sticker> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StickerCopyWith<$Res> {
  factory $StickerCopyWith(Sticker value, $Res Function(Sticker) then) =
      _$StickerCopyWithImpl<$Res, Sticker>;
  @useResult
  $Res call(
      {String stickerType,
      String storeName,
      @JsonKey(name: 'regDateTime') String registeredDateTime,
      @JsonKey(name: 'expDateTime') String expiredDateTime});
}

/// @nodoc
class _$StickerCopyWithImpl<$Res, $Val extends Sticker>
    implements $StickerCopyWith<$Res> {
  _$StickerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stickerType = null,
    Object? storeName = null,
    Object? registeredDateTime = null,
    Object? expiredDateTime = null,
  }) {
    return _then(_value.copyWith(
      stickerType: null == stickerType
          ? _value.stickerType
          : stickerType // ignore: cast_nullable_to_non_nullable
              as String,
      storeName: null == storeName
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String,
      registeredDateTime: null == registeredDateTime
          ? _value.registeredDateTime
          : registeredDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      expiredDateTime: null == expiredDateTime
          ? _value.expiredDateTime
          : expiredDateTime // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StickerCopyWith<$Res> implements $StickerCopyWith<$Res> {
  factory _$$_StickerCopyWith(
          _$_Sticker value, $Res Function(_$_Sticker) then) =
      __$$_StickerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String stickerType,
      String storeName,
      @JsonKey(name: 'regDateTime') String registeredDateTime,
      @JsonKey(name: 'expDateTime') String expiredDateTime});
}

/// @nodoc
class __$$_StickerCopyWithImpl<$Res>
    extends _$StickerCopyWithImpl<$Res, _$_Sticker>
    implements _$$_StickerCopyWith<$Res> {
  __$$_StickerCopyWithImpl(_$_Sticker _value, $Res Function(_$_Sticker) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stickerType = null,
    Object? storeName = null,
    Object? registeredDateTime = null,
    Object? expiredDateTime = null,
  }) {
    return _then(_$_Sticker(
      stickerType: null == stickerType
          ? _value.stickerType
          : stickerType // ignore: cast_nullable_to_non_nullable
              as String,
      storeName: null == storeName
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String,
      registeredDateTime: null == registeredDateTime
          ? _value.registeredDateTime
          : registeredDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      expiredDateTime: null == expiredDateTime
          ? _value.expiredDateTime
          : expiredDateTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Sticker implements _Sticker {
  _$_Sticker(
      {required this.stickerType,
      required this.storeName,
      @JsonKey(name: 'regDateTime') required this.registeredDateTime,
      @JsonKey(name: 'expDateTime') required this.expiredDateTime});

  factory _$_Sticker.fromJson(Map<String, dynamic> json) =>
      _$$_StickerFromJson(json);

  @override
  final String stickerType;
  @override
  final String storeName;
  @override
  @JsonKey(name: 'regDateTime')
  final String registeredDateTime;
  @override
  @JsonKey(name: 'expDateTime')
  final String expiredDateTime;

  @override
  String toString() {
    return 'Sticker(stickerType: $stickerType, storeName: $storeName, registeredDateTime: $registeredDateTime, expiredDateTime: $expiredDateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Sticker &&
            (identical(other.stickerType, stickerType) ||
                other.stickerType == stickerType) &&
            (identical(other.storeName, storeName) ||
                other.storeName == storeName) &&
            (identical(other.registeredDateTime, registeredDateTime) ||
                other.registeredDateTime == registeredDateTime) &&
            (identical(other.expiredDateTime, expiredDateTime) ||
                other.expiredDateTime == expiredDateTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, stickerType, storeName, registeredDateTime, expiredDateTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StickerCopyWith<_$_Sticker> get copyWith =>
      __$$_StickerCopyWithImpl<_$_Sticker>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StickerToJson(
      this,
    );
  }
}

abstract class _Sticker implements Sticker {
  factory _Sticker(
      {required final String stickerType,
      required final String storeName,
      @JsonKey(name: 'regDateTime')
          required final String registeredDateTime,
      @JsonKey(name: 'expDateTime')
          required final String expiredDateTime}) = _$_Sticker;

  factory _Sticker.fromJson(Map<String, dynamic> json) = _$_Sticker.fromJson;

  @override
  String get stickerType;
  @override
  String get storeName;
  @override
  @JsonKey(name: 'regDateTime')
  String get registeredDateTime;
  @override
  @JsonKey(name: 'expDateTime')
  String get expiredDateTime;
  @override
  @JsonKey(ignore: true)
  _$$_StickerCopyWith<_$_Sticker> get copyWith =>
      throw _privateConstructorUsedError;
}
