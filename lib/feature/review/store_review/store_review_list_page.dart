import 'package:cafein_flutter/data/model/store/store_detail.dart';
import 'package:cafein_flutter/feature/review/created_review/created_review_page.dart';
import 'package:cafein_flutter/feature/review/store_review/bloc/store_review_bloc.dart';
import 'package:cafein_flutter/feature/review/store_review/widget/store_review_list_card.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:cafein_flutter/widget/dialog/error_dialog.dart';
import 'package:cafein_flutter/widget/indicator/custom_circle_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreReviewListPage extends StatefulWidget {
  const StoreReviewListPage({
    Key? key,
    required this.storeDetail,
  }) : super(key: key);

  static const routeName = 'StoreReviewListPage';

  final StoreDetail storeDetail;

  @override
  State<StoreReviewListPage> createState() => _StoreReviewListPageState();
}

class _StoreReviewListPageState extends State<StoreReviewListPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<StoreReviewBloc>().add(
            const StoreReviewRequested(),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<StoreReviewBloc, StoreReviewState>(
      listener: (context, state) async {
        if (state is StoreReviewError) {
          ErrorDialog.show(
            context,
            error: state.error,
            refresh: state.event,
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: loadAsset(AppIcon.left),
          ),
          title: BlocBuilder<StoreReviewBloc, StoreReviewState>(
            buildWhen: (pre, next) => next is StoreReviewLoaded,
            builder: (context, state) {
              String title = '리뷰';
              if (state is StoreReviewLoaded) {
                title = '리뷰 ${state.totalCount}';
              }
              return Text(title);
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                right: 16,
              ),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    CreatedReviewPage.routeName,
                    arguments: widget.storeDetail,
                  );
                },
                child: Text(
                  '리뷰쓰기',
                  style: AppStyle.subTitle14Medium.copyWith(
                    color: AppColor.orange500,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: BlocBuilder<StoreReviewBloc, StoreReviewState>(
          buildWhen: (pre, next) => next is StoreReviewLoaded,
          builder: (context, state) {
            if (state is! StoreReviewLoaded) {
              return const CustomCircleLoadingIndicator();
            }

            return Column(
              children: [
                SizedBox(
                  height: 42,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () => context.read<StoreReviewBloc>().add(
                                StoreReviewTypeChanged(
                                  isPhotoReviews: !state.isPhotoReview,
                                ),
                              ),
                          child: loadAsset(
                            state.isPhotoReview
                                ? AppIcon.checkRectangleOn
                                : AppIcon.checkRectangleOff,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          '사진 리뷰만',
                          style: AppStyle.subTitle14Medium,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.storeReviewList.length,
                    itemBuilder: (context, index) => StoreReviewListCard(
                      review: state.storeReviewList[index],
                      index: index,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
