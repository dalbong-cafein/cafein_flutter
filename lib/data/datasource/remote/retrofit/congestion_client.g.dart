// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'congestion_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _CongestionClient implements CongestionClient {
  _CongestionClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://api.cafeinofficial.com';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<BaseResponse<int>> createCongestion(congestionRequest) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(congestionRequest.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<BaseResponse<int>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/congestion',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<int>.fromJson(
      _result.data!,
      (json) => json as int,
    );
    return value;
  }

  @override
  Future<BaseResponse<CongestionResponse>> getCongestions(
    storeId,
    minusDays,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'minusDays': minusDays};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<CongestionResponse>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/stores/${storeId}/congestion',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<CongestionResponse>.fromJson(
      _result.data!,
      (json) => CongestionResponse.fromJson(json as Map<String, dynamic>),
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
