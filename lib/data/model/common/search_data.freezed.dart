// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'search_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchData {
  @HiveField(0)
  String get keyword => throw _privateConstructorUsedError;
  @HiveField(1)
  String get dateTime => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchDataCopyWith<SearchData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchDataCopyWith<$Res> {
  factory $SearchDataCopyWith(
          SearchData value, $Res Function(SearchData) then) =
      _$SearchDataCopyWithImpl<$Res, SearchData>;
  @useResult
  $Res call({@HiveField(0) String keyword, @HiveField(1) String dateTime});
}

/// @nodoc
class _$SearchDataCopyWithImpl<$Res, $Val extends SearchData>
    implements $SearchDataCopyWith<$Res> {
  _$SearchDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyword = null,
    Object? dateTime = null,
  }) {
    return _then(_value.copyWith(
      keyword: null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchDataCopyWith<$Res>
    implements $SearchDataCopyWith<$Res> {
  factory _$$_SearchDataCopyWith(
          _$_SearchData value, $Res Function(_$_SearchData) then) =
      __$$_SearchDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@HiveField(0) String keyword, @HiveField(1) String dateTime});
}

/// @nodoc
class __$$_SearchDataCopyWithImpl<$Res>
    extends _$SearchDataCopyWithImpl<$Res, _$_SearchData>
    implements _$$_SearchDataCopyWith<$Res> {
  __$$_SearchDataCopyWithImpl(
      _$_SearchData _value, $Res Function(_$_SearchData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyword = null,
    Object? dateTime = null,
  }) {
    return _then(_$_SearchData(
      keyword: null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 2, adapterName: 'SearchDataAdapter')
class _$_SearchData implements _SearchData {
  _$_SearchData(
      {@HiveField(0) required this.keyword,
      @HiveField(1) required this.dateTime});

  @override
  @HiveField(0)
  final String keyword;
  @override
  @HiveField(1)
  final String dateTime;

  @override
  String toString() {
    return 'SearchData(keyword: $keyword, dateTime: $dateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchData &&
            (identical(other.keyword, keyword) || other.keyword == keyword) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, keyword, dateTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchDataCopyWith<_$_SearchData> get copyWith =>
      __$$_SearchDataCopyWithImpl<_$_SearchData>(this, _$identity);
}

abstract class _SearchData implements SearchData {
  factory _SearchData(
      {@HiveField(0) required final String keyword,
      @HiveField(1) required final String dateTime}) = _$_SearchData;

  @override
  @HiveField(0)
  String get keyword;
  @override
  @HiveField(1)
  String get dateTime;
  @override
  @JsonKey(ignore: true)
  _$$_SearchDataCopyWith<_$_SearchData> get copyWith =>
      throw _privateConstructorUsedError;
}
