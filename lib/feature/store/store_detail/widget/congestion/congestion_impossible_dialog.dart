import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/material.dart';

class CongestionImpossibleDialog extends StatelessWidget {
  const CongestionImpossibleDialog({super.key});

  static Future<void> show(BuildContext context) async {
    final navigator = Navigator.of(context);

    showDialog(
      context: context,
      builder: (context) => const CongestionImpossibleDialog(),
    );
    await Future.delayed(const Duration(seconds: 1));
    navigator.pop();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Dialog(
        child: Container(
          height: 84,
          width: 248,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(0, 0, 0, 0.8),
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          child: Center(
            child: Text(
              '혼잡도는 카페 근처에서\n알려줄 수 있어요',
              style: AppStyle.body15Regular.copyWith(
                color: AppColor.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
