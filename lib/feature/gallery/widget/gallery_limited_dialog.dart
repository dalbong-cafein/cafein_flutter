import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/material.dart';

class GalleryLimitedDialog extends StatelessWidget {
  const GalleryLimitedDialog({super.key});

  static Future<void> show(BuildContext context) => showDialog(
        context: context,
        builder: (context) => const GalleryLimitedDialog(),
      );

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 300,
        height: 140,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 32,
            right: 16,
            left: 16,
            bottom: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '이미지는 최대 5장까지 선택할 수 있어요',
                style: AppStyle.body14Regular,
              ),
              SizedBox(
                height: 44,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: AppColor.white,
                    backgroundColor: AppColor.orange400,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    textStyle: AppStyle.subTitle16Medium,
                  ),
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
