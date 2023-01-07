// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'report_possible.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReportPossible _$ReportPossibleFromJson(Map<String, dynamic> json) {
  return _ReportPossible.fromJson(json);
}

/// @nodoc
mixin _$ReportPossible {
  bool get isPossibleRegistration => throw _privateConstructorUsedError;
  String? get reason => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportPossibleCopyWith<ReportPossible> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportPossibleCopyWith<$Res> {
  factory $ReportPossibleCopyWith(
          ReportPossible value, $Res Function(ReportPossible) then) =
      _$ReportPossibleCopyWithImpl<$Res, ReportPossible>;
  @useResult
  $Res call({bool isPossibleRegistration, String? reason});
}

/// @nodoc
class _$ReportPossibleCopyWithImpl<$Res, $Val extends ReportPossible>
    implements $ReportPossibleCopyWith<$Res> {
  _$ReportPossibleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isPossibleRegistration = null,
    Object? reason = freezed,
  }) {
    return _then(_value.copyWith(
      isPossibleRegistration: null == isPossibleRegistration
          ? _value.isPossibleRegistration
          : isPossibleRegistration // ignore: cast_nullable_to_non_nullable
              as bool,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReportPossibleCopyWith<$Res>
    implements $ReportPossibleCopyWith<$Res> {
  factory _$$_ReportPossibleCopyWith(
          _$_ReportPossible value, $Res Function(_$_ReportPossible) then) =
      __$$_ReportPossibleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isPossibleRegistration, String? reason});
}

/// @nodoc
class __$$_ReportPossibleCopyWithImpl<$Res>
    extends _$ReportPossibleCopyWithImpl<$Res, _$_ReportPossible>
    implements _$$_ReportPossibleCopyWith<$Res> {
  __$$_ReportPossibleCopyWithImpl(
      _$_ReportPossible _value, $Res Function(_$_ReportPossible) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isPossibleRegistration = null,
    Object? reason = freezed,
  }) {
    return _then(_$_ReportPossible(
      isPossibleRegistration: null == isPossibleRegistration
          ? _value.isPossibleRegistration
          : isPossibleRegistration // ignore: cast_nullable_to_non_nullable
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
class _$_ReportPossible implements _ReportPossible {
  const _$_ReportPossible(
      {required this.isPossibleRegistration, required this.reason});

  factory _$_ReportPossible.fromJson(Map<String, dynamic> json) =>
      _$$_ReportPossibleFromJson(json);

  @override
  final bool isPossibleRegistration;
  @override
  final String? reason;

  @override
  String toString() {
    return 'ReportPossible(isPossibleRegistration: $isPossibleRegistration, reason: $reason)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReportPossible &&
            (identical(other.isPossibleRegistration, isPossibleRegistration) ||
                other.isPossibleRegistration == isPossibleRegistration) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isPossibleRegistration, reason);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReportPossibleCopyWith<_$_ReportPossible> get copyWith =>
      __$$_ReportPossibleCopyWithImpl<_$_ReportPossible>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReportPossibleToJson(
      this,
    );
  }
}

abstract class _ReportPossible implements ReportPossible {
  const factory _ReportPossible(
      {required final bool isPossibleRegistration,
      required final String? reason}) = _$_ReportPossible;

  factory _ReportPossible.fromJson(Map<String, dynamic> json) =
      _$_ReportPossible.fromJson;

  @override
  bool get isPossibleRegistration;
  @override
  String? get reason;
  @override
  @JsonKey(ignore: true)
  _$$_ReportPossibleCopyWith<_$_ReportPossible> get copyWith =>
      throw _privateConstructorUsedError;
}
