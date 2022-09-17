import 'package:cafein_flutter/feature/review/created_review/bloc/created_review_bloc.dart';
import 'package:cafein_flutter/feature/review/created_review/widget/recommend_stars.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:cafein_flutter/widget/dialog/permission_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

class CreatedReviewPage extends StatelessWidget {
  const CreatedReviewPage({Key? key}) : super(key: key);

  static const routeName = 'CreatedReviewPage';

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CreatedReviewBloc>();
    final width = MediaQuery.of(context).size.width;
    return BlocListener<CreatedReviewBloc, CreatedReviewState>(
      listener: (context, state) async {
        if(state is CreatedReviewPermissionChecked){
          if(!state.permissionStatus.isGranted) {
            final result = await PermissionDialog.show(context);
          if (result) {
            openAppSettings();
          }
            return;
          }
        }
      },
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "리뷰 작성",
              style: AppStyle.subTitle16Medium,
            ),
          ),
          body: SizedBox(
            width: width,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: 72,
                    height: 72,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(48),
                        child: Image.network(
                          "https://avatars.githubusercontent.com/u/73538957?v=4",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    "엔제리너스 홍대점",
                    style: AppStyle.caption12Regular
                        .copyWith(color: AppColor.grey600),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    "카공 카페로 어떤가요?",
                    style: AppStyle.subTitle17SemiBold,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        reviewButton("BAD", true),
                        reviewButton("NORMAL", true),
                        reviewButton("GOOD", true),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 1.0,
                        width: width - 40,
                        color: AppColor.grey50,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const RecommendStars(),
                ],
              ),
            ),
          )),
    );
  }

  Widget reviewButton(String mood, bool isClicked) {
    String moodText = "추천해요";
    String moodImage = AppImage.recGood;
    if (mood == "GOOD") {
      moodText = "추천해요";
      if (isClicked) {
        moodImage = AppImage.recGood;
      } else {
        moodImage = AppImage.recGoodGrey;
      }
    }
    if (mood == "NORMAL") {
      moodText = "그저그래요";
      if (isClicked) {
        moodImage = AppImage.recNormal;
      } else {
        moodImage = AppImage.recNormalGrey;
      }
    }
    if (mood == "BAD") {
      moodText = "별로에요";
      if (isClicked) {
        moodImage = AppImage.recBad;
      } else {
        moodImage = AppImage.recBadGrey;
      }
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        loadAsset(moodImage, height: 56, width: 56),
        const SizedBox(
          height: 12,
        ),
        Text(
          moodText,
          style: AppStyle.caption13Medium
              .copyWith(color: isClicked ? AppColor.grey800 : AppColor.grey400),
        )
      ],
    );
  }
}
