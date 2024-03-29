import 'package:cafein_flutter/feature/certify_phone/bloc/certify_code_bloc.dart';
import 'package:cafein_flutter/feature/certify_phone/bloc/timer_bloc.dart';
import 'package:cafein_flutter/feature/certify_phone/phone_certificaion_done_page.dart';
import 'package:cafein_flutter/feature/certify_phone/widget/certify_failed_dialog.dart';
import 'package:cafein_flutter/feature/certify_phone/widget/time_out_dialog.dart';
import 'package:cafein_flutter/feature/certify_phone/widget/timer_text.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:cafein_flutter/widget/dialog/error_dialog.dart';
import 'package:cafein_flutter/widget/indicator/dots_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InputCertificationCodePageArguments {
  final String phoneNumber;
  final String returnPage;

  InputCertificationCodePageArguments({
    required this.phoneNumber,
    required this.returnPage,
  });
}

class InputCertificationCodePage extends StatefulWidget {
  const InputCertificationCodePage({
    super.key,
    required this.returnPage,
  });

  static const routeName = 'InputCertificationCodePage';

  final String returnPage;

  @override
  State<InputCertificationCodePage> createState() => _InputCertificationCodePageState();
}

class _InputCertificationCodePageState extends State<InputCertificationCodePage> {
  final controller = TextEditingController();
  late final timerBloc = TimerBloc(
    certifyCodeBloc: context.read<CertifyCodeBloc>(),
  );

  @override
  void initState() {
    super.initState();

    controller.addListener(
      () => context.read<CertifyCodeBloc>().add(
            CertifyCodeChanged(
              code: controller.text,
            ),
          ),
    );

    Future.microtask(
      () => context.read<CertifyCodeBloc>().add(
            const CertifyCodeRequested(),
          ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    timerBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<CertifyCodeBloc, CertifyCodeState>(
          listener: (context, state) async {
            final navigator = Navigator.of(context);
            final bloc = context.read<CertifyCodeBloc>();

            if (state is CertifyCodeSucceed) {
              navigator.pushNamed(
                PhoneCertificationDonePage.routeName,
                arguments: widget.returnPage,
              );
            } else if (state is CertifyCodeTimeOuted) {
              final result = await TimeOutDialog.show(context);

              if (result == null) {
                return;
              }
              if (result) {
                bloc.add(const CertifyCodeRequested());
              } else {
                navigator.pop();
              }
            } else if (state is CertifyCodeError) {
              ErrorDialog.show(
                context,
                error: state.error,
                refresh: state.event,
              );
            } else if (state is CertifyCodeFailed) {
              CertifyFailedDialog.show(context);
            }
          },
        ),
        BlocListener<TimerBloc, TimerState>(
          bloc: timerBloc,
          listenWhen: (pre, next) => next is TimerEnded,
          listener: (context, state) {
            if (state is TimerEnded) {
              context.read<CertifyCodeBloc>().add(
                    const CertifyCodeTimeOvered(),
                  );
            }
          },
        ),
      ],
      child: Scaffold(
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
                  style: AppStyle.title25Bold,
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
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        maxLength: 6,
                        controller: controller,
                        keyboardType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        autofocus: true,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          counterText: '',
                          hintText: '인증번호를 입력해 주세요',
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => controller.clear(),
                      child: loadAsset(
                        AppIcon.circleDeleteGrey,
                      ),
                    ),
                    const SizedBox(width: 8),
                    BlocBuilder<TimerBloc, TimerState>(
                      bloc: timerBloc,
                      builder: (context, state) {
                        late final int duration;
                        if (state is TimerRun) {
                          duration = state.duration;
                        } else if (state is TimerEnded) {
                          duration = 0;
                        } else {
                          duration = 180;
                        }
                        return TimerText(duration: duration);
                      },
                    ),
                  ],
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
                      foregroundColor: AppColor.grey600,
                      backgroundColor: AppColor.grey100,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      textStyle: AppStyle.subTitle15Medium,
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () => context.read<CertifyCodeBloc>().add(
                          const CertifyCodeRequested(),
                        ),
                    child: const Text('인증번호 재전송'),
                  ),
                ),
              ),
              const Spacer(),
              BlocBuilder<CertifyCodeBloc, CertifyCodeState>(
                builder: (context, state) {
                  bool isValid = false;
                  bool isLoading = false;
                  if (state is CertifyCodeValidationChecked) {
                    isValid = state.isVaild;
                  } else if (state is CertifyCodeTimeOuted) {
                    isValid = false;
                  } else if (state is CertifyCodeLoading) {
                    isLoading = true;
                    isValid = false;
                  }

                  return SizedBox(
                    height: 56,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: isValid
                          ? () => context.read<CertifyCodeBloc>().add(
                                CertifyCodeSubmitted(
                                  code: controller.text,
                                ),
                              )
                          : null,
                      child: isLoading ? const DotsLoadingIndicator() : const Text('확인'),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
