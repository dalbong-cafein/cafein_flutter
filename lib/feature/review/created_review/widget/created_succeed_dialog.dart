import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:flutter/material.dart';

class CreatedSucceedDialog extends StatelessWidget {
  const CreatedSucceedDialog({super.key});

  static Future<bool> show(BuildContext context) async {
    final result = await showDialog<bool?>(
      context: context,
      builder: (context) => const CreatedSucceedDialog(),
    );

    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 300,
        height: 380,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 24,
            horizontal: 16,
          ),
          child: Column(
            children: [
              const SizedBox(height: 16),
              Container(
                height: 120,
                width: 180,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(16),
                  ),
                  border: Border.all(
                    color: AppColor.grey300,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '스티커 지급 완료',
                      style: AppStyle.caption13Regular,
                    ),
                    loadAsset(AppIcon.latteSticker),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                '리뷰를 작성해 주셔서 감사합니다',
                style: AppStyle.subTitle17Bold,
              ),
              const SizedBox(height: 12),
              const Text(
                '생생한 리뷰를 모아 신뢰할 수 있는\n리뷰 서비스를 제공하기 위해 노력할게요.',
                style: AppStyle.caption13Regular,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
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
              const SizedBox(height: 16),
              InkWell(
                onTap: () => Navigator.of(context).pop(true),
                child: const Text(
                  '리뷰 보러가기',
                  style: AppStyle.subTitle14Medium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
