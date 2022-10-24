import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/material.dart';

class ReviewBackDialog extends StatelessWidget {
  const ReviewBackDialog({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  static Future<bool> show(
    BuildContext context, {
    required String title,
  }) async {
    final result = await showDialog<bool?>(
      context: context,
      builder: (context) => ReviewBackDialog(title: title),
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
              Text(
                '리뷰 $title을 그만두시겠어요?',
                style: AppStyle.subTitle17Bold,
              ),
              const SizedBox(height: 12),
              Text(
                '작성중인 리뷰는 저장되지 않습니다.',
                style: AppStyle.body14Regular.copyWith(
                  color: AppColor.grey600,
                ),
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
                        child: const Text('이어서 쓰기'),
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
                        child: const Text('그만하기'),
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
