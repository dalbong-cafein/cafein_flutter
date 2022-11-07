part of '../store_congestion_card.dart';

class CreatedSucceedWithoutStickerDialog extends StatelessWidget {
  const CreatedSucceedWithoutStickerDialog({Key? key}) : super(key: key);

  static Future<void> show(
    BuildContext context,
  ) async =>
      await showDialog(
        context: context,
        builder: (context) => const CreatedSucceedWithoutStickerDialog(),
      );

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 300,
        height: 204,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 30,
            left: 16,
            right: 16,
            bottom: 16,
          ),
          child: Column(
            children: [
              const Text(
                '혼잡도 공유 완료',
                style: AppStyle.subTitle17Bold,
              ),
              const SizedBox(height: 12),
              Text(
                '일시적인 에러가 발생하여 스티커가\n지급되지 않았습니다. 누락된 스티커는\n1일 이내로 지급될 예정입니다.',
                style: AppStyle.body14Regular.copyWith(
                  color: AppColor.grey600,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
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
