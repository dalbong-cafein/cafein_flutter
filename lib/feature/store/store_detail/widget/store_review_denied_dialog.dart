import 'package:cafein_flutter/feature/main/more_view/faq/faq_page.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/material.dart';

class StoreReviewDeniedDialog extends StatelessWidget {
  const StoreReviewDeniedDialog({super.key});

  static Future<bool> show(BuildContext context) async {
    final result = await showDialog<bool?>(
      context: context,
      builder: (context) => const StoreReviewDeniedDialog(),
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
                '신고 정책에 따라',
                style: AppStyle.subTitle17Bold,
                textAlign: TextAlign.center,
              ),
              const Text(
                '혼잡도 공유를 할 수 없습니다.',
                style: AppStyle.subTitle17Bold,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                '신고 정책은 자세히 보기 버튼을 통해',
                style: AppStyle.body14Regular.copyWith(color: AppColor.grey600),
                textAlign: TextAlign.center,
              ),
              Text(
                '확인 할 수 있습니다.',
                style: AppStyle.body14Regular.copyWith(color: AppColor.grey600),
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
                        onPressed: () => Navigator.of(context).pushNamed(
                          FaqPage.routeName,
                        ),
                        child: const Text('자세히 보기'),
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
                        child: const Text('닫기'),
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
