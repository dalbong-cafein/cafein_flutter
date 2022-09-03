import 'package:cafein_flutter/feature/received_coupons/bloc/received_coupons_bloc.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/widget/dialog/error_dialog.dart';
import 'package:cafein_flutter/widget/indicator/custom_circle_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReceivedCouponsPage extends StatelessWidget {
  const ReceivedCouponsPage({Key? key}) : super(key: key);
  static const routeName = 'ReceivedCouponsPage';

  @override
  Widget build(BuildContext context) {
    context.read<ReceivedCouponsBloc>().add(ReceivedCouponsRequested());
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "받은 쿠폰",
            style: AppStyle.subTitle16Medium,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: BlocConsumer<ReceivedCouponsBloc, ReceivedCouponsState>(
            listener: (context, state) {
              if (state is ReceivedCouponsError) {
                ErrorDialog.show(
                  context,
                  error: state.error,
                  refresh: state.event,
                );
              }
            },
            builder: (context, state) {
              if (state is ReceivedCouponsLoaded) {
                return ListView.builder(
                    itemCount: state.coupons.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: width * 2 / 3,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${state.coupons[index].registeredDateTime.substring(5, 7)}.${state.coupons[index].registeredDateTime.substring(8, 10)}",
                                        style: AppStyle.body14Regular,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 16),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        state.coupons[index].itemName,
                                        style: AppStyle.subTitle15Medium,
                                      ),
                                      Text(
                                        state.coupons[index].brandName,
                                        style: AppStyle.caption13Regular
                                            .copyWith(color: AppColor.grey400),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: width * 1 / 3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 14, right: 20),
                                  child: isSend(state.coupons[index].status),
                                ),
                              ],
                            ),
                          )
                        ],
                      );
                    });
              }
              if (state is ReceivedCouponsLoading) {
                return const CustomCircleLoadingIndicator();
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ));
  }

  Widget isSend(bool isSend) {
    if (isSend) {
      return Container(
        decoration: const BoxDecoration(
          color: AppColor.grey50,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          child: Text(
            "전송 완료",
            style: AppStyle.caption13Medium.copyWith(color: AppColor.grey400),
          ),
        ),
      );
    } else {
      return Container(
        decoration: const BoxDecoration(
          color: AppColor.orange50,
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          child: Text(
            "신청 완료",
            style: AppStyle.caption13Medium.copyWith(
              color: AppColor.orange500,
            ),
          ),
        ),
      );
    }
  }
}
