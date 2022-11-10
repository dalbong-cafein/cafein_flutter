import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreatedReviewImpossibleDialog extends StatelessWidget {
  const CreatedReviewImpossibleDialog({super.key});

  static Future<void> show(BuildContext context) => showDialog(
        context: context,
        builder: (context) => const CreatedReviewImpossibleDialog(),
      );

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      content: const Text(
        '동일한 카페의 리뷰는\n하루에 1번만 작성할 수 있습니다',
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
