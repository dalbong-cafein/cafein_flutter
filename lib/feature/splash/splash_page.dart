import 'dart:async';

import 'package:cafein_flutter/feature/login/login_page.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/widget/dialog/error_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({
    super.key,
  });

  static const routeName = 'SplashPage';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late final Timer timer;

  final images = [AppImage.splash1, AppImage.spalsh2]..shuffle();

  @override
  void initState() {
    super.initState();
    timer = Timer(
      const Duration(seconds: 2),
      () => Navigator.of(context).pushNamedAndRemoveUntil(
        LoginPage.routeName,
        (route) => false,
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        toolbarHeight: 56,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      backgroundColor: AppColor.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(images.first),
          ),
        ),
        padding: const EdgeInsets.only(top: 44, left: 28),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "콘센트 자리가 없을 때",
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w500,
                fontFamily: 'GmarketSans',
                color: AppColor.grey800,
                height: 36 / 21,
              ),
            ),
            Text(
              "카페 자리가 없을 때",
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w500,
                fontFamily: 'GmarketSans',
                color: AppColor.grey800,
                height: 36 / 21,
              ),
            ),
            SizedBox(height: 24),
            Text(
              "카공인을 위한 지도",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w500,
                fontFamily: 'GmarketSans',
                color: AppColor.grey900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
