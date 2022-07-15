import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/material.dart';

class TimeOutDialog extends StatelessWidget {
  const TimeOutDialog({super.key});

  static Future<bool?> show(BuildContext context) async {
    return showDialog<bool?>(
      context: context,
      builder: (context) => const TimeOutDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 300,
        height: 204,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 28,
            right: 16,
            left: 16,
            bottom: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '인증번호 입력 시간이 지났습니다',
                style: AppStyle.subTitle1Bold,
              ),
              Text(
                '인증번호를 다시 받아주세요.\n문자로 인증번호가 오지 않는다면\n내 정보가 맞는지 확인해 주세요.',
                style: AppStyle.body3.copyWith(
                  color: AppColor.grey600,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 44,
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 44,
                        child: ElevatedButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          style: ElevatedButton.styleFrom(
                            primary: AppColor.white,
                            onPrimary: AppColor.grey800,
                            side: const BorderSide(
                              color: AppColor.grey400,
                              width: 1,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            textStyle: AppStyle.subTitle2Medium,
                          ),
                          child: const Text('정보 확인하기'),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: SizedBox(
                        height: 44,
                        child: ElevatedButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          style: ElevatedButton.styleFrom(
                            primary: AppColor.orange400,
                            onPrimary: AppColor.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            textStyle: AppStyle.subTitle2Medium,
                          ),
                          child: const Text('인증번호 재전송'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
