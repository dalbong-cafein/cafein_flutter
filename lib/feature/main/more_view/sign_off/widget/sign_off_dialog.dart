import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/material.dart';

class SignOffDialog extends StatelessWidget {
  const SignOffDialog({Key? key}) : super(key: key);

  static Future<void> show(BuildContext context) async => await showDialog(
        context: context,
        builder: (context) => const SignOffDialog(),
      );

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: 162,
        width: 300,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 12),
              const Text(
                '탈퇴 처리되었습니다',
                style: AppStyle.subTitle17Bold,
              ),
              const SizedBox(height: 12),
              Text(
                '그동안 카페인을 이용해 주셔서 감사합니다',
                style: AppStyle.body14Regular.copyWith(
                  color: AppColor.grey600,
                ),
              ),
              const Spacer(),
              SizedBox(
                height: 44,
                width: 268,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('확인'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
