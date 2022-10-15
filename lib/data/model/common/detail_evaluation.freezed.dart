// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'detail_evaluation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DetailEvaluation _$DetailEvaluationFromJson(Map<String, dynamic> json) {
  return _DetailEvaluation.fromJson(json);
}

/// @nodoc
mixin _$DetailEvaluation {
  int get socket => throw _privateConstructorUsedError;
  int get wifi => throw _privateConstructorUsedError;
  int get restroom => throw _privateConstructorUsedError;
  int get tableSize => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailEvaluationCopyWith<DetailEvaluation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailEvaluationCopyWith<$Res> {
  factory $DetailEvaluationCopyWith(
          DetailEvaluation value, $Res Function(DetailEvaluation) then) =
      _$DetailEvaluationCopyWithImpl<$Res, DetailEvaluation>;
  @useResult
  $Res call({int socket, int wifi, int restroom, int tableSize});
}

/// @nodoc
class _$DetailEvaluationCopyWithImpl<$Res, $Val extends DetailEvaluation>
    implements $DetailEvaluationCopyWith<$Res> {
  _$DetailEvaluationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? socket = null,
    Object? wifi = null,
    Object? restroom = null,
    Object? tableSize = null,
  }) {
    return _then(_value.copyWith(
      socket: null == socket
          ? _value.socket
          : socket // ignore: cast_nullable_to_non_nullable
              as int,
      wifi: null == wifi
          ? _value.wifi
          : wifi // ignore: cast_nullable_to_non_nullable
              as int,
      restroom: null == restroom
          ? _value.restroom
          : restroom // ignore: cast_nullable_to_non_nullable
              as int,
      tableSize: null == tableSize
          ? _value.tableSize
          : tableSize // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DetailEvaluationCopyWith<$Res>
    implements $DetailEvaluationCopyWith<$Res> {
  factory _$$_DetailEvaluationCopyWith(
          _$_DetailEvaluation value, $Res Function(_$_DetailEvaluation) then) =
      __$$_DetailEvaluationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int socket, int wifi, int restroom, int tableSize});
}

/// @nodoc
class __$$_DetailEvaluationCopyWithImpl<$Res>
    extends _$DetailEvaluationCopyWithImpl<$Res, _$_DetailEvaluation>
    implements _$$_DetailEvaluationCopyWith<$Res> {
  __$$_DetailEvaluationCopyWithImpl(
      _$_DetailEvaluation _value, $Res Function(_$_DetailEvaluation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? socket = null,
    Object? wifi = null,
    Object? restroom = null,
    Object? tableSize = null,
  }) {
    return _then(_$_DetailEvaluation(
      socket: null == socket
          ? _value.socket
          : socket // ignore: cast_nullable_to_non_nullable
              as int,
      wifi: null == wifi
          ? _value.wifi
          : wifi // ignore: cast_nullable_to_non_nullable
              as int,
      restroom: null == restroom
          ? _value.restroom
          : restroom // ignore: cast_nullable_to_non_nullable
              as int,
      tableSize: null == tableSize
          ? _value.tableSize
          : tableSize // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DetailEvaluation implements _DetailEvaluation {
  _$_DetailEvaluation(
      {required this.socket,
      required this.wifi,
      required this.restroom,
      required this.tableSize});

  factory _$_DetailEvaluation.fromJson(Map<String, dynamic> json) =>
      _$$_DetailEvaluationFromJson(json);

  @override
  final int socket;
  @override
  final int wifi;
  @override
  final int restroom;
  @override
  final int tableSize;

  @override
  String toString() {
    return 'DetailEvaluation(socket: $socket, wifi: $wifi, restroom: $restroom, tableSize: $tableSize)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DetailEvaluation &&
            (identical(other.socket, socket) || other.socket == socket) &&
            (identical(other.wifi, wifi) || other.wifi == wifi) &&
            (identical(other.restroom, restroom) ||
                other.restroom == restroom) &&
            (identical(other.tableSize, tableSize) ||
                other.tableSize == tableSize));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, socket, wifi, restroom, tableSize);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DetailEvaluationCopyWith<_$_DetailEvaluation> get copyWith =>
      __$$_DetailEvaluationCopyWithImpl<_$_DetailEvaluation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DetailEvaluationToJson(
      this,
    );
  }
}

abstract class _DetailEvaluation implements DetailEvaluation {
  factory _DetailEvaluation(
      {required final int socket,
      required final int wifi,
      required final int restroom,
      required final int tableSize}) = _$_DetailEvaluation;

  factory _DetailEvaluation.fromJson(Map<String, dynamic> json) =
      _$_DetailEvaluation.fromJson;

  @override
  int get socket;
  @override
  int get wifi;
  @override
  int get restroom;
  @override
  int get tableSize;
  @override
  @JsonKey(ignore: true)
  _$$_DetailEvaluationCopyWith<_$_DetailEvaluation> get copyWith =>
      throw _privateConstructorUsedError;
}
