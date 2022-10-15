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
      _$ReportCategoryCopyWithImpl<$Res, ReportCategory>;
  @useResult
  $Res call({int reportCategoryId, String categoryName});
}

/// @nodoc
class _$ReportCategoryCopyWithImpl<$Res, $Val extends ReportCategory>
    implements $ReportCategoryCopyWith<$Res> {
  _$ReportCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reportCategoryId = null,
    Object? categoryName = null,
  }) {
    return _then(_value.copyWith(
      reportCategoryId: null == reportCategoryId
          ? _value.reportCategoryId
          : reportCategoryId // ignore: cast_nullable_to_non_nullable
              as int,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReportCategoryCopyWith<$Res>
    implements $ReportCategoryCopyWith<$Res> {
  factory _$$_ReportCategoryCopyWith(
          _$_ReportCategory value, $Res Function(_$_ReportCategory) then) =
      __$$_ReportCategoryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int reportCategoryId, String categoryName});
}

/// @nodoc
class __$$_ReportCategoryCopyWithImpl<$Res>
    extends _$ReportCategoryCopyWithImpl<$Res, _$_ReportCategory>
    implements _$$_ReportCategoryCopyWith<$Res> {
  __$$_ReportCategoryCopyWithImpl(
      _$_ReportCategory _value, $Res Function(_$_ReportCategory) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reportCategoryId = null,
    Object? categoryName = null,
  }) {
    return _then(_$_ReportCategory(
      reportCategoryId: null == reportCategoryId
          ? _value.reportCategoryId
          : reportCategoryId // ignore: cast_nullable_to_non_nullable
              as int,
      categoryName: null == categoryName
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
            (identical(other.reportCategoryId, reportCategoryId) ||
                other.reportCategoryId == reportCategoryId) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, reportCategoryId, categoryName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReportCategoryCopyWith<_$_ReportCategory> get copyWith =>
      __$$_ReportCategoryCopyWithImpl<_$_ReportCategory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReportCategoryToJson(
      this,
    );
  }
}

abstract class _ReportCategory implements ReportCategory {
  factory _ReportCategory(
      {required final int reportCategoryId,
      required final String categoryName}) = _$_ReportCategory;

  factory _ReportCategory.fromJson(Map<String, dynamic> json) =
      _$_ReportCategory.fromJson;

  @override
  int get reportCategoryId;
  @override
  String get categoryName;
  @override
  @JsonKey(ignore: true)
  _$$_ReportCategoryCopyWith<_$_ReportCategory> get copyWith =>
      throw _privateConstructorUsedError;
}
