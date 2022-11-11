import 'package:cafein_flutter/cafein_const.dart';
import 'package:cafein_flutter/data/model/common/image_id_pair.dart';
import 'package:cafein_flutter/data/model/enum/review_recommendation.dart';
import 'package:cafein_flutter/data/model/review/store_review.dart';
import 'package:cafein_flutter/data/model/review/user_review.dart';
import 'package:cafein_flutter/feature/gallery/gallery_page.dart';
import 'package:cafein_flutter/feature/main/bloc/photo_permission_bloc.dart';
import 'package:cafein_flutter/feature/review/updated_review/bloc/updated_review_bloc.dart';
import 'package:cafein_flutter/feature/review/updated_review/widget/updated_succeed_dialog.dart';
import 'package:cafein_flutter/feature/review/widget/review_back_dialog.dart';
import 'package:cafein_flutter/feature/review/widget/review_policy_card.dart';
import 'package:cafein_flutter/feature/review/widget/photo_list_row.dart';
import 'package:cafein_flutter/feature/review/widget/review_detail_score_card.dart';
import 'package:cafein_flutter/feature/review/widget/score_character_button.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:cafein_flutter/widget/card/custom_cached_network_image.dart';
import 'package:cafein_flutter/widget/dialog/error_dialog.dart';
import 'package:cafein_flutter/widget/dialog/permission_dialog.dart';
import 'package:cafein_flutter/widget/indicator/dots_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

class UpdateReviewPageArgument {
  final int storeId;
  final String storeName;
  final ImageIdPair? storeImageIdPair;
  final StoreReview review;

  UpdateReviewPageArgument({
    required this.storeId,
    required this.storeName,
    required this.review,
    this.storeImageIdPair,
  });
}

class UpdatedReviewPage extends StatefulWidget {
  const UpdatedReviewPage({
    Key? key,
    required this.review,
  }) : super(key: key);

  static const routeName = 'UpdatedReviewPage';
  final UserReview review;

  @override
  State<UpdatedReviewPage> createState() => _UpdatedReviewPageState();
}

class _UpdatedReviewPageState extends State<UpdatedReviewPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<UpdatedReviewBloc, UpdatedReviewState>(
          listenWhen: (pre, next) => pre.isSucceed != next.isSucceed,
          listener: (context, state) async {
            final navigator = Navigator.of(context);

            await UpdatedSucceedDialog.show(context);
            navigator.pop(true);
          },
        ),
        BlocListener<UpdatedReviewBloc, UpdatedReviewState>(
          listenWhen: (pre, next) => pre.error != next.error,
          listener: (context, state) async {
            final bloc = context.read<UpdatedReviewBloc>();

            ErrorDialog.show(
              context,
              error: state.error,
              refresh: () => bloc.add(
                const UpdatedReviewRequested(),
              ),
            );
          },
        ),
        BlocListener<PhotoPermissionBloc, PhotoPermissionState>(
          listener: (context, state) async {
            final bloc = context.read<UpdatedReviewBloc>();

            if (state is PhotoPermissionChecked &&
                state.processType == PhotoProcessType.updateReview) {
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
                arguments: 5 - bloc.state.imageUrls.length,
              );

              if (result is! List<String>) {
                return;
              }

              bloc.add(UpdatedReviewImageChanged(
                photoList: [...result],
              ));
            }
          },
        ),
      ],
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text("리뷰 수정"),
            leading: IconButton(
              onPressed: () async {
                final navigator = Navigator.of(context);
                final result = await ReviewBackDialog.show(
                  context,
                  title: '수정',
                );

                if (!result) {
                  return;
                }

                navigator.pop();
              },
              icon: loadAsset(AppIcon.left),
            ),
          ),
          body: Column(
            children: [
              Expanded(
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
                              imageUrl: widget.review.storeImageIdPairs != null
                                  ? widget.review.storeImageIdPairs!.imageUrl
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
                        widget.review.storeName,
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
                        child:
                            BlocBuilder<UpdatedReviewBloc, UpdatedReviewState>(
                          buildWhen: (pre, next) =>
                              pre.reviewRecommendation !=
                              next.reviewRecommendation,
                          builder: (context, state) {
                            final bloc = context.read<UpdatedReviewBloc>();
                            bool isNormal = false;
                            bool isGood = false;
                            bool isBad = false;

                            switch (state.reviewRecommendation) {
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

                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () =>
                                      bloc.add(const UpdatedReviewScoreChanged(
                                    recommendation: ReviewRecommendation.bad,
                                  )),
                                  child: ScoreCharacterButton(
                                    message: '아쉬워요',
                                    onIcon: AppImage.recBad,
                                    offIcon: AppImage.recBadGrey,
                                    isChecked: isBad,
                                  ),
                                ),
                                InkWell(
                                  onTap: () =>
                                      bloc.add(const UpdatedReviewScoreChanged(
                                    recommendation: ReviewRecommendation.normal,
                                  )),
                                  child: ScoreCharacterButton(
                                    message: '무난해요',
                                    onIcon: AppImage.recNormal,
                                    offIcon: AppImage.recNormalGrey,
                                    isChecked: isNormal,
                                  ),
                                ),
                                InkWell(
                                  onTap: () =>
                                      bloc.add(const UpdatedReviewScoreChanged(
                                    recommendation: ReviewRecommendation.good,
                                  )),
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
                      Container(
                        height: 1.0,
                        width: double.infinity,
                        color: AppColor.grey50,
                        margin: const EdgeInsets.symmetric(
                          vertical: 24,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                      ),
                      BlocBuilder<UpdatedReviewBloc, UpdatedReviewState>(
                        buildWhen: (pre, next) =>
                            pre.socketScore != next.socketScore ||
                            pre.restroomScore != next.restroomScore ||
                            pre.wifiScore != next.wifiScore ||
                            pre.tableScore != next.tableScore,
                        builder: (context, state) => ReviewDetailScoreCard(
                          wifiScore: state.wifiScore,
                          socketScore: state.socketScore,
                          tableScore: state.tableScore,
                          restroomScore: state.restroomScore,
                          initialRestroomScore: widget
                              .review.detailEvaluation.restroom
                              .toString(),
                          initialSocketScore:
                              widget.review.detailEvaluation.socket.toString(),
                          initialTableScore: widget
                              .review.detailEvaluation.tableSize
                              .toString(),
                          initialWifiScore: widget
                              .review.detailEvaluation.tableSize
                              .toString(),
                          initialText: widget.review.content,
                          textControllerListener: (text) =>
                              context.read<UpdatedReviewBloc>().add(
                                    UpdatedReviewTextChanged(
                                      text: text,
                                    ),
                                  ),
                          onRatingChanged: (reviewCategory, score) =>
                              context.read<UpdatedReviewBloc>().add(
                                    UpdatedReviewScoreDetailChanged(
                                      reviewCategory: reviewCategory,
                                      score: score,
                                    ),
                                  ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      BlocBuilder<UpdatedReviewBloc, UpdatedReviewState>(
                        buildWhen: (pre, next) =>
                            pre.updateImageUrls != next.updateImageUrls ||
                            pre.deleteImageIds != next.deleteImageIds,
                        builder: (context, state) => PhotoListRow(
                          itemCount: state.imageUrls.length + 1,
                          photos: state.imageUrls,
                          onTapPhoto: state.imageUrls.length < 5
                              ? () => context.read<PhotoPermissionBloc>().add(
                                    const PhotoPermissionRequested(
                                      processType:
                                          PhotoProcessType.updateReview,
                                    ),
                                  )
                              : () {},
                          deleteImage: (imageUrl, imageType) =>
                              context.read<UpdatedReviewBloc>().add(
                                    UpdatedReviewImageDeleted(
                                      imageType: imageType,
                                      imageUrl: imageUrl,
                                    ),
                                  ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      const ReviewPolicyCard(),
                    ],
                  ),
                ),
              ),
              BlocBuilder<UpdatedReviewBloc, UpdatedReviewState>(
                buildWhen: (pre, next) =>
                    pre.isLoading != next.isLoading ||
                    pre.isValid != next.isValid,
                builder: (context, state) => Padding(
                  padding: const EdgeInsets.only(bottom: 24, top: 8),
                  child: SizedBox(
                    height: 48,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: ElevatedButton(
                        onPressed: state.isValid && !state.isLoading
                            ? () => context.read<UpdatedReviewBloc>().add(
                                  const UpdatedReviewRequested(),
                                )
                            : null,
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: state.isLoading
                            ? const DotsLoadingIndicator()
                            : const Text('등록하기'),
                      ),
                    ),
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
