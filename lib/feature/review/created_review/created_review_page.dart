import 'package:cafein_flutter/cafein_const.dart';
import 'package:cafein_flutter/data/model/enum/review_recommendation.dart';
import 'package:cafein_flutter/data/model/store/store_detail.dart';
import 'package:cafein_flutter/feature/gallery/gallery_page.dart';
import 'package:cafein_flutter/feature/review/created_review/bloc/created_review_bloc.dart';
import 'package:cafein_flutter/feature/review/created_review/widget/created_review_policy.dart';
import 'package:cafein_flutter/feature/review/created_review/widget/photo_list_row.dart';
import 'package:cafein_flutter/feature/review/created_review/widget/recommend_stars.dart';
import 'package:cafein_flutter/feature/review/created_review/widget/score_character_button.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:cafein_flutter/widget/card/custom_cached_network_image.dart';
import 'package:cafein_flutter/widget/dialog/error_dialog.dart';
import 'package:cafein_flutter/widget/dialog/permission_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

class CreatedReviewPage extends StatefulWidget {
  const CreatedReviewPage({
    Key? key,
    required this.storeDetail,
  }) : super(key: key);

  static const routeName = 'CreatedReviewPage';

  final StoreDetail storeDetail;

  @override
  State<CreatedReviewPage> createState() => _CreatedReviewPageState();
}

class _CreatedReviewPageState extends State<CreatedReviewPage> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return BlocListener<CreatedReviewBloc, CreatedReviewState>(
      listener: (context, state) async {
        final bloc = context.read<CreatedReviewBloc>();

        if (state is CreatedReviewPermissionChecked) {
          if (!state.permissionStatus.isGranted) {
            final result = await PermissionDialog.show(context);

            if (!result) {
              return;
            }

            openAppSettings();

            return;
          }

          final result = await Navigator.of(context).pushNamed(
            GalleryPage.routeName,
          );

          if (result is! List<String>) {
            return;
          }

          bloc.add(
            CreatedReviewPhotoRequested(
              photoList: [...result],
            ),
          );
        } else if (state is CreatedReviewError) {
          ErrorDialog.show(
            context,
            error: state.error,
            refresh: state.event,
          );
        }
      },
      child: Scaffold(
          appBar: AppBar(
            title: const Text("리뷰 작성"),
            leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: loadAsset(AppIcon.left),
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
                        child: CustomCachedNetworkImage(
                          height: 72,
                          width: 72,
                          imageUrl: widget.storeDetail.storeImageList.isNotEmpty
                              ? widget.storeDetail.storeImageList.first.imageUrl
                              : CafeinConst.defaultStoreImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    widget.storeDetail.storeName,
                    style: AppStyle.caption12Regular.copyWith(
                      color: AppColor.grey600,
                    ),
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
                    child: BlocBuilder<CreatedReviewBloc, CreatedReviewState>(
                      buildWhen: (pre, next) => next is CreatedReviewScoreChecked,
                      builder: (context, state) {
                        bool isNormal = false;
                        bool isGood = false;
                        bool isBad = false;

                        if (state is CreatedReviewScoreChecked) {
                          switch (state.recommendation) {
                            case ReviewRecommendation.normal:
                              isNormal = true;
                              break;
                            case ReviewRecommendation.good:
                              isGood = true;
                              break;
                            case ReviewRecommendation.bad:
                              isBad = true;
                              break;
                          }
                        }

                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () => context.read<CreatedReviewBloc>().add(
                                    const CreatedReviewScoreChanged(
                                      recommendation: ReviewRecommendation.bad,
                                    ),
                                  ),
                              child: ScoreCharacterButton(
                                message: '별로에요',
                                onIcon: AppImage.recBad,
                                offIcon: AppImage.recBadGrey,
                                isChecked: isBad,
                              ),
                            ),
                            InkWell(
                              onTap: () => context.read<CreatedReviewBloc>().add(
                                    const CreatedReviewScoreChanged(
                                      recommendation: ReviewRecommendation.normal,
                                    ),
                                  ),
                              child: ScoreCharacterButton(
                                message: '그저그래요',
                                onIcon: AppImage.recNormal,
                                offIcon: AppImage.recNormalGrey,
                                isChecked: isNormal,
                              ),
                            ),
                            InkWell(
                              onTap: () => context.read<CreatedReviewBloc>().add(
                                    const CreatedReviewScoreChanged(
                                      recommendation: ReviewRecommendation.good,
                                    ),
                                  ),
                              child: ScoreCharacterButton(
                                message: '추천해요',
                                onIcon: AppImage.recGood,
                                offIcon: AppImage.recGoodGrey,
                                isChecked: isGood,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 24),
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
                  const SizedBox(height: 24),
                  const RecommendStars(),
                  const SizedBox(height: 16),
                  BlocBuilder<CreatedReviewBloc, CreatedReviewState>(
                    buildWhen: (pre, next) => next is CreatedReviewPhotoSelected,
                    builder: (context, state) {
                      int itemCount = 1;
                      List<String> photos = [];
                      if (state is CreatedReviewPhotoSelected) {
                        itemCount += state.photos.length;
                        photos = [...state.photos];
                      }
                      return PhotoListRow(
                        itemCount: itemCount,
                        photos: photos,
                      );
                    },
                  ),
                  const SizedBox(height: 32),
                  const CreatedReviewPolicy(),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 48,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('등록하기'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          )),
    );
  }
}
