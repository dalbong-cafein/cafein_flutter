import 'package:cafein_flutter/feature/certify_phone/bloc/input_phone_number_bloc.dart';
import 'package:cafein_flutter/feature/certify_phone/input_certification_code_page.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InputPhoneNumberPage extends StatefulWidget {
  const InputPhoneNumberPage({
    super.key,
    required this.returnPage,
  });

  static const routeName = 'InputPhoneNumberPage';

  final String returnPage;

  @override
  State<InputPhoneNumberPage> createState() => _InputPhoneNumberPageState();
}

class _InputPhoneNumberPageState extends State<InputPhoneNumberPage> {
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.addListener(
      () => context.read<InputPhoneNumberBloc>().add(
            PhoneCertificationPhoneNumberChanged(
              phoneNumber: controller.text,
            ),
          ),
    );
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
                '본인 확인을 위해 \n휴대폰 번호 인증을 해주세요',
                style: AppStyle.title25Bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20),
              child: Text(
                '휴대폰 번호는 카페인 서비스 이용을 위해 저장되며\n서비스 이용 기간 동안 안전하게 보관됩니다.',
                style: AppStyle.body14Regular.copyWith(
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
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller,
                      maxLength: 11,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      autofocus: true,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        counterText: '',
                        hintText: '휴대폰 번호를 입력해 주세요',
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => controller.clear(),
                    child: loadAsset(
                      AppIcon.circleDeleteGrey,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            BlocBuilder<InputPhoneNumberBloc, InputPhoneNumberState>(
              buildWhen: (pre, next) => next is PhoneCertificationPhoneNumberValidationChecked,
              builder: (context, state) {
                bool isValid = false;
                if (state is PhoneCertificationPhoneNumberValidationChecked) {
                  isValid = state.isValid;
                }
                return SizedBox(
                  height: 56,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: isValid
                        ? () => Navigator.of(context).pushNamed(
                              InputCertificationCodePage.routeName,
                              arguments: InputCertificationCodePageArguments(
                                phoneNumber: controller.text,
                                returnPage: widget.returnPage,
                              ),
                            )
                        : null,
                    child: const Text('인증번호 받기'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
