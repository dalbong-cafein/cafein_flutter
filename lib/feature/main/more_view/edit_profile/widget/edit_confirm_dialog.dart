import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/material.dart';

class EditConfirmDialog extends StatelessWidget {
  const EditConfirmDialog({Key? key}) : super(key: key);

  static Future<bool> show(BuildContext context) async {
    final result = await showDialog(
      context: context,
      builder: (context) => const EditConfirmDialog(),
    );

    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 300,
        height: 140,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 28,
            right: 24,
            left: 24,
            bottom: 16,
          ),
          child: Column(
            children: [
              const Text(
                '변경 사항을 저장할까요?',
                style: AppStyle.subTitle17Bold,
              ),
              const Spacer(),
              Row(children: [
                Expanded(
                  child: SizedBox(
                    height: 44,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: AppColor.white,
                        onPrimary: AppColor.grey800,
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
                      child: const Text('아니요'),
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
                      child: const Text('네'),
                    ),
                  ),
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
