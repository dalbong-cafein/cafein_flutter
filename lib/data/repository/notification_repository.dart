import 'package:cafein_flutter/data/datasource/remote/base_response.dart';
import 'package:cafein_flutter/data/datasource/remote/retrofit/notification_client.dart';
import 'package:cafein_flutter/data/model/notification/notification.dart';
import 'package:cafein_flutter/data/model/notification/report_notification.dart';

abstract class NotificationRepository {
  Future<BaseResponse<List<Notification>>> getNotices();

  Future<BaseResponse<dynamic>> readNotice(
    int noticeId,
  );

  Future<BaseResponse<dynamic>> deleteNotice(
    int noticeId,
  );

  Future<BaseResponse<dynamic>> deleteAllNotice();

  Future<BaseResponse<ReportNotification>> getReportNotification(int noticeId);
}

class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationClient notificationClient;

  const NotificationRepositoryImpl({
    required this.notificationClient,
  });

  @override
  Future<BaseResponse> deleteNotice(int noticeId) =>
      notificationClient.deleteNotice(
        noticeId,
      );

  @override
  Future<BaseResponse<List<Notification>>> getNotices() =>
      notificationClient.getNotices();

  @override
  Future<BaseResponse> readNotice(int noticeId) =>
      notificationClient.readNotice(
        noticeId,
      );

  @override
  Future<BaseResponse> deleteAllNotice() =>
      notificationClient.deleteAllNotice();

  @override
  Future<BaseResponse<ReportNotification>> getReportNotification(
          int noticeId) =>
      notificationClient.getReportNotification(noticeId);
}
