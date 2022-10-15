// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'business_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BusinessInfo _$BusinessInfoFromJson(Map<String, dynamic> json) {
  return _BusinessInfo.fromJson(json);
}

/// @nodoc
mixin _$BusinessInfo {
  bool? get isOpen => throw _privateConstructorUsedError;
  String? get closed => throw _privateConstructorUsedError;
  String get tmrOpen => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BusinessInfoCopyWith<BusinessInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusinessInfoCopyWith<$Res> {
  factory $BusinessInfoCopyWith(
          BusinessInfo value, $Res Function(BusinessInfo) then) =
      _$BusinessInfoCopyWithImpl<$Res, BusinessInfo>;
  @useResult
  $Res call({bool? isOpen, String? closed, String tmrOpen});
}

/// @nodoc
class _$BusinessInfoCopyWithImpl<$Res, $Val extends BusinessInfo>
    implements $BusinessInfoCopyWith<$Res> {
  _$BusinessInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isOpen = freezed,
    Object? closed = freezed,
    Object? tmrOpen = null,
  }) {
    return _then(_value.copyWith(
      isOpen: freezed == isOpen
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool?,
      closed: freezed == closed
          ? _value.closed
          : closed // ignore: cast_nullable_to_non_nullable
              as String?,
      tmrOpen: null == tmrOpen
          ? _value.tmrOpen
          : tmrOpen // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BusinessInfoCopyWith<$Res>
    implements $BusinessInfoCopyWith<$Res> {
  factory _$$_BusinessInfoCopyWith(
          _$_BusinessInfo value, $Res Function(_$_BusinessInfo) then) =
      __$$_BusinessInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? isOpen, String? closed, String tmrOpen});
}

/// @nodoc
class __$$_BusinessInfoCopyWithImpl<$Res>
    extends _$BusinessInfoCopyWithImpl<$Res, _$_BusinessInfo>
    implements _$$_BusinessInfoCopyWith<$Res> {
  __$$_BusinessInfoCopyWithImpl(
      _$_BusinessInfo _value, $Res Function(_$_BusinessInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isOpen = freezed,
    Object? closed = freezed,
    Object? tmrOpen = null,
  }) {
    return _then(_$_BusinessInfo(
      isOpen: freezed == isOpen
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool?,
      closed: freezed == closed
          ? _value.closed
          : closed // ignore: cast_nullable_to_non_nullable
              as String?,
      tmrOpen: null == tmrOpen
          ? _value.tmrOpen
          : tmrOpen // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BusinessInfo implements _BusinessInfo {
  _$_BusinessInfo({this.isOpen = false, this.closed, this.tmrOpen = '10:00'});

  factory _$_BusinessInfo.fromJson(Map<String, dynamic> json) =>
      _$$_BusinessInfoFromJson(json);

  @override
  @JsonKey()
  final bool? isOpen;
  @override
  final String? closed;
  @override
  @JsonKey()
  final String tmrOpen;

  @override
  String toString() {
    return 'BusinessInfo(isOpen: $isOpen, closed: $closed, tmrOpen: $tmrOpen)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BusinessInfo &&
            (identical(other.isOpen, isOpen) || other.isOpen == isOpen) &&
            (identical(other.closed, closed) || other.closed == closed) &&
            (identical(other.tmrOpen, tmrOpen) || other.tmrOpen == tmrOpen));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isOpen, closed, tmrOpen);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BusinessInfoCopyWith<_$_BusinessInfo> get copyWith =>
      __$$_BusinessInfoCopyWithImpl<_$_BusinessInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BusinessInfoToJson(
      this,
    );
  }
}

abstract class _BusinessInfo implements BusinessInfo {
  factory _BusinessInfo(
      {final bool? isOpen,
      final String? closed,
      final String tmrOpen}) = _$_BusinessInfo;

  factory _BusinessInfo.fromJson(Map<String, dynamic> json) =
      _$_BusinessInfo.fromJson;

  @override
  bool? get isOpen;
  @override
  String? get closed;
  @override
  String get tmrOpen;
  @override
  @JsonKey(ignore: true)
  _$$_BusinessInfoCopyWith<_$_BusinessInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
