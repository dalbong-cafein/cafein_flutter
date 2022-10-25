import 'package:cafein_flutter/data/model/board/board.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/datetime/ymd_dot_format.dart';
import 'package:flutter/material.dart';

class NoticeDetailPage extends StatelessWidget {
  const NoticeDetailPage({
    Key? key,
    required this.notice,
  }) : super(key: key);

  final Board notice;

  static const routeName = 'NoticeDetailPage';

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('공지사항'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: AppColor.grey50,
            height: 90,
            width: width,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 24,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notice.title,
                    style: AppStyle.subTitle16Medium,
                  ),
                  Text(
                    ymdDotFormat(notice.registeredDateTime),
                    style: AppStyle.caption13Regular.copyWith(
                      color: AppColor.grey400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Text(
              notice.content,
              style: AppStyle.body14Regular,
            ),
          ),
        ],
      ),
    );
  }
}
