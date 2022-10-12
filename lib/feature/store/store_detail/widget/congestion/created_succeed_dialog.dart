import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:flutter/material.dart';

class CreatedSucceedDialog extends StatelessWidget {
  const CreatedSucceedDialog({
    super.key,
    required this.isCreatedSticker,
  });

  final bool isCreatedSticker;

  static Future<bool> show(
    BuildContext context, {
    required bool isCreatedSticker,
  }) async {
    final result = await showDialog<bool?>(
      context: context,
      builder: (context) => CreatedSucceedDialog(
        isCreatedSticker: isCreatedSticker,
      ),
    );

    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 300,
        height: isCreatedSticker ? 280 : 140,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 24,
            horizontal: 16,
          ),
          child: Column(
            children: [
              const SizedBox(height: 12),
              const Text(
                '혼잡도 공유 완료',
                style: AppStyle.subTitle17Bold,
              ),
              if (isCreatedSticker)
                Container(
                  height: 120,
                  width: 180,
                  margin: const EdgeInsets.only(top: 20),
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
            ],
          ),
        ),
      ),
    );
  }
}
