import 'package:cafein_flutter/feature/main/more_view/edit_profile/bloc/edit_profile_bloc.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/debouncer.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditNicknameField extends StatefulWidget {
  const EditNicknameField({
    Key? key,
    required this.initialName,
  }) : super(key: key);

  final String initialName;

  @override
  State<EditNicknameField> createState() => _EditNicknameFieldState();
}

class _EditNicknameFieldState extends State<EditNicknameField> {
  late final controller = TextEditingController(
    text: widget.initialName,
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
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        height: 48,
        width: width - 40,
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
                int nicknameLength = widget.initialName.length;

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
    );
  }
}
