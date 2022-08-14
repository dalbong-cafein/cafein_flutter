import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  static const routeName = 'SettingPage';

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '설정',
          style: AppStyle.subTitle16Medium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 16),
            SizedBox(
              height: 56,
              width: width - 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '공지사항/이벤트/스티커 지급 알림 받기',
                    style: AppStyle.subTitle15Medium,
                  ),
                  CupertinoSwitch(
                    value: isSelected,
                    onChanged: (value) => setState(
                      () => isSelected = value,
                    ),
                    activeColor: AppColor.orange500,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Container(
              height: 1,
              width: width - 40,
              color: AppColor.grey50,
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 56,
              width: width - 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '버전정보',
                    style: AppStyle.subTitle15Medium,
                  ),
                  Text(
                    '1.0.0',
                    style: AppStyle.body14Regular.copyWith(
                      color: AppColor.grey400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
