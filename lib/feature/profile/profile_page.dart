import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  static const routeName = 'ProfilePage';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(CupertinoIcons.back),
        ),
        title: const Text(
          '프로필 설정',
        ),
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
                CircleAvatar(
                  radius: 44,
                  backgroundColor: AppColor.white,
                  child: loadAsset(
                    AppImage.profile1,
                    width: 88,
                    height: 88,
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: InkWell(
                    onTap: () {},
                    child: loadAsset(
                      AppIcon.camera,
                    ),
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
                    decoration: const InputDecoration(
                      counterText: '',
                      hintText: '닉네임을 입력해주세요',
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
          SizedBox(
            height: 56,
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text(
                '시작하기',
              ),
            ),
          )
        ],
      ),
    );
  }
}
