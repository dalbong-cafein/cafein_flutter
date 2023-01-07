import 'package:cafein_flutter/cafein_config.dart';
import 'package:cafein_flutter/data/datasource/remote/base_response.dart';
import 'package:cafein_flutter/data/model/report/report_category.dart';
import 'package:cafein_flutter/data/model/report/report_possible.dart';
import 'package:cafein_flutter/data/model/report/report_request.dart';
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
  Future<BaseResponse<dynamic>> createReportReview(
    @Path() int reviewId,
    @Body() ReportRequest reportRequest,
  );

  @GET('/reportCategorys')
  Future<BaseResponse<List<ReportCategory>>> getReportCategories();

  @GET('reviews/{storeId}/reports/check-possible-report')
  Future<BaseResponse<ReportPossible>>getReportPossible(
      @Path() int storeId
      );
}
