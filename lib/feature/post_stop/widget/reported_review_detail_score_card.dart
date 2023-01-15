import 'package:cafein_flutter/data/model/enum/review_category.dart';
import 'package:cafein_flutter/data/model/enum/review_recommendation.dart';
import 'package:cafein_flutter/feature/post_stop/bloc/post_stop_bloc.dart';
import 'package:cafein_flutter/feature/review/widget/review_recommendation_button.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/widget/indicator/custom_circle_loading_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReportedReviewDetailScoreCard extends StatefulWidget {
  const ReportedReviewDetailScoreCard({Key? key}) : super(key: key);

  @override
  State<ReportedReviewDetailScoreCard> createState() =>
      _ReportedReviewDetailScoreCardState();
}

class _ReportedReviewDetailScoreCardState
    extends State<ReportedReviewDetailScoreCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostStopBloc, PostStopState>(
      builder: (context, state) {
        if (state is PostStopLoaded){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ReviewRecommendationButton(
                reviewRecommendation: ReviewRecommendation.values
                    .where(
                      (element) => element.jsonValue == state.reportedReview.recommendation,
                )
                    .first,
                onPressed: () => setState(() => isExpanded = !isExpanded),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.only(
                  top: 10,
                ),
                width: 224,
                height: isExpanded ? 40 : 0,
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  children: [
                    Row(
                      children: [
                        _ReviewDetailRow(
                          categoryTitle: ReviewCategory.wifi.name,
                          reviewScore: state.reportedReview.detailEvaluation!.wifi,
                        ),
                        const SizedBox(width: 8),
                        _ReviewDetailRow(
                          categoryTitle: ReviewCategory.socket.name,
                          reviewScore: state.reportedReview.detailEvaluation!.socket,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        _ReviewDetailRow(
                          categoryTitle: '${ReviewCategory.restroom.name} ',
                          reviewScore: state.reportedReview.detailEvaluation!.restroom,
                        ),
                        const SizedBox(width: 8),
                        _ReviewDetailRow(
                          categoryTitle: ReviewCategory.table.name,
                          reviewScore: state.reportedReview.detailEvaluation!.tableSize,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        }else{
          return const CustomCircleLoadingIndicator();
        }
      },
    );
  }
}

class _ReviewDetailRow extends StatelessWidget {
  const _ReviewDetailRow({
    required this.categoryTitle,
    required this.reviewScore,
  });

  final String categoryTitle;
  final int reviewScore;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: categoryTitle.length == 4 ? 42 : 34,
          child: Text(
            categoryTitle,
            style: AppStyle.caption12Regular,
          ),
        ),
        const SizedBox(width: 4),
        RatingBarIndicator(
          rating: reviewScore.toDouble(),
          itemBuilder: (context, index) => const Icon(
            Icons.star,
            color: AppColor.orange500,
          ),
          itemCount: 5,
          itemSize: 12,
          unratedColor: AppColor.grey200,
          direction: Axis.horizontal,
        ),
      ],
    );
  }
}
