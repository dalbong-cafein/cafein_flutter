import 'dart:async';

import 'package:cafein_flutter/feature/login/login_page.dart';
import 'package:cafein_flutter/feature/main/main_page.dart';
import 'package:cafein_flutter/feature/onboard/onboard_page.dart';
import 'package:cafein_flutter/feature/splash/bloc/splash_bloc.dart';
import 'package:cafein_flutter/feature/terms/terms_page.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      const Duration(seconds: 1),
      () => context.read<SplashBloc>().add(
            const SplashLoginRequested(),
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
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        final navigator = Navigator.of(context);

        if (state is SplashTermsChecked) {
          navigator.pushNamedAndRemoveUntil(
            TermsPage.routeName,
            (route) => false,
          );
        } else if (state is SplashLoginChecked) {
          navigator.pushNamedAndRemoveUntil(
            LoginPage.routeName,
            (route) => false,
          );
        } else if (state is SplashPhoneChecked) {
          navigator.pushNamedAndRemoveUntil(
            LoginPage.routeName,
            (route) => false,
          );
        } else if (state is SplashProfileChecked) {
          navigator.pushNamedAndRemoveUntil(
            LoginPage.routeName,
            (route) => false,
          );
        } else if (state is SplashOnboardChecked) {
          navigator.pushNamedAndRemoveUntil(
            OnboardPage.routeName,
            (route) => false,
          );
        } else if (state is SplashMainChecked) {
          navigator.pushNamedAndRemoveUntil(
            MainPage.routeName,
            (route) => false,
          );
        } else if (state is SplashError) {
          navigator.pushNamedAndRemoveUntil(
            LoginPage.routeName,
            (route) => false,
          );
        }
      },
      child: Scaffold(
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
      ),
    );
  }
}
