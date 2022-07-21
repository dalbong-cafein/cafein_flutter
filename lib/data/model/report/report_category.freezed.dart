// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'report_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReportCategory _$ReportCategoryFromJson(Map<String, dynamic> json) {
  return _ReportCategory.fromJson(json);
}

/// @nodoc
mixin _$ReportCategory {
  int get reportCategoryId => throw _privateConstructorUsedError;
  String get categoryName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportCategoryCopyWith<ReportCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportCategoryCopyWith<$Res> {
  factory $ReportCategoryCopyWith(
          ReportCategory value, $Res Function(ReportCategory) then) =
      _$ReportCategoryCopyWithImpl<$Res>;
  $Res call({int reportCategoryId, String categoryName});
}

/// @nodoc
class _$ReportCategoryCopyWithImpl<$Res>
    implements $ReportCategoryCopyWith<$Res> {
  _$ReportCategoryCopyWithImpl(this._value, this._then);

  final ReportCategory _value;
  // ignore: unused_field
  final $Res Function(ReportCategory) _then;

  @override
  $Res call({
    Object? reportCategoryId = freezed,
    Object? categoryName = freezed,
  }) {
    return _then(_value.copyWith(
      reportCategoryId: reportCategoryId == freezed
          ? _value.reportCategoryId
          : reportCategoryId // ignore: cast_nullable_to_non_nullable
              as int,
      categoryName: categoryName == freezed
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_ReportCategoryCopyWith<$Res>
    implements $ReportCategoryCopyWith<$Res> {
  factory _$$_ReportCategoryCopyWith(
          _$_ReportCategory value, $Res Function(_$_ReportCategory) then) =
      __$$_ReportCategoryCopyWithImpl<$Res>;
  @override
  $Res call({int reportCategoryId, String categoryName});
}

/// @nodoc
class __$$_ReportCategoryCopyWithImpl<$Res>
    extends _$ReportCategoryCopyWithImpl<$Res>
    implements _$$_ReportCategoryCopyWith<$Res> {
  __$$_ReportCategoryCopyWithImpl(
      _$_ReportCategory _value, $Res Function(_$_ReportCategory) _then)
      : super(_value, (v) => _then(v as _$_ReportCategory));

  @override
  _$_ReportCategory get _value => super._value as _$_ReportCategory;

  @override
  $Res call({
    Object? reportCategoryId = freezed,
    Object? categoryName = freezed,
  }) {
    return _then(_$_ReportCategory(
      reportCategoryId: reportCategoryId == freezed
          ? _value.reportCategoryId
          : reportCategoryId // ignore: cast_nullable_to_non_nullable
              as int,
      categoryName: categoryName == freezed
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReportCategory implements _ReportCategory {
  _$_ReportCategory(
      {required this.reportCategoryId, required this.categoryName});

  factory _$_ReportCategory.fromJson(Map<String, dynamic> json) =>
      _$$_ReportCategoryFromJson(json);

  @override
  final int reportCategoryId;
  @override
  final String categoryName;

  @override
  String toString() {
    return 'ReportCategory(reportCategoryId: $reportCategoryId, categoryName: $categoryName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReportCategory &&
            const DeepCollectionEquality()
                .equals(other.reportCategoryId, reportCategoryId) &&
            const DeepCollectionEquality()
                .equals(other.categoryName, categoryName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(reportCategoryId),
      const DeepCollectionEquality().hash(categoryName));

  @JsonKey(ignore: true)
  @override
  _$$_ReportCategoryCopyWith<_$_ReportCategory> get copyWith =>
      __$$_ReportCategoryCopyWithImpl<_$_ReportCategory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReportCategoryToJson(this);
  }
}

abstract class _ReportCategory implements ReportCategory {
  factory _ReportCategory(
      {required final int reportCategoryId,
      required final String categoryName}) = _$_ReportCategory;

  factory _ReportCategory.fromJson(Map<String, dynamic> json) =
      _$_ReportCategory.fromJson;

  @override
  int get reportCategoryId => throw _privateConstructorUsedError;
  @override
  String get categoryName => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ReportCategoryCopyWith<_$_ReportCategory> get copyWith =>
      throw _privateConstructorUsedError;
}
