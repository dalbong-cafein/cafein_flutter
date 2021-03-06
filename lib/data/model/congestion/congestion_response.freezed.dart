// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'congestion_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CongestionResponse _$CongestionResponseFromJson(Map<String, dynamic> json) {
  return _CongestionResponse.fromJson(json);
}

/// @nodoc
mixin _$CongestionResponse {
  int get congestionCng => throw _privateConstructorUsedError;
  List<Congestion> get congestionList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CongestionResponseCopyWith<CongestionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CongestionResponseCopyWith<$Res> {
  factory $CongestionResponseCopyWith(
          CongestionResponse value, $Res Function(CongestionResponse) then) =
      _$CongestionResponseCopyWithImpl<$Res>;
  $Res call({int congestionCng, List<Congestion> congestionList});
}

/// @nodoc
class _$CongestionResponseCopyWithImpl<$Res>
    implements $CongestionResponseCopyWith<$Res> {
  _$CongestionResponseCopyWithImpl(this._value, this._then);

  final CongestionResponse _value;
  // ignore: unused_field
  final $Res Function(CongestionResponse) _then;

  @override
  $Res call({
    Object? congestionCng = freezed,
    Object? congestionList = freezed,
  }) {
    return _then(_value.copyWith(
      congestionCng: congestionCng == freezed
          ? _value.congestionCng
          : congestionCng // ignore: cast_nullable_to_non_nullable
              as int,
      congestionList: congestionList == freezed
          ? _value.congestionList
          : congestionList // ignore: cast_nullable_to_non_nullable
              as List<Congestion>,
    ));
  }
}

/// @nodoc
abstract class _$$_CongestionResponseCopyWith<$Res>
    implements $CongestionResponseCopyWith<$Res> {
  factory _$$_CongestionResponseCopyWith(_$_CongestionResponse value,
          $Res Function(_$_CongestionResponse) then) =
      __$$_CongestionResponseCopyWithImpl<$Res>;
  @override
  $Res call({int congestionCng, List<Congestion> congestionList});
}

/// @nodoc
class __$$_CongestionResponseCopyWithImpl<$Res>
    extends _$CongestionResponseCopyWithImpl<$Res>
    implements _$$_CongestionResponseCopyWith<$Res> {
  __$$_CongestionResponseCopyWithImpl(
      _$_CongestionResponse _value, $Res Function(_$_CongestionResponse) _then)
      : super(_value, (v) => _then(v as _$_CongestionResponse));

  @override
  _$_CongestionResponse get _value => super._value as _$_CongestionResponse;

  @override
  $Res call({
    Object? congestionCng = freezed,
    Object? congestionList = freezed,
  }) {
    return _then(_$_CongestionResponse(
      congestionCng: congestionCng == freezed
          ? _value.congestionCng
          : congestionCng // ignore: cast_nullable_to_non_nullable
              as int,
      congestionList: congestionList == freezed
          ? _value._congestionList
          : congestionList // ignore: cast_nullable_to_non_nullable
              as List<Congestion>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CongestionResponse implements _CongestionResponse {
  _$_CongestionResponse(
      {required this.congestionCng,
      required final List<Congestion> congestionList})
      : _congestionList = congestionList;

  factory _$_CongestionResponse.fromJson(Map<String, dynamic> json) =>
      _$$_CongestionResponseFromJson(json);

  @override
  final int congestionCng;
  final List<Congestion> _congestionList;
  @override
  List<Congestion> get congestionList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_congestionList);
  }

  @override
  String toString() {
    return 'CongestionResponse(congestionCng: $congestionCng, congestionList: $congestionList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CongestionResponse &&
            const DeepCollectionEquality()
                .equals(other.congestionCng, congestionCng) &&
            const DeepCollectionEquality()
                .equals(other._congestionList, _congestionList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(congestionCng),
      const DeepCollectionEquality().hash(_congestionList));

  @JsonKey(ignore: true)
  @override
  _$$_CongestionResponseCopyWith<_$_CongestionResponse> get copyWith =>
      __$$_CongestionResponseCopyWithImpl<_$_CongestionResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CongestionResponseToJson(this);
  }
}

abstract class _CongestionResponse implements CongestionResponse {
  factory _CongestionResponse(
      {required final int congestionCng,
      required final List<Congestion> congestionList}) = _$_CongestionResponse;

  factory _CongestionResponse.fromJson(Map<String, dynamic> json) =
      _$_CongestionResponse.fromJson;

  @override
  int get congestionCng => throw _privateConstructorUsedError;
  @override
  List<Congestion> get congestionList => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_CongestionResponseCopyWith<_$_CongestionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
