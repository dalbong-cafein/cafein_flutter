import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/material.dart';

class MoreViewSignOutDialog extends StatelessWidget {
  const MoreViewSignOutDialog({Key? key}) : super(key: key);

  static Future<bool> show(BuildContext context) async {
    final result = await showDialog<bool?>(
      context: context,
      builder: (context) => const MoreViewSignOutDialog(),
    );

    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: 124,
        width: 300,
        child: Column(
          children: [
            const SizedBox(
              height: 66,
              width: 300,
              child: Center(
                child: Text(
                  '로그아웃 하시겠습니까',
                  style: AppStyle.body15Regular,
                ),
              ),
            ),
            Container(
              height: 1,
              width: 300,
              color: AppColor.grey50,
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 56,
                    child: TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(
                        '취소',
                        style: AppStyle.subTitle15Medium.copyWith(
                          color: AppColor.blue,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 56,
                  width: 1,
                  color: AppColor.grey50,
                ),
                Expanded(
                  child: SizedBox(
                    height: 56,
                    child: TextButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child: Center(
                        child: Text(
                          '로그아웃',
                          style: AppStyle.subTitle15Medium.copyWith(
                            color: AppColor.red,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
