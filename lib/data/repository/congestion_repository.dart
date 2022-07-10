import 'package:cafein_flutter/data/datasource/remote/base_response.dart';
import 'package:cafein_flutter/data/datasource/remote/retrofit/congestion_client.dart';
import 'package:cafein_flutter/data/model/congestion/congestion_request.dart';
import 'package:cafein_flutter/data/model/congestion/congestion_response.dart';

abstract class CongestionRepository {
  Future<BaseResponse<int>> createCongestion(
    CongestionRequest congestionRequest,
  );

  Future<BaseResponse<CongestionResponse>> getCongestions({
    required int storeId,
    required int minusDays,
  });
}

class CongestionRepositoryImpl implements CongestionRepository {
  final CongestionClient congestionClient;

  CongestionRepositoryImpl({
    required this.congestionClient,
  });

  @override
  Future<BaseResponse<int>> createCongestion(
    CongestionRequest congestionRequest,
  ) =>
      congestionClient.createCongestion(congestionRequest);

  @override
  Future<BaseResponse<CongestionResponse>> getCongestions({
    required int storeId,
    required int minusDays,
  }) =>
      congestionClient.getCongestions(storeId, minusDays);
}
