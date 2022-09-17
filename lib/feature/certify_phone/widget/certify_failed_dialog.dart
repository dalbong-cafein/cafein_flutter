import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/material.dart';

class CertifyFailedDialog extends StatelessWidget {
  const CertifyFailedDialog({Key? key}) : super(key: key);

  static Future<void> show(BuildContext context) async => await showDialog(
        context: context,
        builder: (context) => const CertifyFailedDialog(),
      );

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 300,
        height: 120,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '인증 번호가 맞지 않습니다!',
                style: AppStyle.body15Regular,
              ),
              const SizedBox(height: 20),
              Container(height: 1, color: AppColor.grey100),
              SizedBox(
                height: 52,
                width: 300,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: AppColor.blue,
                    backgroundColor: AppColor.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    textStyle: AppStyle.subTitle15Medium,
                  ),
                  child: const Text('확인'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
