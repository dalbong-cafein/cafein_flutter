import 'package:cafein_flutter/feature/phone_certification/phone_certificaion_done_page.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputCertificationCodePage extends StatefulWidget {
  const InputCertificationCodePage({
    super.key,
  });

  static const routeName = 'InputCertificationCodePage';

  @override
  State<InputCertificationCodePage> createState() => _InputCertificationCodePageState();
}

class _InputCertificationCodePageState extends State<InputCertificationCodePage> {
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 52),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                '인증번호 6자리를\n입력해 주세요',
                style: AppStyle.title1,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 28,
                left: 20,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              height: 56,
              width: MediaQuery.of(context).size.width - 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: const Border.fromBorderSide(
                  BorderSide(
                    color: AppColor.orange500,
                  ),
                ),
              ),
              child: Center(
                child: TextField(
                  maxLength: 11,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  autofocus: true,
                  decoration: const InputDecoration(
                    counterText: '',
                    hintText: '인증번호를 입력해 주세요',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: SizedBox(
                width: 118,
                height: 34,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    primary: AppColor.grey100,
                    onPrimary: AppColor.grey600,
                    textStyle: AppStyle.subTitle3Medium,
                    padding: EdgeInsets.zero,
                  ),
                  onPressed: () {},
                  child: const Text('인증번호 재전송'),
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              height: 56,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    PhoneCertificationDonePage.routeName,
                  );
                },
                child: const Text('확인'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
