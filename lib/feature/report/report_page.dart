import 'package:cafein_flutter/feature/report/bloc/report_bloc.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:cafein_flutter/widget/dialog/error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({Key? key}) : super(key: key);
  static const routeName = 'ReportPage';

  @override
  Widget build(BuildContext context) {
    context.read<ReportBloc>().add(ReportCategoryRequested());

    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(),
      body: BlocConsumer<ReportBloc, ReportState>(
        listener: (context, state) {
          if (state is ReportError) {
            ErrorDialog.show(
              context,
              error: state.error,
              refresh: state.event,
            );
          }
        },
        buildWhen: (pre, next) => next is ReportCategoryLoaded,
        builder: (context, state) {
          if (state is ReportCategoryLoaded) {
            return Padding(
              padding: const EdgeInsets.only(top: 24, left: 24, right: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "신고하는 이유를 알려주세요",
                      style: AppStyle.title21Bold
                          .copyWith(color: AppColor.grey900),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      "신고 이유가 타당하지 않으면 반영되지 않을 수\n있습니다.",
                      style: AppStyle.body14Regular
                          .copyWith(color: AppColor.grey600),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    ListView.builder(
                        itemCount: state.categories.length,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              if (state.clickedCategory == index) {
                                context.read<ReportBloc>().add(
                                    ReportCategoryClicked(
                                        clickedIndex: state.categories.length));
                              } else {
                                context.read<ReportBloc>().add(
                                    ReportCategoryClicked(clickedIndex: index));
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Row(
                                children: [
                                  SizedBox(
                                      width: (width - 44) * 0.8,
                                      child: Text(
                                          state.categories[index].categoryName,
                                          style: AppStyle.subTitle15Medium
                                              .copyWith(
                                                  color: index ==
                                                          state.clickedCategory
                                                      ? AppColor.orange500
                                                      : AppColor.grey800))),
                                  SizedBox(
                                    width: (width - 44) * 0.2,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        index == state.clickedCategory
                                            ? loadAsset(AppIcon.doneOn,
                                                fit: BoxFit.scaleDown,
                                                height: 24,
                                                width: 24)
                                            : loadAsset(AppIcon.doneOff,
                                                fit: BoxFit.scaleDown,
                                                height: 24,
                                                width: 24),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                    state.clickedCategory == state.categories.length - 1
                        ? TextField(
                            maxLines: 5,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(12),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: AppColor.grey400),
                                borderRadius: BorderRadius.circular(14.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: AppColor.grey400),
                                borderRadius: BorderRadius.circular(14.0),
                              ),
                              fillColor: AppColor.white,
                              hintText: "신고 이유를 작성해주세요",
                              hintStyle: AppStyle.body14Regular
                                  .copyWith(color: AppColor.grey400),
                              filled: true,
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
      bottomSheet: BlocBuilder<ReportBloc, ReportState>(
        buildWhen: (pre, next) => next is ReportCategoryLoaded,
        builder: (context, state) {
          if (state is ReportCategoryLoaded) {
            return SizedBox(
              height: 56,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 9),
                    child: InkWell(
                      onTap: () {
                        if (state.clickedCategory != state.categories.length) {
                          context.read<ReportBloc>().add(ReportRequested(
                              clickedIndex: state.clickedCategory));
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(14.0)),
                          color:
                              state.clickedCategory == state.categories.length
                                  ? AppColor.orange100
                                  : AppColor.orange500,
                        ),
                        width: width - 32,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Center(
                            child: Text(
                              "신고하기",
                              style: AppStyle.subTitle15Medium
                                  .copyWith(color: AppColor.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
