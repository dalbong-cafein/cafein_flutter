import 'package:cafein_flutter/data/datasource/remote/base_response.dart';
import 'package:cafein_flutter/data/datasource/remote/form_data_client/store_form_data_client.dart';
import 'package:cafein_flutter/data/datasource/remote/kakao/kakao_api_client.dart';
import 'package:cafein_flutter/data/datasource/remote/retrofit/store_client.dart';
import 'package:cafein_flutter/data/model/kakao/kakao_store_response.dart';
import 'package:cafein_flutter/data/model/store/auto_completed_store.dart';
import 'package:cafein_flutter/data/model/store/recommended_store.dart';
import 'package:cafein_flutter/data/model/store/registered_store.dart';
import 'package:cafein_flutter/data/model/store/registered_store_request.dart';
import 'package:cafein_flutter/data/model/store/store.dart';
import 'package:cafein_flutter/data/model/store/store_detail.dart';
import 'package:cafein_flutter/data/model/store/store_response.dart';
import 'package:cafein_flutter/data/model/store/update_store_request.dart';

abstract class StoreRepository {
  Future<BaseResponse<List<Store>>> getStores({
    String? keyword,
    String? rect,
    String? ceterCoordinates,
    String? userCoordinates,
  });

  Future<BaseResponse<List<RecommendedStore>>> getRecommendedStores(
    String keyword,
  );

  Future<BaseResponse<StoreDetail>> getStoreDetail(
    int storeId,
  );

  Future<BaseResponse<StoreResponse<List<RegisteredStore>>>>
      getMyRegisteredStores();

  Future<BaseResponse<int>> createStore(
    RegisteredStoreRequest registeredStoreRequest,
  );

  Future<BaseResponse<dynamic>> updateStore(
    UpdateStoreRequest updateStoreRequest,
  );

  Future<BaseResponse<List<Store>>> getNearStoreList(
    int storeId,
  );

  Future<BaseResponse<List<AutoCompletedStore>>> getAutoCompletedStoreList(
    String keyword,
  );

  Future<List<KakaoStoreResponse>> getKakaoStores({
    required String query,
    required int page,
    int size = 20,
  });
}

class StoreRepositoryImpl extends StoreRepository {
  final StoreClient storeClient;
  final StoreFormDataClient storeFormDataClient;
  final KakaoApiClient kakaoApiClient;

  StoreRepositoryImpl({
    required this.storeClient,
    required this.storeFormDataClient,
    required this.kakaoApiClient,
  });

  @override
  Future<BaseResponse<int>> createStore(
    RegisteredStoreRequest registeredStoreRequest,
  ) =>
      storeFormDataClient.createStore(registeredStoreRequest);

  @override
  Future<BaseResponse<StoreResponse<List<RegisteredStore>>>>
      getMyRegisteredStores() => storeClient.getMyRegisteredStores();

  @override
  Future<BaseResponse<List<RecommendedStore>>> getRecommendedStores(
          String keyword) =>
      storeClient.getRecommendedStores(keyword);

  @override
  Future<BaseResponse<StoreDetail>> getStoreDetail(int storeId) =>
      storeClient.getStoreDetail(storeId);

  @override
  Future<BaseResponse<List<Store>>> getStores({
    String? keyword,
    String? rect,
    String? ceterCoordinates,
    String? userCoordinates,
  }) =>
      storeClient.getStores(
        keyword,
        rect,
        ceterCoordinates,
        userCoordinates,
      );

  @override
  Future<BaseResponse> updateStore(
    UpdateStoreRequest updateStoreRequest,
  ) =>
      storeFormDataClient.updateStore(updateStoreRequest);

  @override
  Future<BaseResponse<List<Store>>> getNearStoreList(
    int storeId,
  ) =>
      storeClient.getNearStoreList(storeId);

  @override
  Future<List<KakaoStoreResponse>> getKakaoStores({
    required String query,
    required int page,
    int size = 20,
  }) =>
      kakaoApiClient.getKakaoStores(
        query: query,
        page: page,
        size: size,
      );

  @override
  Future<BaseResponse<List<AutoCompletedStore>>> getAutoCompletedStoreList(
          String keyword) =>
      storeClient.getAutoCompletedStoreList(keyword);
}
