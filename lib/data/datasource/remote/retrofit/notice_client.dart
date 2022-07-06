import 'package:cafein_flutter/cafein_config.dart';
import 'package:cafein_flutter/data/datasource/remote/base_response.dart';
import 'package:cafein_flutter/data/model/notice/notice.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'notice_client.g.dart';

@RestApi(baseUrl: CafeinConfig.baseUrl)
abstract class NoticeClient {
  factory NoticeClient(
    Dio dio, {
    String? baseUrl,
  }) = _NoticeClient;

  @GET('/notices')
  Future<BaseResponse<List<Notice>>> getNotices();

  @PATCH('/notices/{noticeId}/read')
  Future<BaseResponse<dynamic>> readNotice(
    @Path() int noticeId,
  );

  @DELETE('/notices/{noticeId}')
  Future<BaseResponse<dynamic>> deleteNotice(
    @Path() int noticeId,
  );
}
