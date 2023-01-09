import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/material.dart';

class StoreDetailReviewReportOverlapDialog extends StatelessWidget {
  const StoreDetailReviewReportOverlapDialog({Key? key}) : super(key: key);

  static Future<void> show(BuildContext context) async {
    final navigator = Navigator.of(context);
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.transparent,
      builder: (context) => const StoreDetailReviewReportOverlapDialog(),
    );
    await Future.delayed(const Duration(seconds: 1));
    navigator.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 248,
        height: 60,
        decoration: BoxDecoration(
          color: AppColor.black.withOpacity(0.8),
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        child: Center(
          child: Text(
            '이미 신고된 리뷰입니다.',
            style: AppStyle.body15Regular.copyWith(
              color: AppColor.white,
            ),
          ),
        ),
      ),
    );
  }
}