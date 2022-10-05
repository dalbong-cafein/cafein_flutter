import 'package:cafein_flutter/cafein_const.dart';
import 'package:cafein_flutter/feature/apply_coupon/bloc/apply_coupon_bloc.dart';

import 'package:cafein_flutter/feature/apply_coupon/widget/apply_coupon_finished.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:cafein_flutter/widget/dialog/error_dialog.dart';
import 'package:cafein_flutter/widget/indicator/custom_circle_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApplyCouponPage extends StatelessWidget {
  const ApplyCouponPage({Key? key}) : super(key: key);
  static const routeName = 'ApplyCouponPage';

  @override
  Widget build(BuildContext context) {
    context.read<ApplyCouponBloc>().add(CouponInitialLoading());
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final bottomPadding = MediaQuery.of(context).viewPadding.bottom;

    return BlocConsumer<ApplyCouponBloc, ApplyCouponState>(
      buildWhen: (pre, next) =>
          next is CouponClickLoaded ||
          next is CouponInitialLoading ||
          next is CouponReClickLoaded ||
          next is ApplyCouponLoaded,
      listener: (context, state) {
        if (state is ApplyCouponLoaded) {
          Navigator.of(context).pushReplacementNamed(
            ApplyCouponFinishedPage.routeName,
          );
        }
        if (state is ApplyCouponError) {
          ErrorDialog.show(
            context,
            error: state.error,
            refresh: state.event,
          );
        }
      },
      builder: (context, state) {
        if (state is CouponClickLoaded) {
          return Scaffold(
            bottomSheet: SizedBox(
              height: bottomPadding > 0 ? bottomPadding + 72 : 72,
              child: Column(
                children: [
                  Container(
                    height: 1.0,
                    width: width,
                    color: AppColor.grey100,
                  ),
                  const SizedBox(height: 8),
                  InkWell(
                    onTap: () => context.read<ApplyCouponBloc>().add(
                          ApplyCouponRequested(
                            clickedIndex: state.clickedIndex,
                          ),
                        ),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: AppColor.orange400,
                        borderRadius: BorderRadius.all(
                          Radius.circular(14.0),
                        ),
                      ),
                      width: width - 32,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                        ),
                        child: Center(
                          child: Text(
                            "이 쿠폰으로 신청하기",
                            style: AppStyle.subTitle15Medium.copyWith(
                              color: AppColor.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            appBar: AppBar(
              title: const Text(
                "쿠폰 신청",
                style: AppStyle.subTitle16Medium,
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(bottom : 70),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 158 / 240,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: index % 2 == 0
                          ? EdgeInsets.only(left: 16, top: index == 1 || index == 0 ? 10 : 0)
                          : EdgeInsets.only(right: 16, top: index == 1 || index == 0 ? 10 : 0),
                      child: InkWell(
                        onTap: () {
                          if (state.clickedIndex == index) {
                            context.read<ApplyCouponBloc>().add(CouponReClicked());
                          } else {
                            context.read<ApplyCouponBloc>().add(CouponClicked(clickedIndex: index));
                          }
                        },
                        child: Container(
                          height: 240,
                          decoration: BoxDecoration(
                            color: AppColor.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 6,
                              ),
                            ],
                            border: Border.all(
                                width: 2,
                                color:
                                    index == state.clickedIndex ? AppColor.orange500 : Colors.white),
                            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                loadAsset(CafeinConst.couponStoreImages[index]),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    loadAsset(CafeinConst.couponStoreIcons[index],
                                        height: 16, width: 16),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      CafeinConst.couponStoreNames[index],
                                      style:
                                          AppStyle.caption12Regular.copyWith(color: AppColor.grey600),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  CafeinConst.couponItemNames[index],
                                  style: AppStyle.subTitle15Bold,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        }
        if (state is ApplyCouponLoading) {
          return Container(
            color: AppColor.white,
            height: height,
            width: width,
            child: const Center(
              child: CustomCircleLoadingIndicator(),
            ),
          );
        } else {
          return Scaffold(
            bottomSheet: SizedBox(
              height: bottomPadding > 0 ? bottomPadding + 72 : 72,
              child: Column(
                children: [
                  Container(
                    height: 1.0,
                    width: width,
                    color: AppColor.grey100,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: AppColor.orange100,
                      borderRadius: BorderRadius.all(
                        Radius.circular(14.0),
                      ),
                    ),
                    width: width - 32,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                      ),
                      child: Center(
                        child: Text(
                          "이 쿠폰으로 신청하기",
                          style: AppStyle.subTitle15Medium.copyWith(
                            color: AppColor.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            appBar: AppBar(
              title: const Text(
                "쿠폰 신청",
                style: AppStyle.subTitle16Medium,
              ),
            ),
            body: SingleChildScrollView(
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 158 / 240,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: index % 2 == 0
                        ? EdgeInsets.only(
                            left: 16,
                            top: index == 1 || index == 0 ? 10 : 0,
                          )
                        : EdgeInsets.only(
                            right: 16,
                            top: index == 1 || index == 0 ? 10 : 0,
                          ),
                    child: InkWell(
                      onTap: () {
                        context.read<ApplyCouponBloc>().add(CouponClicked(clickedIndex: index));
                      },
                      child: Container(
                        height: 240,
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 6,
                            ),
                          ],
                          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                          border: Border.all(width: 2, color: Colors.white),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              loadAsset(CafeinConst.couponStoreImages[index]),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  loadAsset(CafeinConst.couponStoreIcons[index],
                                      height: 16, width: 16),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    CafeinConst.couponStoreNames[index],
                                    style:
                                        AppStyle.caption12Regular.copyWith(color: AppColor.grey600),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                CafeinConst.couponItemNames[index],
                                style: AppStyle.subTitle15Bold,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        }
      },
    );
  }
}
