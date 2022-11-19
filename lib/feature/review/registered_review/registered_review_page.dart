import 'package:cafein_flutter/feature/review/registered_review/bloc/registered_review_bloc.dart';
import 'package:cafein_flutter/feature/review/registered_review/widget/registered_review_card.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:cafein_flutter/widget/dialog/error_dialog.dart';
import 'package:cafein_flutter/widget/indicator/custom_circle_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisteredReviewPage extends StatefulWidget {
  const RegisteredReviewPage({Key? key}) : super(key: key);

  static const routeName = 'RegisteredReviewPage';

  @override
  State<RegisteredReviewPage> createState() => _RegisteredReviewPageState();
}

class _RegisteredReviewPageState extends State<RegisteredReviewPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<RegisteredReviewBloc>().add(
            const RegisteredReviewRequested(),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return BlocListener<RegisteredReviewBloc, RegisteredReviewState>(
      listener: (context, state) {
        if (state is RegisteredReviewError) {
          ErrorDialog.show(
            context,
            error: state.error,
            refresh: state.event,
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('작성한 리뷰'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 42,
              width: width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child:
                      BlocBuilder<RegisteredReviewBloc, RegisteredReviewState>(
                    buildWhen: (pre, next) => next is RegisteredReviewLoaded,
                    builder: (context, state) {
                      int count = 0;

                      if (state is RegisteredReviewLoaded) {
                        count = state.reviewCount;
                      }

                      return Text(
                        '총 $count개',
                        style: AppStyle.subTitle14Medium.copyWith(
                          color:
                              count == 0 ? AppColor.grey300 : AppColor.grey600,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Container(
              height: 1,
              width: width,
              color: AppColor.grey100,
            ),
            Expanded(
              child: BlocBuilder<RegisteredReviewBloc, RegisteredReviewState>(
                buildWhen: (pre, next) =>
                    pre is RegisteredReviewLoading ||
                    next is RegisteredReviewLoading,
                builder: (context, state) {
                  if (state is! RegisteredReviewLoaded) {
                    return const CustomCircleLoadingIndicator();
                  }

                  if (state.reviewList.isEmpty) {
                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewPadding.bottom,
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            loadAsset(AppIcon.textBlank),
                            const SizedBox(height: 12),
                            Text(
                              '작성한 리뷰가 없어요',
                              style: AppStyle.caption13Regular.copyWith(
                                color: AppColor.grey600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  return ListView.separated(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                    ),
                    itemBuilder: (context, index) => RegisteredReviewCard(
                      review: state.reviewList[index],
                      index: index,
                    ),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 8,
                    ),
                    itemCount: state.reviewList.length,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
