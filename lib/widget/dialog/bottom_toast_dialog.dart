import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/material.dart';

class BottomToastDialog extends StatelessWidget {
  const BottomToastDialog({
    super.key,
    required this.isHeart,
  });

  final bool isHeart;

  static Future<void> show(
    BuildContext context, {
    required bool isHeart,
  }) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        duration: const Duration(seconds: 2),
        elevation: 0,
        content: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          height: 52,
          alignment: Alignment.centerLeft,
          decoration: const BoxDecoration(
            color: AppColor.grey700,
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          child: Text(
            isHeart ? '나의 카페에 저장했습니다.' : '나의 카페에서 삭제했습니다.',
            style: AppStyle.body15Regular.copyWith(
              color: AppColor.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Dialog(
        alignment: Alignment.bottomCenter,
        insetPadding: const EdgeInsets.symmetric(horizontal: 16),
        backgroundColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          height: 52,
          alignment: Alignment.centerLeft,
          decoration: const BoxDecoration(
            color: AppColor.grey700,
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          child: Text(
            isHeart ? '나의 카페에 저장했습니다.' : '나의 카페에서 삭제했습니다.',
            style: AppStyle.body15Regular.copyWith(
              color: AppColor.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
