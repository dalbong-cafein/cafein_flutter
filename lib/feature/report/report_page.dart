import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/material.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({Key? key}) : super(key: key);
  static const routeName = 'ReportPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "스티커",
          style: AppStyle.subTitle16Medium,
        ),
      ),
    );
  }
}
