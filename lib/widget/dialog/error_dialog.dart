import 'package:cafein_flutter/feature/login/login_page.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

enum ErrorCallBack {
  login,
  refresh,
  inquiry,
}

extension ErrorCallBackCheck on ErrorCallBack {
  bool get isLogin => this == ErrorCallBack.login;
  bool get isRefresh => this == ErrorCallBack.login;
  bool get isInquiry => this == ErrorCallBack.login;
}

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({
    super.key,
    required this.error,
  });

  final dynamic error;

  static bool isShow = false;

  static Future<void> show(
    BuildContext context, {
    required dynamic error,
    required Function refresh,
  }) async {
    if (isShow) {
      return;
    }

    isShow = true;
    final navigator = Navigator.of(context);
    final result = await showDialog<ErrorCallBack?>(
      context: context,
      builder: (context) => ErrorDialog(
        error: error,
      ),
    );

    if (result == null) {
      return;
    }

    isShow = false;

    switch (result) {
      case ErrorCallBack.login:
        navigator.pushNamedAndRemoveUntil(
          LoginPage.routeName,
          (route) => false,
        );
        return;
      case ErrorCallBack.refresh:
        refresh();
        return;
      case ErrorCallBack.inquiry:
        await launchUrl(Uri.parse('mailto:dalbong.cafein@gmail.com'));
        return;
    }
  }

  @override
  Widget build(BuildContext context) {
    String title = '일시적인 오류입니다';
    String subTitle = '잠시 후 다시 시도해 주세요\n같은 문제가 반복되면 문의하기를 눌러주세요';

    Widget button = Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: AppColor.grey800,
              backgroundColor: AppColor.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              textStyle: AppStyle.subTitle15Medium,
              side: const BorderSide(
                color: AppColor.grey400,
                width: 1,
              ),
            ),
            onPressed: () => Navigator.of(context).pop(ErrorCallBack.inquiry),
            child: const Text('문의하기'),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              textStyle: AppStyle.subTitle15Medium,
            ),
            onPressed: () => Navigator.of(context).pop(ErrorCallBack.refresh),
            child: const Text('다시 시도'),
          ),
        ),
      ],
    );

    if (error is! DioError) {
      return _DefaultErrorDialog(
        title: title,
        subTitle: subTitle,
        button: button,
      );
    }

    final dioError = error as DioError;

    if (dioError.type == DioErrorType.other) {
      title = '네트워크 오류입니다';
      subTitle = '인터넷 연결 확인 후 다시 시도해 주세요';
      button = ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: AppStyle.subTitle15Medium,
        ),
        onPressed: () => Navigator.of(context).pop(ErrorCallBack.refresh),
        child: const Text('다시 시도'),
      );
    } else if (dioError.response?.statusCode == 401) {
      title = '로그인이 만료되었습니다';
      subTitle = '계속해서 카페인 이용을 원하시면\n다시 로그인해 주세요';
      button = ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: AppStyle.subTitle15Medium,
        ),
        onPressed: () => Navigator.of(context).pop(ErrorCallBack.login),
        child: const Text('로그인하기'),
      );
    }

    return _DefaultErrorDialog(
      title: title,
      subTitle: subTitle,
      button: button,
    );
  }
}

class _DefaultErrorDialog extends StatelessWidget {
  const _DefaultErrorDialog({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.button,
  }) : super(key: key);

  final String title;
  final String subTitle;
  final Widget button;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 300,
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 16,
            right: 16,
            left: 16,
            top: 32,
          ),
          child: Wrap(
            direction: Axis.vertical,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                title,
                style: AppStyle.subTitle17Bold,
              ),
              const SizedBox(height: 12),
              Text(
                subTitle,
                style: AppStyle.body14Regular.copyWith(
                  color: AppColor.grey600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 268,
                height: 44,
                child: button,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
