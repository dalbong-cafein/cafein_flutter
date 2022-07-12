import 'dart:io';

import 'package:cafein_flutter/feature/login/bloc/login_bloc.dart';
import 'package:cafein_flutter/feature/main/main_page.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
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
      listener: (context, state) {
        if (state is LoginSocialTokenConfirmed) {
          context.read<LoginBloc>().add(
                LoginRequested(
                  oAuthAccessToken: state.oAuthAccessToken,
                  oAuthProvider: state.oAuthProvider,
                ),
              );
        } else if (state is LoginSucceed) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            MainPage.routeName,
            (route) => false,
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
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () => context.read<LoginBloc>().add(
                          const LoginSocialTokenRequested(oAuthProvider: 'KAKAO'),
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
                              const LoginSocialTokenRequested(oAuthProvider: 'APPLE'),
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
