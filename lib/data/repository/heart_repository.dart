import 'package:cafein_flutter/data/datasource/remote/base_response.dart';
import 'package:cafein_flutter/data/datasource/remote/retrofit/heart_client.dart';
import 'package:cafein_flutter/data/model/store/member_store.dart';
import 'package:cafein_flutter/data/model/store/store_response.dart';

abstract class HeartRepository {
  Future<BaseResponse<dynamic>> createHeart(
    int storeId,
  );

  Future<BaseResponse<dynamic>> deleteHeart(
    int storeId,
  );

  Future<BaseResponse<StoreResponse<MemberStore>>> getMyStores();

  Future<BaseResponse<StoreResponse<MemberStore>>> getMyStoresLimit();
}

class HeartRepositoryImpl implements HeartRepository {
  final HeartClient heartClient;

  HeartRepositoryImpl({
    required this.heartClient,
  });

  @override
  Future<BaseResponse> createHeart(
    int storeId,
  ) =>
      heartClient.createHeart(storeId);

  @override
  Future<BaseResponse> deleteHeart(
    int storeId,
  ) =>
      heartClient.deleteHeart(storeId);

  @override
  Future<BaseResponse<StoreResponse<MemberStore>>> getMyStores() => heartClient.getMyStores();

  @override
  Future<BaseResponse<StoreResponse<MemberStore>>> getMyStoresLimit() =>
      heartClient.getMyStoresLimit();
}
