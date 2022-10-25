import 'dart:io';

import 'package:cafein_flutter/data/model/enum/auth_provider.dart';
import 'package:cafein_flutter/feature/certify_phone/input_phone_number_page.dart';
import 'package:cafein_flutter/feature/login/bloc/login_bloc.dart';
import 'package:cafein_flutter/feature/main/main_page.dart';
import 'package:cafein_flutter/feature/onboard/onboard_page.dart';
import 'package:cafein_flutter/feature/profile/profile_page.dart';
import 'package:cafein_flutter/feature/terms/terms_page.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:cafein_flutter/widget/dialog/error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const routeName = 'LoginPage';

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return BlocListener<LoginBloc, LoginState>(
      listenWhen: (pre, next) => pre is LoginLoading,
      listener: (context, state) async {
        if (state is LoginSocialTokenConfirmed) {
          context.read<LoginBloc>().add(
                LoginRequested(socialLoginRequest: state.socialLoginRequest),
              );
        } else if (state is LoginSucceed) {
          if (!state.isTermsChecked) {
            Navigator.of(context).pushNamed(
              TermsPage.routeName,
            );
          } else if (!state.isCertifiedPhone) {
            Navigator.of(context).pushNamed(
              InputPhoneNumberPage.routeName,
              arguments: LoginPage.routeName,
            );
          } else if (!state.isRegisteredNickname) {
            Navigator.of(context).pushNamed(
              ProfilePage.routeName,
            );
          } else if (!state.isOnboardSkip) {
            Navigator.of(context).pushNamedAndRemoveUntil(
              OnboardPage.routeName,
              (route) => false,
            );
          } else {
            Navigator.of(context).pushNamedAndRemoveUntil(
              MainPage.routeName,
              (route) => false,
            );
          }
        } else if (state is LoginError) {
          ErrorDialog.show(
            context,
            error: state.error,
            refresh: state.event,
          );
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    AppImage.login,
                  ),
                ),
              ),
            ),
            Opacity(
              opacity: 0.38,
              child: Container(
                color: AppColor.black,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                top: 130,
                bottom: 40,
                right: 20,
                left: 20,
              ),
              width: width,
              height: height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  loadAsset(
                    AppImage.cafeinLogo,
                    color: AppColor.white,
                    width: 200,
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () => context.read<LoginBloc>().add(
                          const LoginSocialTokenRequested(
                              authProvider: AuthProvider.kakao),
                        ),
                    child: loadAsset(
                      AppImage.kakaoLogin,
                    ),
                  ),
                  if (Platform.isIOS)
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: InkWell(
                        onTap: () => context.read<LoginBloc>().add(
                              const LoginSocialTokenRequested(
                                  authProvider: AuthProvider.apple),
                            ),
                        child: loadAsset(
                          AppImage.appleLogin,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
