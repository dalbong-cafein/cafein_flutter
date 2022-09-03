import 'package:cafein_flutter/data/repository/user_repository.dart';
import 'package:cafein_flutter/feature/certify_phone/input_phone_number_page.dart';
import 'package:cafein_flutter/feature/main/more_view/edit_profile/bloc/edit_profile_bloc.dart';
import 'package:cafein_flutter/feature/main/more_view/edit_profile/widget/edit_confirm_dialog.dart';
import 'package:cafein_flutter/feature/main/more_view/edit_profile/widget/edit_confrim_toast_dialog.dart';
import 'package:cafein_flutter/feature/main/more_view/edit_profile/widget/edit_phone_number_bottom_sheet.dart';
import 'package:cafein_flutter/feature/main/more_view/edit_profile/widget/edit_profile_image_card.dart';
import 'package:cafein_flutter/feature/profile/widget/image_choice_dialog.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/debouncer.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:cafein_flutter/widget/dialog/error_dialog.dart';
import 'package:cafein_flutter/widget/dialog/permission_dialog.dart';
import 'package:cafein_flutter/widget/indicator/dots_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  static const routeName = 'EditProfilePage';

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late final userData = context.watch<UserRepository>().getMemberData;

  late final controller = TextEditingController(
    text: userData?.nickname,
  );

  @override
  void initState() {
    super.initState();
    final debouncer = Debouncer(milliseconds: 1000);

    Future.microtask(
      () => controller.addListener(
        () {
          context.read<EditProfileBloc>().add(
                EditProfileNicknameChanged(
                  nickname: controller.text,
                ),
              );
          if (controller.text.isNotEmpty) {
            debouncer.run(
              () => context.read<EditProfileBloc>().add(
                    EditProfileNicknameDuplicationRequested(
                      nickname: controller.text,
                    ),
                  ),
            );
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditProfileBloc, EditProfileState>(
      listener: (context, state) async {
        final bloc = context.read<EditProfileBloc>();
        final navigator = Navigator.of(context);

        if (state is EditProfilePermissionChecked) {
          if (!state.permissionStatus.isGranted) {
            final result = await PermissionDialog.show(context);
            if (result) {
              openAppSettings();
            }
            return;
          }
          bloc.add(
            EditProfileImageChanged(
              permission: state.permission,
            ),
          );
        } else if (state is EditProfileSucceed) {
          await EditConfirmToastDialog.show(context);
          navigator.pop();
        } else if (state is EditProfileError) {
          ErrorDialog.show(
            context,
            error: state.error,
            refresh: state.event,
          );
        }
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('내정보'),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CustomScrollView(
                    slivers: [
                      const SliverToBoxAdapter(
                        child: SizedBox(
                          height: 24,
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            height: 88,
                            width: 88,
                            child: Stack(
                              children: [
                                BlocBuilder<EditProfileBloc, EditProfileState>(
                                  buildWhen: (pre, next) => next is EditProfileInformationChecked,
                                  builder: (context, state) {
                                    String? filePath;

                                    if (state is EditProfileInformationChecked) {
                                      filePath = state.imagePath;
                                    }

                                    return EditProfileImageCard(
                                      filePath: filePath,
                                      imageUrl: userData?.imageIdPair?.imageUrl,
                                    );
                                  },
                                ),
                                Positioned(
                                  right: 0,
                                  bottom: 0,
                                  child: InkWell(
                                    onTap: () async {
                                      final bloc = context.read<EditProfileBloc>();
                                      final result = await ImageChoiceDialog.show(context);

                                      if (result.isCamera) {
                                        bloc.add(
                                          const EditProfilePermissionRequested(
                                            permission: Permission.camera,
                                          ),
                                        );
                                      } else if (result.isPhoto) {
                                        bloc.add(
                                          const EditProfilePermissionRequested(
                                            permission: Permission.photos,
                                          ),
                                        );
                                      } else if (result.isDefault) {
                                        bloc.add(
                                          const EditProfileImageChanged(
                                            isDefault: true,
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
                        ),
                      ),
                      const SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 32,
                            bottom: 12,
                          ),
                          child: Text(
                            '닉네임',
                            style: AppStyle.subTitle16SemiBold,
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
                          height: 56,
                          width: MediaQuery.of(context).size.width - 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            border: const Border.fromBorderSide(
                              BorderSide(
                                color: AppColor.grey400,
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
                              BlocBuilder<EditProfileBloc, EditProfileState>(
                                buildWhen: (pre, next) => next is EditProfileInformationChecked,
                                builder: (context, state) {
                                  int nicknameLength = userData!.nickname!.length;
                                  if (state is EditProfileInformationChecked) {
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
                      ),
                      BlocBuilder<EditProfileBloc, EditProfileState>(
                        buildWhen: (pre, next) => next is EditProfileNicknameDupicatedChecked,
                        builder: (context, state) {
                          bool isDuplicated = false;
                          String text = '한글, 영문, 숫자만 입력 가능합니다.';
                          if (state is EditProfileNicknameDupicatedChecked) {
                            isDuplicated = state.isDuplicated;
                            text = !state.isDuplicated ? '이미 사용 중인 닉네임입니다.' : '멋진 닉네임이네요!';
                          }
                          return SliverToBoxAdapter(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 8,
                                  left: 8,
                                ),
                                child: Text(
                                  text,
                                  style: AppStyle.body14Regular.copyWith(
                                    color: !isDuplicated ? AppColor.red : AppColor.blue,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      const SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 44,
                            bottom: 12,
                          ),
                          child: Text(
                            '휴대폰번호',
                            style: AppStyle.subTitle16SemiBold,
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: InkWell(
                          onTap: () async {
                            final navigator = Navigator.of(context);
                            final bloc = context.read<EditProfileBloc>();

                            final result = await EditPhoneNumberBottomSheet.show(context);

                            if (!result) {
                              return;
                            }

                            await navigator.pushNamed(
                              InputPhoneNumberPage.routeName,
                              arguments: EditProfilePage.routeName,
                            );

                            bloc.add(
                              const EditProfilePhoneNumberChanged(),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                            ),
                            margin: const EdgeInsets.only(bottom: 24),
                            height: 56,
                            width: MediaQuery.of(context).size.width - 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              border: const Border.fromBorderSide(
                                BorderSide(
                                  color: AppColor.grey400,
                                ),
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: BlocBuilder<EditProfileBloc, EditProfileState>(
                                buildWhen: (pre, next) => next is EditProfileInformationChecked,
                                builder: (context, state) {
                                  String phoneNumber = userData?.phoneNumber ?? '';

                                  if (state is EditProfileInformationChecked &&
                                      state.phoneNumber != null) {
                                    phoneNumber = state.phoneNumber!;
                                  }

                                  return Text(
                                    phoneNumber,
                                    style: AppStyle.body15Regular,
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              BlocBuilder<EditProfileBloc, EditProfileState>(
                buildWhen: (pre, next) =>
                    pre is EditProfileLoading ||
                    next is EditProfileLoading ||
                    next is EditProfileInformationChecked,
                builder: (context, state) {
                  bool isLoading = false;
                  bool isValid = false;

                  if (state is EditProfileInformationChecked) {
                    isValid = state.isNicknameValid;
                  } else if (state is EditProfileLoading) {
                    isLoading = true;
                    isValid = false;
                  }

                  return SizedBox(
                    height: 56,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: isValid
                          ? () async {
                              FocusScope.of(context).unfocus();
                              final bloc = context.read<EditProfileBloc>();
                              final result = await EditConfirmDialog.show(context);

                              if (!result) {
                                return;
                              }

                              bloc.add(
                                const EditProfileRequested(),
                              );
                            }
                          : null,
                      child: isLoading ? const DotsLoadingIndicator() : const Text('수정하기'),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
