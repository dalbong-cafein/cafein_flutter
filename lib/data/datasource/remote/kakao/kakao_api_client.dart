import 'dart:developer';

import 'package:cafein_flutter/data/model/kakao/kakao_store_response.dart';
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
            'https://dapi.kakao.com/v2/local/geo/coord2regioncode.json?x=$longitude&y=$latitude',
          )
          .then(
            (value) => value.data['documents'].last['region_2depth_name'],
          );

  Future<List<KakaoStoreResponse>> getKakaoStores({
    required String query,
    required int page,
    int size = 20,
  }) =>
      dio
          .get(
        'https://dapi.kakao.com/v2/local/search/keyword.json?query=$query&category_group_code=CE7&page=$page&size=$size',
      )
          .then(
        (value) {
          final List<dynamic> response = value.data['documents'] ?? [];

          final result = <KakaoStoreResponse>[];

          for (final storeData in response) {
            result.add(KakaoStoreResponse.fromJson(storeData));
          }

          return result;
        },
      );
}
