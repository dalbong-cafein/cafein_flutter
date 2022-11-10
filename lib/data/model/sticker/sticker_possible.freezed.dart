// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sticker_possible.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StickerPossible _$StickerPossibleFromJson(Map<String, dynamic> json) {
  return _StickerPossible.fromJson(json);
}

/// @nodoc
mixin _$StickerPossible {
  bool get isPossibleIssue => throw _privateConstructorUsedError;
  String? get reason => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StickerPossibleCopyWith<StickerPossible> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StickerPossibleCopyWith<$Res> {
  factory $StickerPossibleCopyWith(
          StickerPossible value, $Res Function(StickerPossible) then) =
      _$StickerPossibleCopyWithImpl<$Res, StickerPossible>;
  @useResult
  $Res call({bool isPossibleIssue, String? reason});
}

/// @nodoc
class _$StickerPossibleCopyWithImpl<$Res, $Val extends StickerPossible>
    implements $StickerPossibleCopyWith<$Res> {
  _$StickerPossibleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isPossibleIssue = null,
    Object? reason = freezed,
  }) {
    return _then(_value.copyWith(
      isPossibleIssue: null == isPossibleIssue
          ? _value.isPossibleIssue
          : isPossibleIssue // ignore: cast_nullable_to_non_nullable
              as bool,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StickerPossibleCopyWith<$Res>
    implements $StickerPossibleCopyWith<$Res> {
  factory _$$_StickerPossibleCopyWith(
          _$_StickerPossible value, $Res Function(_$_StickerPossible) then) =
      __$$_StickerPossibleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isPossibleIssue, String? reason});
}

/// @nodoc
class __$$_StickerPossibleCopyWithImpl<$Res>
    extends _$StickerPossibleCopyWithImpl<$Res, _$_StickerPossible>
    implements _$$_StickerPossibleCopyWith<$Res> {
  __$$_StickerPossibleCopyWithImpl(
      _$_StickerPossible _value, $Res Function(_$_StickerPossible) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isPossibleIssue = null,
    Object? reason = freezed,
  }) {
    return _then(_$_StickerPossible(
      isPossibleIssue: null == isPossibleIssue
          ? _value.isPossibleIssue
          : isPossibleIssue // ignore: cast_nullable_to_non_nullable
              as bool,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StickerPossible implements _StickerPossible {
  _$_StickerPossible({required this.isPossibleIssue, this.reason});

  factory _$_StickerPossible.fromJson(Map<String, dynamic> json) =>
      _$$_StickerPossibleFromJson(json);

  @override
  final bool isPossibleIssue;
  @override
  final String? reason;

  @override
  String toString() {
    return 'StickerPossible(isPossibleIssue: $isPossibleIssue, reason: $reason)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StickerPossible &&
            (identical(other.isPossibleIssue, isPossibleIssue) ||
                other.isPossibleIssue == isPossibleIssue) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isPossibleIssue, reason);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StickerPossibleCopyWith<_$_StickerPossible> get copyWith =>
      __$$_StickerPossibleCopyWithImpl<_$_StickerPossible>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StickerPossibleToJson(
      this,
    );
  }
}

abstract class _StickerPossible implements StickerPossible {
  factory _StickerPossible(
      {required final bool isPossibleIssue,
      final String? reason}) = _$_StickerPossible;

  factory _StickerPossible.fromJson(Map<String, dynamic> json) =
      _$_StickerPossible.fromJson;

  @override
  bool get isPossibleIssue;
  @override
  String? get reason;
  @override
  @JsonKey(ignore: true)
  _$$_StickerPossibleCopyWith<_$_StickerPossible> get copyWith =>
      throw _privateConstructorUsedError;
}
