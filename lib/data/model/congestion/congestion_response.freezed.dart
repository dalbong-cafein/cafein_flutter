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
  int get congestionCnt => throw _privateConstructorUsedError;
  @JsonKey(name: 'resDtoList')
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
      _$CongestionResponseCopyWithImpl<$Res, CongestionResponse>;
  @useResult
  $Res call(
      {int congestionCnt,
      @JsonKey(name: 'resDtoList') List<Congestion> congestionList});
}

/// @nodoc
class _$CongestionResponseCopyWithImpl<$Res, $Val extends CongestionResponse>
    implements $CongestionResponseCopyWith<$Res> {
  _$CongestionResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? congestionCnt = null,
    Object? congestionList = null,
  }) {
    return _then(_value.copyWith(
      congestionCnt: null == congestionCnt
          ? _value.congestionCnt
          : congestionCnt // ignore: cast_nullable_to_non_nullable
              as int,
      congestionList: null == congestionList
          ? _value.congestionList
          : congestionList // ignore: cast_nullable_to_non_nullable
              as List<Congestion>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CongestionResponseCopyWith<$Res>
    implements $CongestionResponseCopyWith<$Res> {
  factory _$$_CongestionResponseCopyWith(_$_CongestionResponse value,
          $Res Function(_$_CongestionResponse) then) =
      __$$_CongestionResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int congestionCnt,
      @JsonKey(name: 'resDtoList') List<Congestion> congestionList});
}

/// @nodoc
class __$$_CongestionResponseCopyWithImpl<$Res>
    extends _$CongestionResponseCopyWithImpl<$Res, _$_CongestionResponse>
    implements _$$_CongestionResponseCopyWith<$Res> {
  __$$_CongestionResponseCopyWithImpl(
      _$_CongestionResponse _value, $Res Function(_$_CongestionResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? congestionCnt = null,
    Object? congestionList = null,
  }) {
    return _then(_$_CongestionResponse(
      congestionCnt: null == congestionCnt
          ? _value.congestionCnt
          : congestionCnt // ignore: cast_nullable_to_non_nullable
              as int,
      congestionList: null == congestionList
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
      {required this.congestionCnt,
      @JsonKey(name: 'resDtoList')
          required final List<Congestion> congestionList})
      : _congestionList = congestionList;

  factory _$_CongestionResponse.fromJson(Map<String, dynamic> json) =>
      _$$_CongestionResponseFromJson(json);

  @override
  final int congestionCnt;
  final List<Congestion> _congestionList;
  @override
  @JsonKey(name: 'resDtoList')
  List<Congestion> get congestionList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_congestionList);
  }

  @override
  String toString() {
    return 'CongestionResponse(congestionCnt: $congestionCnt, congestionList: $congestionList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CongestionResponse &&
            (identical(other.congestionCnt, congestionCnt) ||
                other.congestionCnt == congestionCnt) &&
            const DeepCollectionEquality()
                .equals(other._congestionList, _congestionList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, congestionCnt,
      const DeepCollectionEquality().hash(_congestionList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CongestionResponseCopyWith<_$_CongestionResponse> get copyWith =>
      __$$_CongestionResponseCopyWithImpl<_$_CongestionResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CongestionResponseToJson(
      this,
    );
  }
}

abstract class _CongestionResponse implements CongestionResponse {
  factory _CongestionResponse(
          {required final int congestionCnt,
          @JsonKey(name: 'resDtoList')
              required final List<Congestion> congestionList}) =
      _$_CongestionResponse;

  factory _CongestionResponse.fromJson(Map<String, dynamic> json) =
      _$_CongestionResponse.fromJson;

  @override
  int get congestionCnt;
  @override
  @JsonKey(name: 'resDtoList')
  List<Congestion> get congestionList;
  @override
  @JsonKey(ignore: true)
  _$$_CongestionResponseCopyWith<_$_CongestionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
