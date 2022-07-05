import 'dart:math' as math;
import 'dart:developer';

import 'package:dio/dio.dart';

class DioLogger extends Interceptor {
  final bool request;
  final bool requestHeader;
  final bool requestBody;
  final bool responseBody;
  final bool responseHeader;
  final bool error;
  static const int initialTab = 1;
  static const String tabStep = '    ';
  final bool compact;
  final int maxWidth;
  final String dioName;

  DioLogger(
    this.dioName, {
    this.request = true,
    this.requestHeader = true,
    this.requestBody = true,
    this.responseHeader = false,
    this.responseBody = true,
    this.error = true,
    this.maxWidth = 90,
    this.compact = true,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('========== $dioName request ==========');
    if (request) {
      _printRequestHeader(options);
    }
    if (requestHeader) {
      _printMapAsTable(options.queryParameters, header: 'Query Parameters');
      final requestHeaders = <String, dynamic>{};
      requestHeaders.addAll(options.headers);
      requestHeaders['contentType'] = options.contentType?.toString();
      requestHeaders['responseType'] = options.responseType.toString();
      requestHeaders['followRedirects'] = options.followRedirects;
      requestHeaders['connectTimeout'] = options.connectTimeout;
      requestHeaders['receiveTimeout'] = options.receiveTimeout;
      _printMapAsTable(requestHeaders, header: 'Headers');
      _printMapAsTable(options.extra, header: 'Extras');
    }
    if (requestBody && options.method != 'GET') {
      final dynamic data = options.data;
      if (data != null) {
        if (data is Map) _printMapAsTable(options.data as Map?, header: 'Body');
        if (data is FormData) {
          final formDataMap = <String, dynamic>{}
            ..addEntries(data.fields)
            ..addEntries(data.files);
          _printMapAsTable(formDataMap, header: 'Form data | ${data.boundary}');
        } else {
          _printBlock(data.toString());
        }
      }
    }
    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    log('========== $dioName error ==========');
    if (error) {
      if (err.type == DioErrorType.response) {
        final uri = err.response?.requestOptions.uri;
        _printBoxed(
            header: 'DioError ║ Status: ${err.response?.statusCode} ${err.response?.statusMessage}',
            text: uri.toString());
        if (err.response != null && err.response?.data != null) {
          log('╔ ${err.type.toString()}');
          _printResponse(err.response!);
        }
        _printLine('╚');
        log('');
      } else {
        _printBoxed(header: 'DioError ║ ${err.type}', text: err.message);
      }
    }
    super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('========== $dioName response ==========');
    _printResponseHeader(response);
    if (responseHeader) {
      final responseHeaders = <String, String>{};
      response.headers.forEach((k, list) => responseHeaders[k] = list.toString());
      _printMapAsTable(responseHeaders, header: 'Headers');
    }

    if (responseBody) {
      log('╔ Body');
      log('║');
      _printResponse(response);
      log('║');
      _printLine('╚');
    }
    super.onResponse(response, handler);
  }

  void _printBoxed({String? header, String? text}) {
    log('');
    log('╔╣ $header');
    log('║  $text');
    _printLine('╚');
  }

  void _printResponse(Response response) {
    if (response.data != null) {
      if (response.data is Map) {
        _printPrettyMap(response.data as Map);
      } else if (response.data is List) {
        log('║${_indent()}[');
        _printList(response.data as List);
        log('║${_indent()}[');
      } else {
        _printBlock(response.data.toString());
      }
    }
  }

  void _printResponseHeader(Response response) {
    final uri = response.requestOptions.uri;
    final method = response.requestOptions.method;
    _printBoxed(
        header: 'Response ║ $method ║ Status: ${response.statusCode} ${response.statusMessage}',
        text: uri.toString());
  }

  void _printRequestHeader(RequestOptions options) {
    final uri = options.uri;
    final method = options.method;
    _printBoxed(header: 'Request ║ $method ', text: uri.toString());
  }

  void _printLine([String pre = '', String suf = '╝']) => log('$pre${'═' * maxWidth}$suf');

  void _printKV(String? key, Object? v) {
    final pre = '╟ $key: ';
    final msg = v.toString();

    if (pre.length + msg.length > maxWidth) {
      log(pre);
      _printBlock(msg);
    } else {
      log('$pre$msg');
    }
  }

  void _printBlock(String msg) {
    final lines = (msg.length / maxWidth).ceil();
    for (var i = 0; i < lines; ++i) {
      log((i >= 0 ? '║ ' : '') +
          msg.substring(i * maxWidth, math.min<int>(i * maxWidth + maxWidth, msg.length)));
    }
  }

  String _indent([int tabCount = initialTab]) => tabStep * tabCount;

  void _printPrettyMap(
    Map data, {
    int tabs = initialTab,
    bool isListItem = false,
    bool isLast = false,
  }) {
    final isRoot = tabs == initialTab;
    final initialIndent = _indent(tabs);
    tabs++;

    if (isRoot || isListItem) log('║$initialIndent{');

    data.keys.toList().asMap().forEach((index, dynamic key) {
      final isLast = index == data.length - 1;
      dynamic value = data[key];
      if (value is String) {
        value = '"${value.toString().replaceAll(RegExp(r'(\r|\n)+'), " ")}"';
      }
      if (value is Map) {
        if (compact && _canFlattenMap(value)) {
          log('║${_indent(tabs)} $key: $value${!isLast ? ',' : ''}');
        } else {
          log('║${_indent(tabs)} $key: {');
          _printPrettyMap(value, tabs: tabs);
        }
      } else if (value is List) {
        if (compact && _canFlattenList(value)) {
          log('║${_indent(tabs)} $key: ${value.toString()}');
        } else {
          log('║${_indent(tabs)} $key: [');
          _printList(value, tabs: tabs);
          log('║${_indent(tabs)} ]${isLast ? '' : ','}');
        }
      } else {
        final msg = value.toString().replaceAll('\n', '');
        final indent = _indent(tabs);
        final linWidth = maxWidth - indent.length;
        if (msg.length + indent.length > linWidth) {
          final lines = (msg.length / linWidth).ceil();
          for (var i = 0; i < lines; ++i) {
            log('║${_indent(tabs)} ${msg.substring(i * linWidth, math.min<int>(i * linWidth + linWidth, msg.length))}');
          }
        } else {
          log('║${_indent(tabs)} $key: $msg${!isLast ? ',' : ''}');
        }
      }
    });

    log('║$initialIndent}${isListItem && !isLast ? ',' : ''}');
  }

  void _printList(List list, {int tabs = initialTab}) {
    list.asMap().forEach((i, dynamic e) {
      final isLast = i == list.length - 1;
      if (e is Map) {
        if (compact && _canFlattenMap(e)) {
          log('║${_indent(tabs)}  $e${!isLast ? ',' : ''}');
        } else {
          _printPrettyMap(e, tabs: tabs + 1, isListItem: true, isLast: isLast);
        }
      } else {
        log('║${_indent(tabs + 2)} $e${isLast ? '' : ','}');
      }
    });
  }

  bool _canFlattenMap(Map map) {
    return map.values.where((dynamic val) => val is Map || val is List).isEmpty &&
        map.toString().length < maxWidth;
  }

  bool _canFlattenList(List list) {
    return list.length < 10 && list.toString().length < maxWidth;
  }

  void _printMapAsTable(Map? map, {String? header}) {
    if (map == null || map.isEmpty) return;
    log('╔ $header ');
    map.forEach((dynamic key, dynamic value) => _printKV(key.toString(), value));
    _printLine('╚');
  }
}
