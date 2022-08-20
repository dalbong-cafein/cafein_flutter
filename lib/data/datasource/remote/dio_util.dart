import 'package:cafein_flutter/cafein_config.dart';
import 'package:cafein_flutter/data/datasource/local/app_database.dart';
import 'package:cafein_flutter/data/datasource/local/preference/auth_preference.dart';
import 'package:cafein_flutter/data/datasource/remote/retrofit/auth_client.dart';
import 'package:cafein_flutter/data/model/auth/token_data.dart';
import 'package:cafein_flutter/util/logger/custom_dio_logger.dart';
import 'package:dio/dio.dart';

class DioUtil {
  static final DioUtil _instance = DioUtil._();

  factory DioUtil() => _instance;

  late final AuthPreference authPreference;

  DioUtil._() {
    authPreference = AppDatabase().authPreference;
  }

  Dio get authDio {
    final dio = Dio(
      BaseOptions(
        connectTimeout: 5000,
      ),
    );

    dio.interceptors.add(CustomDioLogger('authDio'));

    return dio;
  }

  Dio get kakaoDio {
    final dio = Dio(
      BaseOptions(
        connectTimeout: 5000,
        headers: {
          'Authorization': 'KakaoAK ${CafeinConfig.kakaoRestApiKey}',
        },
      ),
    );

    dio.interceptors.add(CustomDioLogger('kakaoDio'));

    return dio;
  }

  Dio get dio {
    final dio = Dio(
      BaseOptions(
        connectTimeout: 5000,
      ),
    );
    dio.interceptors.add(CustomDioLogger(
      'dio',
      responseBody: true,
    ));
    dio.interceptors.add(
      QueuedInterceptorsWrapper(
        onRequest: (options, handler) {
          final tokenData = authPreference.getTokenData();

          if (tokenData == null) {
            return handler.next(options);
          }

          final authorizationData = 'accessToken=${tokenData.accessToken}';

          if (options.headers['cookie'] != authorizationData) {
            options.headers['cookie'] = authorizationData;
          }

          return handler.next(options);
        },
        onError: (error, handler) async {
          final tokenData = authPreference.getTokenData();

          if (tokenData == null) {
            return handler.next(error);
          }

          if (error.response?.statusCode == 401) {
            return handler.next(error);
          }

          RequestOptions options = error.response!.requestOptions;

          final authorizationData = 'accessToken=${tokenData.accessToken}';

          if (options.headers['cookie'] != authorizationData) {
            options.headers['cookie'] = authorizationData;
            return dio.fetch(options).then((r) => handler.resolve(r));
          }

          return AuthClient(Dio()..interceptors.add(CustomDioLogger('refreshDio')))
              .refreshAccessToken()
              .then(
            (value) async {
              final List<String> tokenDatas = value.response.headers['set-cookie'] ?? [];
              if (tokenDatas.isNotEmpty) {
                final accessToken = tokenDatas.first.substring(12).split(';').first;

                await authPreference
                    .setTokenData(TokenData(accessToken: accessToken, refreshToken: ''));

                options.headers['cookie'] = 'accessToken=$accessToken';
              }
              return dio.fetch(options).then((r) => handler.resolve(r));
            },
          ).onError((_, stackTrace) => handler.next(error));
        },
      ),
    );

    return dio;
  }
}
