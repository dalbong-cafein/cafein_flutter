// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _ReviewClient implements ReviewClient {
  _ReviewClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://api.cafeinofficial.com';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<BaseResponse<ReviewResponse<StoreReviewListResponse>>> getStoreReviews(
      storeId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<ReviewResponse<StoreReviewListResponse>>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/stores/${storeId}/reviews',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value =
        BaseResponse<ReviewResponse<StoreReviewListResponse>>.fromJson(
      _result.data!,
      (json) => ReviewResponse<StoreReviewListResponse>.fromJson(
        json as Map<String, dynamic>,
        (json) =>
            StoreReviewListResponse.fromJson(json as Map<String, dynamic>),
      ),
    );
    return value;
  }

  @override
  Future<BaseResponse<ReviewDetailScore>> getStoreReviewScoreDetail(
      storeId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<ReviewDetailScore>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/stores/${storeId}/detail-review-score',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<ReviewDetailScore>.fromJson(
      _result.data!,
      (json) => ReviewDetailScore.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseResponse<ReviewResponse<List<UserReview>>>>
      getUserReviews() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<ReviewResponse<List<UserReview>>>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/members/reviews',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<ReviewResponse<List<UserReview>>>.fromJson(
      _result.data!,
      (json) => ReviewResponse<List<UserReview>>.fromJson(
        json as Map<String, dynamic>,
        (json) => (json as List<dynamic>)
            .map<UserReview>(
                (i) => UserReview.fromJson(i as Map<String, dynamic>))
            .toList(),
      ),
    );
    return value;
  }

  @override
  Future<BaseResponse<ReviewResponse<Review>>> getMyRegisteredReviews(
      limit) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'limit': limit};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<ReviewResponse<Review>>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/stores/{storeId}/reviews/limit',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<ReviewResponse<Review>>.fromJson(
      _result.data!,
      (json) => ReviewResponse<Review>.fromJson(
        json as Map<String, dynamic>,
        (json) => Review.fromJson(json as Map<String, dynamic>),
      ),
    );
    return value;
  }

  @override
  Future<BaseResponse<dynamic>> deleteReview(reviewId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<dynamic>>(
            Options(method: 'DELETE', headers: _headers, extra: _extra)
                .compose(_dio.options, '/reviews/${reviewId}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<dynamic>.fromJson(
      _result.data!,
      (json) => json as dynamic,
    );
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
