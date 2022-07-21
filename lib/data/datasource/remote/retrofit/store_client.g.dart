// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _StoreClient implements StoreClient {
  _StoreClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://api.cafeinofficial.com';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<BaseResponse<List<Store>>> getStores(keyword) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'keyword': keyword};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<List<Store>>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/stores',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<List<Store>>.fromJson(
      _result.data!,
      (json) => (json as List<dynamic>)
          .map<Store>((i) => Store.fromJson(i as Map<String, dynamic>))
          .toList(),
    );
    return value;
  }

  @override
  Future<BaseResponse<List<RecommendedStore>>> getRecommendedStores(
      keyword) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'keyword': keyword};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<List<RecommendedStore>>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/stores/recommend-search',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<List<RecommendedStore>>.fromJson(
      _result.data!,
      (json) => (json as List<dynamic>)
          .map<RecommendedStore>(
              (i) => RecommendedStore.fromJson(i as Map<String, dynamic>))
          .toList(),
    );
    return value;
  }

  @override
  Future<BaseResponse<StoreDetail>> getStoreDetail(storeId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<StoreDetail>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/stores/${storeId}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<StoreDetail>.fromJson(
      _result.data!,
      (json) => StoreDetail.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<BaseResponse<StoreResponse<RegisteredStore>>>
      getMyRegisteredStores() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<StoreResponse<RegisteredStore>>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/stores/my-registered',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<StoreResponse<RegisteredStore>>.fromJson(
      _result.data!,
      (json) => StoreResponse<RegisteredStore>.fromJson(
        json as Map<String, dynamic>,
        (json) => RegisteredStore.fromJson(json as Map<String, dynamic>),
      ),
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
