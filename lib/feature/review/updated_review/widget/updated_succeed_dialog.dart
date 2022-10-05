import 'dart:async';

import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/material.dart';

class UpdatedSucceedDialog extends StatelessWidget {
  const UpdatedSucceedDialog({Key? key}) : super(key: key);

  static Future<void> show(BuildContext context) async {
    final navigator = Navigator.of(context);

    showDialog(
      context: context,
      builder: (context) => const UpdatedSucceedDialog(),
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
          height: 60,
          width: 248,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(0, 0, 0, 0.8),
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          child: Center(
            child: Text(
              '리뷰가 수정되었습니다',
              style: AppStyle.body15Regular.copyWith(
                color: AppColor.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
