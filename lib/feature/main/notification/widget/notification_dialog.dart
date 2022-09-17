import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/material.dart';

class NotificationDialog extends StatelessWidget {
  const NotificationDialog({Key? key}) : super(key: key);

  static Future<bool> show(BuildContext context) async {
    final result = await showDialog<bool?>(
      context: context,
      builder: (context) => const NotificationDialog(),
    );

    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: 180,
        width: 300,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 32,
            bottom: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "알림을 모두 삭제하시겠어요?",
                style: AppStyle.subTitle17Bold,
              ),
              const SizedBox(height: 12),
              const Text(
                "삭제된 알림은 다시 확인할 수 없습니다.",
                style: AppStyle.body14Regular,
              ),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 44,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: AppColor.grey800,
                          backgroundColor: AppColor.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          textStyle: AppStyle.subTitle15Medium,
                          side: const BorderSide(
                            color: AppColor.grey400,
                            width: 1,
                          ),
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('취소'),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: SizedBox(
                      height: 44,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          textStyle: AppStyle.subTitle15Medium,
                        ),
                        onPressed: () => Navigator.of(context).pop(true),
                        child: const Text('삭제'),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
