// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'store_review_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StoreReviewListResponse _$StoreReviewListResponseFromJson(
    Map<String, dynamic> json) {
  return _StoreReviewListResponse.fromJson(json);
}

/// @nodoc
mixin _$StoreReviewListResponse {
  @JsonKey(name: 'dtoList')
  List<StoreReview> get reviewList => throw _privateConstructorUsedError;
  int get totalPage => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  bool get last => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoreReviewListResponseCopyWith<StoreReviewListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreReviewListResponseCopyWith<$Res> {
  factory $StoreReviewListResponseCopyWith(StoreReviewListResponse value,
          $Res Function(StoreReviewListResponse) then) =
      _$StoreReviewListResponseCopyWithImpl<$Res, StoreReviewListResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'dtoList') List<StoreReview> reviewList,
      int totalPage,
      int page,
      int size,
      bool last});
}

/// @nodoc
class _$StoreReviewListResponseCopyWithImpl<$Res,
        $Val extends StoreReviewListResponse>
    implements $StoreReviewListResponseCopyWith<$Res> {
  _$StoreReviewListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviewList = null,
    Object? totalPage = null,
    Object? page = null,
    Object? size = null,
    Object? last = null,
  }) {
    return _then(_value.copyWith(
      reviewList: null == reviewList
          ? _value.reviewList
          : reviewList // ignore: cast_nullable_to_non_nullable
              as List<StoreReview>,
      totalPage: null == totalPage
          ? _value.totalPage
          : totalPage // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      last: null == last
          ? _value.last
          : last // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StoreReviewListResponseCopyWith<$Res>
    implements $StoreReviewListResponseCopyWith<$Res> {
  factory _$$_StoreReviewListResponseCopyWith(_$_StoreReviewListResponse value,
          $Res Function(_$_StoreReviewListResponse) then) =
      __$$_StoreReviewListResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'dtoList') List<StoreReview> reviewList,
      int totalPage,
      int page,
      int size,
      bool last});
}

/// @nodoc
class __$$_StoreReviewListResponseCopyWithImpl<$Res>
    extends _$StoreReviewListResponseCopyWithImpl<$Res,
        _$_StoreReviewListResponse>
    implements _$$_StoreReviewListResponseCopyWith<$Res> {
  __$$_StoreReviewListResponseCopyWithImpl(_$_StoreReviewListResponse _value,
      $Res Function(_$_StoreReviewListResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviewList = null,
    Object? totalPage = null,
    Object? page = null,
    Object? size = null,
    Object? last = null,
  }) {
    return _then(_$_StoreReviewListResponse(
      reviewList: null == reviewList
          ? _value._reviewList
          : reviewList // ignore: cast_nullable_to_non_nullable
              as List<StoreReview>,
      totalPage: null == totalPage
          ? _value.totalPage
          : totalPage // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      last: null == last
          ? _value.last
          : last // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StoreReviewListResponse implements _StoreReviewListResponse {
  _$_StoreReviewListResponse(
      {@JsonKey(name: 'dtoList') required final List<StoreReview> reviewList,
      required this.totalPage,
      required this.page,
      required this.size,
      required this.last})
      : _reviewList = reviewList;

  factory _$_StoreReviewListResponse.fromJson(Map<String, dynamic> json) =>
      _$$_StoreReviewListResponseFromJson(json);

  final List<StoreReview> _reviewList;
  @override
  @JsonKey(name: 'dtoList')
  List<StoreReview> get reviewList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reviewList);
  }

  @override
  final int totalPage;
  @override
  final int page;
  @override
  final int size;
  @override
  final bool last;

  @override
  String toString() {
    return 'StoreReviewListResponse(reviewList: $reviewList, totalPage: $totalPage, page: $page, size: $size, last: $last)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StoreReviewListResponse &&
            const DeepCollectionEquality()
                .equals(other._reviewList, _reviewList) &&
            (identical(other.totalPage, totalPage) ||
                other.totalPage == totalPage) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.last, last) || other.last == last));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_reviewList),
      totalPage,
      page,
      size,
      last);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StoreReviewListResponseCopyWith<_$_StoreReviewListResponse>
      get copyWith =>
          __$$_StoreReviewListResponseCopyWithImpl<_$_StoreReviewListResponse>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StoreReviewListResponseToJson(
      this,
    );
  }
}

abstract class _StoreReviewListResponse implements StoreReviewListResponse {
  factory _StoreReviewListResponse(
      {@JsonKey(name: 'dtoList') required final List<StoreReview> reviewList,
      required final int totalPage,
      required final int page,
      required final int size,
      required final bool last}) = _$_StoreReviewListResponse;

  factory _StoreReviewListResponse.fromJson(Map<String, dynamic> json) =
      _$_StoreReviewListResponse.fromJson;

  @override
  @JsonKey(name: 'dtoList')
  List<StoreReview> get reviewList;
  @override
  int get totalPage;
  @override
  int get page;
  @override
  int get size;
  @override
  bool get last;
  @override
  @JsonKey(ignore: true)
  _$$_StoreReviewListResponseCopyWith<_$_StoreReviewListResponse>
      get copyWith => throw _privateConstructorUsedError;
}
