import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputPhoneNumberPage extends StatefulWidget {
  const InputPhoneNumberPage({
    super.key,
  });

  static const routeName = 'InputPhoneNumberPage';

  @override
  State<InputPhoneNumberPage> createState() => _InputPhoneNumberPageState();
}

class _InputPhoneNumberPageState extends State<InputPhoneNumberPage> {
  final focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    focusNode.addListener(() {
      if (!focusNode.hasFocus) {
        FocusScope.of(context).requestFocus(focusNode);
      }
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 52),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                '본인 확인을 위해 \n휴대폰 번호 인증을 해주세요',
                style: AppStyle.title1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20),
              child: Text(
                '휴대폰 번호는 카페인 서비스 이용을 위해 저장되며\n서비스 이용 기간 동안 안전하게 보관됩니다.',
                style: AppStyle.body3.copyWith(
                  color: AppColor.grey600,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 24,
                left: 20,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
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
              child: TextField(
                focusNode: focusNode,
                maxLength: 11,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                autofocus: true,
                decoration: const InputDecoration(
                  counterText: '',
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              height: 56,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('인증번호 받기'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
