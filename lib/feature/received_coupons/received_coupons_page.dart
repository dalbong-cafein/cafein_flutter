import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReceivedCouponsPage extends StatelessWidget {
  const ReceivedCouponsPage({Key? key}) : super(key: key);
  static const routeName = 'ReceivedCouponsPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "받은 쿠폰",
          style: AppStyle.subTitle16Medium,
        ),
      ),
    );
  }
}
