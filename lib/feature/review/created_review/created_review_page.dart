import 'package:cafein_flutter/cafein_const.dart';
import 'package:cafein_flutter/data/model/common/image_type_pair.dart';
import 'package:cafein_flutter/data/model/enum/image_type.dart';
import 'package:cafein_flutter/data/model/enum/review_recommendation.dart';
import 'package:cafein_flutter/data/model/store/store_detail.dart';
import 'package:cafein_flutter/feature/gallery/gallery_page.dart';
import 'package:cafein_flutter/feature/main/bloc/photo_permission_bloc.dart';
import 'package:cafein_flutter/feature/review/created_review/bloc/created_review_bloc.dart';
import 'package:cafein_flutter/feature/review/created_review/widget/created_review_impossible_dialog.dart';
import 'package:cafein_flutter/feature/review/created_review/widget/created_review_max_dialog.dart';
import 'package:cafein_flutter/feature/review/created_review/widget/created_succed_without_sticker_dialog.dart';
import 'package:cafein_flutter/feature/review/created_review/widget/sticker_count_dialog.dart';
import 'package:cafein_flutter/feature/review/widget/review_back_dialog.dart';
import 'package:cafein_flutter/feature/review/widget/review_policy_card.dart';
import 'package:cafein_flutter/feature/review/created_review/widget/created_succeed_dialog.dart';
import 'package:cafein_flutter/feature/review/widget/photo_list_row.dart';
import 'package:cafein_flutter/feature/review/widget/review_detail_score_card.dart';
import 'package:cafein_flutter/feature/review/widget/score_character_button.dart';
import 'package:cafein_flutter/feature/review/registered_review/registered_review_page.dart';
import 'package:cafein_flutter/feature/sticker/sticker_page.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:cafein_flutter/widget/card/custom_cached_network_image.dart';
import 'package:cafein_flutter/widget/dialog/error_dialog.dart';
import 'package:cafein_flutter/widget/dialog/permission_dialog.dart';
import 'package:cafein_flutter/widget/indicator/dots_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

class CreateReviewPageArguments {
  final StoreDetail storeDetail;
  final ReviewRecommendation? recommendation;

  CreateReviewPageArguments({
    required this.storeDetail,
    this.recommendation,
  });
}

class CreatedReviewPage extends StatefulWidget {
  const CreatedReviewPage({
    Key? key,
    required this.storeDetail,
    this.recommendation,
  }) : super(key: key);

  static const routeName = 'CreatedReviewPage';

  final StoreDetail storeDetail;
  final ReviewRecommendation? recommendation;

  @override
  State<CreatedReviewPage> createState() => _CreatedReviewPageState();
}

class _CreatedReviewPageState extends State<CreatedReviewPage> {
  @override
  void initState() {
    super.initState();
    if (widget.recommendation != null) {
      Future.microtask(
        () => context.read<CreatedReviewBloc>().add(
              CreatedReviewScoreChanged(
                recommendation: widget.recommendation!,
              ),
            ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    bool clicked = false;
    return MultiBlocListener(
      listeners: [
        BlocListener<CreatedReviewBloc, CreatedReviewState>(
          listener: (context, state) async {
            final bloc = context.read<CreatedReviewBloc>();
            final navigator = Navigator.of(context);

            if (state is CreatedReviewError) {
              ErrorDialog.show(
                context,
                error: state.error,
                refresh: state.event,
              );
            } else if (state is CreatedReviewStickerError) {
              await CreatedSucceedWithoutStickerDialog.show(context);
              navigator.pop();
            } else if (state is CreatedReviewSucceed) {
              final result = await CreatedSucceedDialog.show(
                context,
                isCreatedSticker: false,
              );

              if (!result) {
                navigator.pop();
                return;
              }

              navigator.pushReplacementNamed(
                RegisteredReviewPage.routeName,
              );
            } else if (state is CreatedReviewPossibleChecked) {
              if (state.isAvailable) {
                bloc.add(const CreatedReviewStickerPossibleRequested());

                return;
              }

              CreatedReviewImpossibleDialog.show(context);
            } else if (state is CreatedReviewStickerPossibleChecked) {
              if (state.isAvailable) {
                bloc.add(const CreatedReviewRequested(
                  isAvailable: true,
                ));

                return;
              }
              if (state.reason == '보유 가능한 스티커 수량 초과') {
                final result = await StickerCountDialog.show(context);

                if (result == null) {
                  return;
                }

                if (result) {
                  navigator.pushReplacementNamed(
                    StickerPage.routeName,
                  );

                  return;
                }

                bloc.add(const CreatedReviewRequested(
                  isAvailable: false,
                ));
              } else if (state.reason == '하루 최대 스티커 발급 수량 초과') {
                final result = await CreatedReviewMaxDialog.show(context);

                if (!result) {
                  return;
                }

                bloc.add(const CreatedReviewRequested(
                  isAvailable: false,
                ));
              } else {
                ErrorDialog.show(
                  context,
                  error: Error(),
                  refresh: () {},
                );
              }
            } else if (state is CreatedReviewStickerLoaded) {
              final result = await CreatedSucceedDialog.show(
                context,
                isCreatedSticker: true,
              );

              if (!result) {
                navigator.pop();
                return;
              }

              navigator.pushReplacementNamed(
                RegisteredReviewPage.routeName,
              );
            }
          },
        ),
        BlocListener<PhotoPermissionBloc, PhotoPermissionState>(
          listener: (context, state) async {
            final bloc = context.read<CreatedReviewBloc>();

            if (state is PhotoPermissionChecked &&
                state.processType == PhotoProcessType.createReview) {
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
                arguments: 5 - bloc.photos.length,
              );

              if (result is! List<String>) {
                return;
              }

              bloc.add(CreatedReviewPhotoRequested(
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
              title: const Text("리뷰 작성"),
              leading: IconButton(
                onPressed: () async {
                  if (!clicked) {
                    Navigator.of(context).pop();
                    return;
                  }
                  final navigator = Navigator.of(context);
                  final result = await ReviewBackDialog.show(
                    context,
                    title: '작성',
                  );

                  if (!result) {
                    return;
                  }

                  navigator.pop();
                },
                icon: loadAsset(AppIcon.left),
              )),
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 16),
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
                              imageUrl:
                                  widget.storeDetail.storeImageList.isNotEmpty
                                      ? widget.storeDetail.storeImageList.first
                                          .imageUrl
                                      : CafeinConst.defaultStoreImage,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        widget.storeDetail.storeName,
                        style: AppStyle.caption12Regular.copyWith(
                          color: AppColor.grey600,
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        "카공 카페로 어떤가요?",
                        style: AppStyle.subTitle17SemiBold,
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 52,
                        ),
                        child:
                            BlocBuilder<CreatedReviewBloc, CreatedReviewState>(
                          buildWhen: (pre, next) =>
                              next is CreatedReviewScoreChecked &&
                              next.recommendation != null,
                          builder: (context, state) {
                            bool isNormal = false;
                            bool isGood = false;
                            bool isBad = false;
                            final bloc = context.read<CreatedReviewBloc>();

                            if (state is CreatedReviewScoreChecked) {
                              switch (state.recommendation!) {
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
                                  onTap: () => bloc.add(
                                    const CreatedReviewScoreChanged(
                                      recommendation: ReviewRecommendation.bad,
                                    ),
                                  ),
                                  child: ScoreCharacterButton(
                                    message: '아쉬워요',
                                    onIcon: AppImage.recBad,
                                    offIcon: AppImage.recBadGrey,
                                    isChecked: isBad,
                                  ),
                                ),
                                InkWell(
                                  onTap: () => bloc.add(
                                    const CreatedReviewScoreChanged(
                                      recommendation:
                                          ReviewRecommendation.normal,
                                    ),
                                  ),
                                  child: ScoreCharacterButton(
                                    message: '무난해요',
                                    onIcon: AppImage.recNormal,
                                    offIcon: AppImage.recNormalGrey,
                                    isChecked: isNormal,
                                  ),
                                ),
                                InkWell(
                                  onTap: () => bloc.add(
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
                      Container(
                        height: 1.0,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        margin: const EdgeInsets.symmetric(
                          vertical: 24,
                        ),
                        width: double.infinity,
                        color: AppColor.grey50,
                      ),
                      BlocBuilder<CreatedReviewBloc, CreatedReviewState>(
                        buildWhen: (pre, next) =>
                            next is CreatedReviewScoreChecked,
                        builder: (context, state) {
                          String wifiScore = '';
                          String socketScore = '';
                          String tableScore = '';
                          String restroomScore = '';

                          final bloc = context.read<CreatedReviewBloc>();

                          if (state is CreatedReviewScoreChecked) {
                            wifiScore = state.wifiScore;
                            socketScore = state.socketScore;
                            tableScore = state.tableScore;
                            restroomScore = state.restroomScore;
                          }

                          if (wifiScore != '' ||
                              socketScore != '' ||
                              tableScore != '' ||
                              restroomScore != '') {
                            clicked = true;
                          }

                          return ReviewDetailScoreCard(
                            wifiScore: wifiScore,
                            socketScore: socketScore,
                            tableScore: tableScore,
                            restroomScore: restroomScore,
                            onRatingChanged: (reviewCategory, score) =>
                                bloc.add(CreatedReviewScoreDetailChanged(
                              reviewCategory: reviewCategory,
                              score: score,
                            )),
                            textControllerListener: (text) => bloc.add(
                              CreatedReviewTextChanged(text: text),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                      BlocBuilder<CreatedReviewBloc, CreatedReviewState>(
                        buildWhen: (pre, next) =>
                            next is CreatedReviewPhotoSelected,
                        builder: (context, state) {
                          int itemCount = 1;
                          List<String> photos = [];

                          if (state is CreatedReviewPhotoSelected) {
                            itemCount += state.photos.length;
                            photos = [...state.photos];
                          }
                          return PhotoListRow(
                            itemCount: itemCount,
                            photos: photos
                                .map((e) => ImageTypePair(
                                      imageUrl: e,
                                      imageType: ImageType.file,
                                    ))
                                .toList(),
                            onTapPhoto: photos.length < 5
                                ? () => context
                                    .read<PhotoPermissionBloc>()
                                    .add(const PhotoPermissionRequested(
                                      processType:
                                          PhotoProcessType.createReview,
                                    ))
                                : () {},
                            deleteImage: (imageUrl, imageType) => context
                                .read<CreatedReviewBloc>()
                                .add(CreatedReviewPhotoDeleteRequested(
                                    photo: imageUrl)),
                          );
                        },
                      ),
                      const SizedBox(height: 32),
                      const ReviewPolicyCard(),
                    ],
                  ),
                ),
              ),
              BlocBuilder<CreatedReviewBloc, CreatedReviewState>(
                buildWhen: (pre, next) =>
                    next is CreatedReviewScoreChecked ||
                    pre is CreatedReviewLoading ||
                    next is CreatedReviewLoading,
                builder: (context, state) {
                  bool isValid = false;
                  bool isLoading = false;

                  if (state is CreatedReviewScoreChecked) {
                    isValid = state.isValid;
                  } else if (state is CreatedReviewLoading) {
                    isLoading = true;
                  }
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 24, top: 8),
                    child: SizedBox(
                      height: 48,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        child: ElevatedButton(
                          onPressed: !isValid
                              ? null
                              : () => context.read<CreatedReviewBloc>().add(
                                    const CreatedReviewPossibleRequested(),
                                  ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: isLoading
                              ? const DotsLoadingIndicator()
                              : const Text('등록하기'),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
