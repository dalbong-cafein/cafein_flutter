import 'package:dio/dio.dart';

class KakaoApiClient {
  final Dio dio;

  const KakaoApiClient({
    required this.dio,
  });

  Future<String> getCurrentLocation({
    required double longitude,
    required double latitude,
  }) =>
      dio
          .get(
            'https://dapi.kakao.com/v2/local/geo/coord2regioncode.json?x=${longitude}&y=${latitude}',
          )
          .then(
            (value) => value.data['documents'].last['region_2depth_name'],
          );
}
