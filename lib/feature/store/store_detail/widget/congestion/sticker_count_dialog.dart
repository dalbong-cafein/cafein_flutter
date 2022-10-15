part of '../store_congestion_card.dart';

class StickerCountDialog extends StatelessWidget {
  const StickerCountDialog({Key? key}) : super(key: key);

  static Future<bool?> show(BuildContext context) async {
    final result = await showDialog<bool?>(
      context: context,
      builder: (context) => const StickerCountDialog(),
    );

    return result;
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
                '스티커 20개를 모두 모았어요',
                style: AppStyle.subTitle17Bold,
              ),
              const SizedBox(height: 12),
              Text(
                '스티커는 20개 이상 모을 수 없습니다. 쿠폰은\n신청한 뒤에 스터커를 받을 수 있습니다.',
                style: AppStyle.body14Regular.copyWith(
                  color: AppColor.grey600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () => Navigator.of(context).pop(true),
                child: Text(
                  '쿠폰 신청하기',
                  style: AppStyle.subTitle15Medium.copyWith(
                    color: AppColor.orange500,
                  ),
                ),
              ),
              const SizedBox(height: 32),
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
                        child: const Text('무시하고 작성하기'),
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
