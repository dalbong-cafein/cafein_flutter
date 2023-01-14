import 'package:cafein_flutter/cafein_config.dart';
import 'package:cafein_flutter/data/datasource/remote/base_response.dart';
import 'package:cafein_flutter/data/model/notification/notification.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'notification_client.g.dart';

@RestApi(baseUrl: CafeinConfig.baseUrl)
abstract class NotificationClient {
  factory NotificationClient(
    Dio dio, {
    String? baseUrl,
  }) = _NotificationClient;

  @GET('/notices')
  Future<BaseResponse<List<Notification>>> getNotices();

  @PATCH('/notices/{noticeId}/read')
  Future<BaseResponse<dynamic>> readNotice(
    @Path() int noticeId,
  );

  @DELETE('/notices/{noticeId}')
  Future<BaseResponse<dynamic>> deleteNotice(
    @Path() int noticeId,
  );

  @DELETE('/notices')
  Future<BaseResponse<dynamic>> deleteAllNotice();

  @GET('/notices/reportType/{noticeId}')
  Future<BaseResponse<dynamic>> getReportNoticeInform(
    @Path() int noticeId,
  );
}
