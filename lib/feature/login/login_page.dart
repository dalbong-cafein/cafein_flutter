import 'dart:developer';
import 'dart:io';

import 'package:cafein_flutter/feature/login/bloc/login_bloc.dart';
import 'package:cafein_flutter/feature/main/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

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
        body: Container(
          padding: const EdgeInsets.only(top: 130, bottom: 40),
          width: width,
          height: height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                'asset/image/login_image.png',
              ),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Cafein'),
              SizedBox(
                width: width - 40,
                height: 56,
                child: ElevatedButton(
                  onPressed: () => context.read<LoginBloc>().add(
                        const LoginSocialTokenRequested(oAuthProvider: 'KAKAO'),
                      ),
                  child: const Text('카카오로 로그인'),
                ),
              ),
              if (Platform.isIOS)
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                    width: width - 40,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () => context.read<LoginBloc>().add(
                            const LoginSocialTokenRequested(oAuthProvider: 'APPLE'),
                          ),
                      child: const Text('Apple 계정으로 로그인'),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
