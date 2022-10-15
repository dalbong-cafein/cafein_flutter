part of '../store_congestion_card.dart';

class CongestionCreateDialog extends StatefulWidget {
  const CongestionCreateDialog({Key? key}) : super(key: key);

  static Future<int> show(BuildContext context) async {
    final result = await showDialog<int?>(
      context: context,
      builder: (context) => const CongestionCreateDialog(),
    );

    return result ?? -1;
  }

  @override
  State<CongestionCreateDialog> createState() => _CongestionCreateDialogState();
}

class _CongestionCreateDialogState extends State<CongestionCreateDialog> {
  int score = -1;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: 300,
        width: 300,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                '지금 카페의 혼잡도는 어떤가요?',
                style: AppStyle.subTitle17Bold,
              ),
              const SizedBox(height: 12),
              Text(
                '혼잡도를 알려주시면 스티커를 드려요.',
                style: AppStyle.body14Regular.copyWith(
                  color: AppColor.grey600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () => setState(() => score = 3),
                    child: _CongestionScoreColumn(
                      isChecked: score == 3,
                      title: '널널해요',
                      offIcon: AppImage.confGoodGrey,
                      onIcon: AppImage.confGood,
                    ),
                  ),
                  InkWell(
                    onTap: () => setState(() => score = 2),
                    child: _CongestionScoreColumn(
                      isChecked: score == 2,
                      title: '괜찮아요',
                      offIcon: AppImage.confGoodGrey,
                      onIcon: AppImage.confGood,
                    ),
                  ),
                  InkWell(
                    onTap: () => setState(() => score = 1),
                    child: _CongestionScoreColumn(
                      isChecked: score == 1,
                      title: '북적거려요',
                      offIcon: AppImage.confGoodGrey,
                      onIcon: AppImage.confGood,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              SizedBox(
                height: 44,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: score != -1
                      ? () => Navigator.of(context).pop(score)
                      : null,
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
