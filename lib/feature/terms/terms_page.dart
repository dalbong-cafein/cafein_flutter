import 'package:cafein_flutter/feature/certify_phone/input_phone_number_page.dart';
import 'package:cafein_flutter/feature/login/login_page.dart';
import 'package:cafein_flutter/feature/terms/bloc/terms_bloc.dart';
import 'package:cafein_flutter/feature/terms/terms_detail_page.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:cafein_flutter/widget/dialog/error_dialog.dart';
import 'package:cafein_flutter/widget/indicator/dots_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({Key? key}) : super(key: key);

  static const routeName = 'TermsPage';

  @override
  Widget build(BuildContext context) {
    return BlocListener<TermsBloc, TermsState>(
      listener: (context, state) {
        if (state is TermsError) {
          ErrorDialog.show(
            context,
            error: state.error,
            refresh: state.event,
          );
        } else if (state is TermsLoaded) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            InputPhoneNumberPage.routeName,
            arguments: LoginPage.routeName,
            (route) => false,
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(automaticallyImplyLeading: false),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: BlocBuilder<TermsBloc, TermsState>(
            buildWhen: (pre, next) => next is TermsChecked,
            builder: (context, state) {
              bool isAllChecked = false;
              bool isServiceChecked = false;
              bool isPersonalChecked = false;
              bool isLocationChecked = false;
              bool isMarketingChecked = false;
              bool isValid = false;

              if (state is TermsChecked) {
                isAllChecked = state.isAllChecked;
                isServiceChecked = state.isServiceChecked;
                isPersonalChecked = state.isPersonalChecked;
                isLocationChecked = state.isLocationChecked;
                isMarketingChecked = state.isMarketingChecked;
                isValid = state.isValid;
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 72),
                  const Text(
                    '환영합니다\n카페인 이용을 위해\n아래 약관에 동의해주세요.',
                    style: AppStyle.title25Bold,
                  ),
                  const Spacer(),
                  _TermsRow(
                    isCheck: isAllChecked,
                    termsContents: TermsContents.all,
                    textStyle: AppStyle.subTitle17Bold,
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 1,
                    color: AppColor.grey50,
                  ),
                  const SizedBox(height: 16),
                  _TermsRow(
                    isCheck: isServiceChecked,
                    termsContents: TermsContents.service,
                    trailing: IconButton(
                      onPressed: () => Navigator.of(context).pushNamed(
                        TermsDetailPage.routeName,
                        arguments: '이용약관',
                      ),
                      icon: loadAsset(
                        AppIcon.rightS,
                        color: AppColor.grey400,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _TermsRow(
                    isCheck: isPersonalChecked,
                    termsContents: TermsContents.personal,
                    trailing: IconButton(
                      onPressed: () => Navigator.of(context).pushNamed(
                        TermsDetailPage.routeName,
                        arguments: '개인정보 수집 및 이용 동의',
                      ),
                      icon: loadAsset(
                        AppIcon.rightS,
                        color: AppColor.grey400,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _TermsRow(
                    isCheck: isLocationChecked,
                    termsContents: TermsContents.location,
                    trailing: IconButton(
                      onPressed: () => Navigator.of(context).pushNamed(
                        TermsDetailPage.routeName,
                        arguments: '이용약관',
                      ),
                      icon: loadAsset(
                        AppIcon.rightS,
                        color: AppColor.grey400,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  _TermsRow(
                    isCheck: isMarketingChecked,
                    termsContents: TermsContents.marketing,
                  ),
                  const SizedBox(height: 44),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 16,
                      ),
                      child: BlocBuilder<TermsBloc, TermsState>(
                        builder: (context, state) {
                          bool isValid = false;
                          bool isLoading = false;

                          if (state is TermsChecked) {
                            isValid = state.isValid;
                          } else if (state is TermsLoading) {
                            isLoading = true;
                          }
                          return SizedBox(
                            height: 52,
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              onPressed: !isValid
                                  ? null
                                  : () => context
                                      .read<TermsBloc>()
                                      .add(const TermsRequested()),
                              child: isLoading
                                  ? const DotsLoadingIndicator()
                                  : const Text('확인'),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _TermsRow extends StatelessWidget {
  const _TermsRow({
    Key? key,
    required this.isCheck,
    required this.termsContents,
    this.textStyle = AppStyle.subTitle15Medium,
    this.trailing,
  }) : super(key: key);

  final bool isCheck;
  final TermsContents termsContents;
  final TextStyle textStyle;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.read<TermsBloc>().add(
            TermsToggled(
              termsContents: termsContents,
              isCheck: !isCheck,
            ),
          ),
      child: Row(
        children: [
          loadAsset(
            isCheck ? AppIcon.checkCircleOn : AppIcon.checkCircleOff,
          ),
          const SizedBox(width: 12),
          Text(
            termsContents.title,
            style: textStyle,
          ),
          const Spacer(),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}
