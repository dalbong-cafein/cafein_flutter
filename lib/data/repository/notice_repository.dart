import 'package:cafein_flutter/data/datasource/remote/base_response.dart';
import 'package:cafein_flutter/data/datasource/remote/retrofit/notice_client.dart';
import 'package:cafein_flutter/data/model/notice/notice.dart';

abstract class NoticeRepository {
  Future<BaseResponse<List<Notice>>> getNotices();

  Future<BaseResponse<dynamic>> readNotice(
    int noticeId,
  );

  Future<BaseResponse<dynamic>> deleteNotice(
    int noticeId,
  );
}

class NoticeRepositoryImpl implements NoticeRepository {
  final NoticeClient noticeClient;

  const NoticeRepositoryImpl({
    required this.noticeClient,
  });

  @override
  Future<BaseResponse> deleteNotice(int noticeId) => noticeClient.deleteNotice(noticeId);

  @override
  Future<BaseResponse<List<Notice>>> getNotices() => noticeClient.getNotices();

  @override
  Future<BaseResponse> readNotice(int noticeId) => noticeClient.readNotice(noticeId);
}
