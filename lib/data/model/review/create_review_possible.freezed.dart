// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'create_review_possible.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CreateReviewPossible _$CreateReviewPossibleFromJson(Map<String, dynamic> json) {
  return _CreateReviewPossible.fromJson(json);
}

/// @nodoc
mixin _$CreateReviewPossible {
  bool get isPossibleRegistration => throw _privateConstructorUsedError;
  String get reason => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateReviewPossibleCopyWith<CreateReviewPossible> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateReviewPossibleCopyWith<$Res> {
  factory $CreateReviewPossibleCopyWith(CreateReviewPossible value,
          $Res Function(CreateReviewPossible) then) =
      _$CreateReviewPossibleCopyWithImpl<$Res, CreateReviewPossible>;
  @useResult
  $Res call({bool isPossibleRegistration, String reason});
}

/// @nodoc
class _$CreateReviewPossibleCopyWithImpl<$Res,
        $Val extends CreateReviewPossible>
    implements $CreateReviewPossibleCopyWith<$Res> {
  _$CreateReviewPossibleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isPossibleRegistration = null,
    Object? reason = null,
  }) {
    return _then(_value.copyWith(
      isPossibleRegistration: null == isPossibleRegistration
          ? _value.isPossibleRegistration
          : isPossibleRegistration // ignore: cast_nullable_to_non_nullable
              as bool,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreateReviewPossibleCopyWith<$Res>
    implements $CreateReviewPossibleCopyWith<$Res> {
  factory _$$_CreateReviewPossibleCopyWith(_$_CreateReviewPossible value,
          $Res Function(_$_CreateReviewPossible) then) =
      __$$_CreateReviewPossibleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isPossibleRegistration, String reason});
}

/// @nodoc
class __$$_CreateReviewPossibleCopyWithImpl<$Res>
    extends _$CreateReviewPossibleCopyWithImpl<$Res, _$_CreateReviewPossible>
    implements _$$_CreateReviewPossibleCopyWith<$Res> {
  __$$_CreateReviewPossibleCopyWithImpl(_$_CreateReviewPossible _value,
      $Res Function(_$_CreateReviewPossible) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isPossibleRegistration = null,
    Object? reason = null,
  }) {
    return _then(_$_CreateReviewPossible(
      isPossibleRegistration: null == isPossibleRegistration
          ? _value.isPossibleRegistration
          : isPossibleRegistration // ignore: cast_nullable_to_non_nullable
              as bool,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CreateReviewPossible implements _CreateReviewPossible {
  _$_CreateReviewPossible(
      {required this.isPossibleRegistration, required this.reason});

  factory _$_CreateReviewPossible.fromJson(Map<String, dynamic> json) =>
      _$$_CreateReviewPossibleFromJson(json);

  @override
  final bool isPossibleRegistration;
  @override
  final String reason;

  @override
  String toString() {
    return 'CreateReviewPossible(isPossibleRegistration: $isPossibleRegistration, reason: $reason)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateReviewPossible &&
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
  _$$_CreateReviewPossibleCopyWith<_$_CreateReviewPossible> get copyWith =>
      __$$_CreateReviewPossibleCopyWithImpl<_$_CreateReviewPossible>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CreateReviewPossibleToJson(
      this,
    );
  }
}

abstract class _CreateReviewPossible implements CreateReviewPossible {
  factory _CreateReviewPossible(
      {required final bool isPossibleRegistration,
      required final String reason}) = _$_CreateReviewPossible;

  factory _CreateReviewPossible.fromJson(Map<String, dynamic> json) =
      _$_CreateReviewPossible.fromJson;

  @override
  bool get isPossibleRegistration;
  @override
  String get reason;
  @override
  @JsonKey(ignore: true)
  _$$_CreateReviewPossibleCopyWith<_$_CreateReviewPossible> get copyWith =>
      throw _privateConstructorUsedError;
}
