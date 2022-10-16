part of '../store_congestion_card.dart';

class CongestionPossibleDialog extends StatelessWidget {
  const CongestionPossibleDialog({Key? key}) : super(key: key);

  static Future<void> show(BuildContext context) => showDialog(
        context: context,
        builder: (context) => const CongestionPossibleDialog(),
      );

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      content: const Text(
        '동일한 카페의 혼잡도는\n3시간에 한번만 공유할 수 있습니다.',
        style: AppStyle.body15Regular,
        textAlign: TextAlign.center,
      ),
      actions: [
        CupertinoDialogAction(
          child: const Text('확인'),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }
}
