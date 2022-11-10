import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/material.dart';

class CongestionStickerMaxDialog extends StatelessWidget {
  const CongestionStickerMaxDialog({super.key});

  static Future<bool> show(BuildContext context) async {
    final result = await showDialog<bool?>(
      context: context,
      builder: (context) => const CongestionStickerMaxDialog(),
    );

    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 300,
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 16,
            right: 16,
            left: 16,
            top: 32,
          ),
          child: Wrap(
            direction: Axis.vertical,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              const Text(
                '스티커는 하루에 최대 3개까지\n모을 수 있어요',
                style: AppStyle.subTitle17Bold,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 268,
                height: 44,
                child: Row(
                  children: [
                    Expanded(
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
                        child: const Text('닫기'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          textStyle: AppStyle.subTitle15Medium,
                          padding: EdgeInsets.zero,
                        ),
                        onPressed: () => Navigator.of(context).pop(true),
                        child: const Text('무시하고 알려주기'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
