import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/material.dart';

class ToastDialog extends StatelessWidget {
  const ToastDialog({
    super.key,
    required this.title,
  });

  final String title;

  static Future<void> show(
    BuildContext context, {
    required String title,
  }) async {
    final navigator = Navigator.of(context);

    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      barrierDismissible: true,
      builder: (context) => ToastDialog(
        title: title,
      ),
    );

    await Future.delayed(const Duration(seconds: 1));

    navigator.pop();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 24,
          ),
          width: 248,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(0, 0, 0, 0.8),
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          child: Wrap(
            runAlignment: WrapAlignment.center,
            direction: Axis.vertical,
            children: [
              Text(
                title,
                style: AppStyle.body15Regular.copyWith(
                  color: AppColor.white,
                  height: 1.45
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
