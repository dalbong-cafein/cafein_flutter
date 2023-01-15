import 'package:cafein_flutter/cafein_const.dart';
import 'package:cafein_flutter/feature/image_detail/image_detail_page.dart';
import 'package:cafein_flutter/feature/post_stop/bloc/post_stop_bloc.dart';
import 'package:cafein_flutter/feature/post_stop/widget/reported_review_detail_score_card.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/widget/card/custom_cached_network_image.dart';
import 'package:cafein_flutter/widget/dialog/error_dialog.dart';
import 'package:cafein_flutter/widget/indicator/custom_circle_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportedReviewDetailCard extends StatelessWidget {
  const ReportedReviewDetailCard({Key? key, required noticeId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return BlocConsumer<PostStopBloc, PostStopState>(
      listener: (context, state) {
        if (state is PostStopError) {
          ErrorDialog.show(
            context,
            error: state.error,
            refresh: state.event,
          );
        }
      },
      builder: (context, state) {
        if (state is PostStopLoaded) {
          final imageList =
          (state.reportedReview.reviewImageIdPairs ?? []).map((e) => e.imageUrl).toList();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "신고 사유",
                  style: AppStyle.subTitle15Bold,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  state.reportCategoryName,
                  style:
                      AppStyle.body15Regular.copyWith(color: AppColor.grey900),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Center(
                child: Container(
                  height: 1.0,
                  width: width - 40,
                  color: AppColor.grey100,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "신고 대상 게시물",
                  style: AppStyle.subTitle15Bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 16,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: SizedBox.fromSize(
                        size: const Size.fromRadius(20),
                        child: CustomCachedNetworkImage(
                          imageUrl: state.reportedReview.storeImageDto == null
                              ? CafeinConst.defaultStoreImageUrl
                              : state.reportedReview.storeImageDto!.imageUrl,
                          height: 32,
                          width: 32,
                          fit: BoxFit.cover,
                        )),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.reportedReview.storeName,
                        style: AppStyle.subTitle14Medium,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "${state.reportedReview.regDateTime.substring(2, 4)}.${state.reportedReview.regDateTime.substring(5, 7)}.${state.reportedReview.regDateTime.substring(8, 10)} 작성 리뷰",
                        style: AppStyle.caption12Regular
                            .copyWith(color: AppColor.grey400),
                      )
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 12),
                child: const ReportedReviewDetailScoreCard(),
              ),
              const SizedBox(
                height: 12,
              ),
              state.reportedReview.reviewImageIdPairs!.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: SizedBox(
                        height: 72,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, imageIndex) => InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                ImageDetailPage.routeName,
                                arguments: ImageDetailPageArguments(
                                  initialPage: imageIndex,
                                  imageUrls: imageList,
                                ),
                              );
                            },
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8),
                              ),
                              child: CustomCachedNetworkImage(
                                key: ValueKey(
                                    state.reportedReview.reviewImageIdPairs![imageIndex].imageUrl
                                ),
                                imageUrl:
                                    state.reportedReview.reviewImageIdPairs![imageIndex].imageUrl,
                                height: 74,
                                width: 74,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 8,
                          ),
                          itemCount: (imageList).length,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
              state.reportedReview.reviewImageIdPairs!.isNotEmpty ? const SizedBox(
                height: 24,
              ) : const SizedBox.shrink(),
              Center(
                child: Container(
                  height: 1.0,
                  width: width - 40,
                  color: AppColor.grey100,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "게시 중단 일자",
                  style: AppStyle.subTitle15Bold,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "${state.reportedReview.stopPostDateTime.substring(2, 4)}.${state.reportedReview.stopPostDateTime.substring(5, 7)}.${state.reportedReview.stopPostDateTime.substring(8, 10)}"
                  ,style:
                      AppStyle.body15Regular.copyWith(color: AppColor.grey900),
                ),
              ),
            ],
          );
        } else {
          return const CustomCircleLoadingIndicator();
        }
      },
    );
  }
}
