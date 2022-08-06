import 'package:cafein_flutter/cafein_config.dart';
import 'package:cafein_flutter/data/datasource/remote/base_response.dart';
import 'package:cafein_flutter/data/model/notice/notice.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'notice_client.g.dart';

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
}
