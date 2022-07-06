import 'package:cafein_flutter/cafein_config.dart';
import 'package:cafein_flutter/data/datasource/remote/base_response.dart';
import 'package:cafein_flutter/data/model/board/board.dart';
import 'package:cafein_flutter/data/model/report/report_category.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'report_client.g.dart';

@RestApi(baseUrl: CafeinConfig.baseUrl)
abstract class ReportClient {
  factory ReportClient(
    Dio dio, {
    String? baseUrl,
  }) = _ReportClient;

  @POST('/reviews/{reviewId}/reports')
  Future<BaseResponse<dynamic>> createReportReview();

  @GET('/reportCategorys')
  Future<BaseResponse<List<ReportCategory>>> getReportCategories();
}
