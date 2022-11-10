// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'registration_possible.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RegistrationPossible _$RegistrationPossibleFromJson(Map<String, dynamic> json) {
  return _RegistrationPossible.fromJson(json);
}

/// @nodoc
mixin _$RegistrationPossible {
  bool get isPossibleRegistration => throw _privateConstructorUsedError;
  String? get reason => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegistrationPossibleCopyWith<RegistrationPossible> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegistrationPossibleCopyWith<$Res> {
  factory $RegistrationPossibleCopyWith(RegistrationPossible value,
          $Res Function(RegistrationPossible) then) =
      _$RegistrationPossibleCopyWithImpl<$Res, RegistrationPossible>;
  @useResult
  $Res call({bool isPossibleRegistration, String? reason});
}

/// @nodoc
class _$RegistrationPossibleCopyWithImpl<$Res,
        $Val extends RegistrationPossible>
    implements $RegistrationPossibleCopyWith<$Res> {
  _$RegistrationPossibleCopyWithImpl(this._value, this._then);

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
abstract class _$$_RegistrationPossibleCopyWith<$Res>
    implements $RegistrationPossibleCopyWith<$Res> {
  factory _$$_RegistrationPossibleCopyWith(_$_RegistrationPossible value,
          $Res Function(_$_RegistrationPossible) then) =
      __$$_RegistrationPossibleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isPossibleRegistration, String? reason});
}

/// @nodoc
class __$$_RegistrationPossibleCopyWithImpl<$Res>
    extends _$RegistrationPossibleCopyWithImpl<$Res, _$_RegistrationPossible>
    implements _$$_RegistrationPossibleCopyWith<$Res> {
  __$$_RegistrationPossibleCopyWithImpl(_$_RegistrationPossible _value,
      $Res Function(_$_RegistrationPossible) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isPossibleRegistration = null,
    Object? reason = freezed,
  }) {
    return _then(_$_RegistrationPossible(
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
class _$_RegistrationPossible implements _RegistrationPossible {
  _$_RegistrationPossible({required this.isPossibleRegistration, this.reason});

  factory _$_RegistrationPossible.fromJson(Map<String, dynamic> json) =>
      _$$_RegistrationPossibleFromJson(json);

  @override
  final bool isPossibleRegistration;
  @override
  final String? reason;

  @override
  String toString() {
    return 'RegistrationPossible(isPossibleRegistration: $isPossibleRegistration, reason: $reason)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegistrationPossible &&
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
  _$$_RegistrationPossibleCopyWith<_$_RegistrationPossible> get copyWith =>
      __$$_RegistrationPossibleCopyWithImpl<_$_RegistrationPossible>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RegistrationPossibleToJson(
      this,
    );
  }
}

abstract class _RegistrationPossible implements RegistrationPossible {
  factory _RegistrationPossible(
      {required final bool isPossibleRegistration,
      final String? reason}) = _$_RegistrationPossible;

  factory _RegistrationPossible.fromJson(Map<String, dynamic> json) =
      _$_RegistrationPossible.fromJson;

  @override
  bool get isPossibleRegistration;
  @override
  String? get reason;
  @override
  @JsonKey(ignore: true)
  _$$_RegistrationPossibleCopyWith<_$_RegistrationPossible> get copyWith =>
      throw _privateConstructorUsedError;
}
