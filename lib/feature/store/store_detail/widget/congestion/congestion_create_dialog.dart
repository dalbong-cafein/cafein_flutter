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
        height: 280,
        width: 300,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: loadAsset(
                    AppIcon.clear24M,
                  ),
                ),
              ),
              const SizedBox(height: 8),

              const Text(
                '지금 카페의 혼잡도는 어떤가요?',
                style: AppStyle.subTitle17Bold,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () => setState(() => score = 1),
                    child: _CongestionScoreColumn(
                      isChecked: score == 1,
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
                      offIcon: AppImage.confNormalGrey,
                      onIcon: AppImage.confNormal,
                    ),
                  ),
                  InkWell(
                    onTap: () => setState(() => score = 3),
                    child: _CongestionScoreColumn(
                      isChecked: score == 3,
                      title: '북적거려요',
                      offIcon: AppImage.confBadGrey,
                      onIcon: AppImage.confBad,
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
                  child: const Text('알려주기'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
