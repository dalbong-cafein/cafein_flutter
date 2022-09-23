import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({Key? key}) : super(key: key);
  static const routeName = 'ReportPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body : Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 24
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "신고하는 이유를 알려주세요",
              style: AppStyle.title21Bold.copyWith(
                color : AppColor.grey900
              ),
            ),
            Text(
              "신고 이유가 타당하지 않으면 반영되지 않을 수\n있습니다.",
              style: AppStyle.body14Regular.copyWith(
                color : AppColor.grey600
              ),
            )
          ],
        ),
      )
    );
  }
}
