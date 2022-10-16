import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/material.dart';

class ReportBottomSheet extends StatelessWidget {
  const ReportBottomSheet({Key? key}) : super(key: key);

  static Future<bool> show(BuildContext context) async {
    final result = await showModalBottomSheet<bool?>(
      context: context,
      builder: (context) => const ReportBottomSheet(),
    );

    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: InkWell(
        onTap: () => Navigator.of(context).pop(true),
        child: const SizedBox(
          height: 100,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 24,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '신고하기',
                style: AppStyle.subTitle15Medium,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
