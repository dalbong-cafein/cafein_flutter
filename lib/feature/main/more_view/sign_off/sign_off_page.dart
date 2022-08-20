import 'package:cafein_flutter/data/model/common/more_view_count_response.dart';
import 'package:cafein_flutter/data/repository/user_repository.dart';
import 'package:cafein_flutter/feature/main/more_view/widget/more_view_count_card.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:cafein_flutter/widget/button/bottom_out_lined_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignOffPage extends StatelessWidget {
  const SignOffPage({
    Key? key,
    required this.moreViewCountResponse,
  }) : super(key: key);

  static const routeName = 'SignOffPage';

  final MoreViewCountResponse moreViewCountResponse;

  @override
  Widget build(BuildContext context) {
    final userData = context.watch<UserRepository>().getMemberData;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              Text(
                '${userData?.nickname ?? ''}님의 활동',
                style: AppStyle.title19SemiBold,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  MoreViewCountCard(
                    title: '내가 등록한 카페',
                    value: moreViewCountResponse.storeCnt,
                  ),
                  const SizedBox(width: 8),
                  MoreViewCountCard(
                    title: '내가 쓴 리뷰',
                    value: moreViewCountResponse.reviewCnt,
                  ),
                ],
              ),
              const SizedBox(height: 56),
              Center(
                child: loadAsset(
                  AppImage.signOff,
                ),
              ),
              const SizedBox(height: 60),
              Row(
                children: const [
                  Icon(
                    Icons.check_circle,
                    color: AppColor.orange500,
                  ),
                  SizedBox(width: 12),
                  Text(
                    '안내사항을 확인하고 회원탈퇴에 동의',
                    style: AppStyle.subTitle15SemiBold,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const _InfoRow(
                text: 'ID가 삭제됩니다.',
              ),
              const SizedBox(height: 8),
              const _InfoRow(
                text: '회원님의 활동 이력, 스템프가 삭제됩니다.',
              ),
              const SizedBox(height: 8),
              const _InfoRow(
                text: '회원님의 개인 정보와 설정이 삭제됩니다.',
              ),
              const SizedBox(height: 8),
              const _InfoRow(
                text: '연결된 소셜 계정 정보가 삭제됩니다.',
              ),
              const SizedBox(height: 32),
              BottomOutLinedButton(
                buttonTitle: '탈퇴하기',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.all(4),
          child: Icon(
            Icons.check,
            color: AppColor.orange500,
            size: 16,
          ),
        ),
        const SizedBox(width: 12),
        Text(
          text,
          style: AppStyle.body14Regular,
        ),
      ],
    );
  }
}
