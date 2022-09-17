import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditPhoneNumberBottomSheet extends StatelessWidget {
  const EditPhoneNumberBottomSheet({Key? key}) : super(key: key);

  static Future<bool> show(BuildContext context) async {
    final result = await showModalBottomSheet<bool?>(
      context: context,
      isScrollControlled: true,
      builder: (context) => const EditPhoneNumberBottomSheet(),
    );

    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bottomPadding = MediaQuery.of(context).viewPadding.bottom;

    return SizedBox(
      height: 206 + bottomPadding,
      width: width,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          right: 20,
          left: 20,
          bottom: 20,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '휴대폰 번호를 변경하려면\n본인 인증이 필요해요',
                  style: AppStyle.title19Bold,
                ),
                InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Icon(
                    CupertinoIcons.xmark,
                  ),
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              height: 48,
              width: width - 40,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(true),
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                ),
                child: const Text('본인 인증하기'),
              ),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              style: TextButton.styleFrom(
                foregroundColor: AppColor.grey700,
                textStyle: AppStyle.subTitle15Medium,
              ),
              child: const Text('다음에 하기'),
            )
          ],
        ),
      ),
    );
  }
}
