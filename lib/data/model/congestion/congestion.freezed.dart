// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'congestion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Congestion _$CongestionFromJson(Map<String, dynamic> json) {
  return _Congestion.fromJson(json);
}

/// @nodoc
mixin _$Congestion {
  int get writerId => throw _privateConstructorUsedError;
  String get nicknameOfWriter => throw _privateConstructorUsedError;
  int get congestionScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'regDateTime')
  String get registeredDateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CongestionCopyWith<Congestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CongestionCopyWith<$Res> {
  factory $CongestionCopyWith(
          Congestion value, $Res Function(Congestion) then) =
      _$CongestionCopyWithImpl<$Res, Congestion>;
  @useResult
  $Res call(
      {int writerId,
      String nicknameOfWriter,
      int congestionScore,
      @JsonKey(name: 'regDateTime') String registeredDateTime});
}

/// @nodoc
class _$CongestionCopyWithImpl<$Res, $Val extends Congestion>
    implements $CongestionCopyWith<$Res> {
  _$CongestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? writerId = null,
    Object? nicknameOfWriter = null,
    Object? congestionScore = null,
    Object? registeredDateTime = null,
  }) {
    return _then(_value.copyWith(
      writerId: null == writerId
          ? _value.writerId
          : writerId // ignore: cast_nullable_to_non_nullable
              as int,
      nicknameOfWriter: null == nicknameOfWriter
          ? _value.nicknameOfWriter
          : nicknameOfWriter // ignore: cast_nullable_to_non_nullable
              as String,
      congestionScore: null == congestionScore
          ? _value.congestionScore
          : congestionScore // ignore: cast_nullable_to_non_nullable
              as int,
      registeredDateTime: null == registeredDateTime
          ? _value.registeredDateTime
          : registeredDateTime // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CongestionCopyWith<$Res>
    implements $CongestionCopyWith<$Res> {
  factory _$$_CongestionCopyWith(
          _$_Congestion value, $Res Function(_$_Congestion) then) =
      __$$_CongestionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int writerId,
      String nicknameOfWriter,
      int congestionScore,
      @JsonKey(name: 'regDateTime') String registeredDateTime});
}

/// @nodoc
class __$$_CongestionCopyWithImpl<$Res>
    extends _$CongestionCopyWithImpl<$Res, _$_Congestion>
    implements _$$_CongestionCopyWith<$Res> {
  __$$_CongestionCopyWithImpl(
      _$_Congestion _value, $Res Function(_$_Congestion) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? writerId = null,
    Object? nicknameOfWriter = null,
    Object? congestionScore = null,
    Object? registeredDateTime = null,
  }) {
    return _then(_$_Congestion(
      writerId: null == writerId
          ? _value.writerId
          : writerId // ignore: cast_nullable_to_non_nullable
              as int,
      nicknameOfWriter: null == nicknameOfWriter
          ? _value.nicknameOfWriter
          : nicknameOfWriter // ignore: cast_nullable_to_non_nullable
              as String,
      congestionScore: null == congestionScore
          ? _value.congestionScore
          : congestionScore // ignore: cast_nullable_to_non_nullable
              as int,
      registeredDateTime: null == registeredDateTime
          ? _value.registeredDateTime
          : registeredDateTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Congestion implements _Congestion {
  _$_Congestion(
      {required this.writerId,
      required this.nicknameOfWriter,
      required this.congestionScore,
      @JsonKey(name: 'regDateTime') required this.registeredDateTime});

  factory _$_Congestion.fromJson(Map<String, dynamic> json) =>
      _$$_CongestionFromJson(json);

  @override
  final int writerId;
  @override
  final String nicknameOfWriter;
  @override
  final int congestionScore;
  @override
  @JsonKey(name: 'regDateTime')
  final String registeredDateTime;

  @override
  String toString() {
    return 'Congestion(writerId: $writerId, nicknameOfWriter: $nicknameOfWriter, congestionScore: $congestionScore, registeredDateTime: $registeredDateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Congestion &&
            (identical(other.writerId, writerId) ||
                other.writerId == writerId) &&
            (identical(other.nicknameOfWriter, nicknameOfWriter) ||
                other.nicknameOfWriter == nicknameOfWriter) &&
            (identical(other.congestionScore, congestionScore) ||
                other.congestionScore == congestionScore) &&
            (identical(other.registeredDateTime, registeredDateTime) ||
                other.registeredDateTime == registeredDateTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, writerId, nicknameOfWriter,
      congestionScore, registeredDateTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CongestionCopyWith<_$_Congestion> get copyWith =>
      __$$_CongestionCopyWithImpl<_$_Congestion>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CongestionToJson(
      this,
    );
  }
}

abstract class _Congestion implements Congestion {
  factory _Congestion(
      {required final int writerId,
      required final String nicknameOfWriter,
      required final int congestionScore,
      @JsonKey(name: 'regDateTime')
          required final String registeredDateTime}) = _$_Congestion;

  factory _Congestion.fromJson(Map<String, dynamic> json) =
      _$_Congestion.fromJson;

  @override
  int get writerId;
  @override
  String get nicknameOfWriter;
  @override
  int get congestionScore;
  @override
  @JsonKey(name: 'regDateTime')
  String get registeredDateTime;
  @override
  @JsonKey(ignore: true)
  _$$_CongestionCopyWith<_$_Congestion> get copyWith =>
      throw _privateConstructorUsedError;
}
