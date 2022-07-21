import 'package:cafein_flutter/feature/main/main_page.dart';
import 'package:cafein_flutter/feature/profile/bloc/profile_bloc.dart';
import 'package:cafein_flutter/feature/profile/widget/image_choice_dialog.dart';
import 'package:cafein_flutter/feature/profile/widget/profile_image.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/debouncer.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:cafein_flutter/widget/dialog/permission_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  static const routeName = 'ProfilePage';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    final debouncer = Debouncer(milliseconds: 1000);
    controller.addListener(
      () {
        context.read<ProfileBloc>().add(ProfileNicknameChanged(
              nickname: controller.text,
            ));
        if (controller.text.isNotEmpty) {
          debouncer.run(() => context.read<ProfileBloc>().add(
                ProfileNicknameDuplicationRequested(nickname: controller.text),
              ));
        }
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) async {
        final bloc = context.read<ProfileBloc>();
        if (state is ProfilePermissionChecked) {
          if (!state.permissionStatus.isGranted) {
            final result = await PermissionDialog.show(context);
            if (result) {
              openAppSettings();
            }
            return;
          }
          bloc.add(
            ProfileImageChanged(
              permission: state.permission,
            ),
          );
        } else if (state is ProfileUpdateSucceed) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            MainPage.routeName,
            (route) => false,
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(CupertinoIcons.back),
          ),
          title: const Text('프로필 설정'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 56),
            SizedBox(
              height: 88,
              width: 88,
              child: Stack(
                children: [
                  BlocBuilder<ProfileBloc, ProfileState>(
                    buildWhen: (pre, next) => next is ProfileImageSelected,
                    builder: (context, state) {
                      String fileImagePath = '';

                      if (state is ProfileImageSelected) {
                        fileImagePath = state.imagePath;
                      }

                      return ProfileImage(
                        fileImagePath: fileImagePath,
                      );
                    },
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: InkWell(
                      onTap: () async {
                        final bloc = context.read<ProfileBloc>();
                        final result = await ImageChoiceDialog.show(context);
                        if (result.isCamera) {
                          bloc.add(
                            const ProfilePermissionRequested(
                              permission: Permission.camera,
                            ),
                          );
                        } else if (result.isPhoto) {
                          bloc.add(
                            const ProfilePermissionRequested(
                              permission: Permission.photos,
                            ),
                          );
                        }
                      },
                      child: loadAsset(AppIcon.camera),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 40,
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
                      maxLength: 10,
                      controller: controller,
                      autofocus: true,
                      textInputAction: TextInputAction.next,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'[ㄱ-ㅎ가-힣0-9a-zA-Z]'),
                        ),
                      ],
                      decoration: const InputDecoration(
                        counterText: '',
                        hintText: '닉네임을 입력해주세요',
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => controller.clear(),
                    child: loadAsset(AppIcon.circleDeleteGrey),
                  ),
                  const SizedBox(width: 4),
                  BlocBuilder<ProfileBloc, ProfileState>(
                    buildWhen: (pre, next) =>
                        next is ProfileNicknameValidationChecked,
                    builder: (context, state) {
                      int nicknameLength = 0;
                      if (state is ProfileNicknameValidationChecked) {
                        nicknameLength = state.nicknameLength;
                      }
                      return RichText(
                        text: TextSpan(
                          text: '$nicknameLength',
                          style: AppStyle.caption12Medium.copyWith(
                            color: AppColor.orange500,
                          ),
                          children: [
                            TextSpan(
                              text: '/10자',
                              style: AppStyle.caption12Medium.copyWith(
                                color: AppColor.grey400,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            BlocBuilder<ProfileBloc, ProfileState>(
              buildWhen: (pre, next) =>
                  next is ProfileNicknameDuplicationChecked,
              builder: (context, state) {
                bool isDuplicated = false;
                String text = '한글, 영문, 숫자만 입력 가능합니다.';
                if (state is ProfileNicknameDuplicationChecked) {
                  isDuplicated = state.isDuplicated;
                  text =
                      !state.isDuplicated ? '이미 사용 중인 닉네임입니다.' : '멋진 닉네임이네요!';
                }
                return Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                      left: 28,
                    ),
                    child: Text(
                      text,
                      style: AppStyle.body14Regular.copyWith(
                        color: !isDuplicated ? AppColor.red : AppColor.blue,
                      ),
                    ),
                  ),
                );
              },
            ),
            const Spacer(),
            BlocBuilder<ProfileBloc, ProfileState>(
              buildWhen: (pre, next) =>
                  next is ProfileNicknameValidationChecked,
              builder: (context, state) {
                bool isValid = false;
                if (state is ProfileNicknameValidationChecked) {
                  isValid = state.isValid;
                }
                return SizedBox(
                  height: 56,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: isValid
                        ? () => context.read<ProfileBloc>().add(
                              const ProfileUpdateRequested(),
                            )
                        : null,
                    child: const Text(
                      '시작하기',
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
