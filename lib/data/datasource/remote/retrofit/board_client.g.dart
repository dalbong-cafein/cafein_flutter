// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _BoardClient implements BoardClient {
  _BoardClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://api.cafeinofficial.com';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<BaseResponse<List<Board>>> getBoards(categoryId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'boardCategoryId': categoryId};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<List<Board>>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/boards',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<List<Board>>.fromJson(
      _result.data!,
      (json) => (json as List<dynamic>)
          .map<Board>((i) => Board.fromJson(i as Map<String, dynamic>))
          .toList(),
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
