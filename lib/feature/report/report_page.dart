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
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
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
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(top: 24, left: 24, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "신고하는 이유를 알려주세요",
                  style: AppStyle.title21Bold.copyWith(color: AppColor.grey900),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "신고 이유가 타당하지 않으면 반영되지 않을 수\n있습니다.",
                  style:
                      AppStyle.body14Regular.copyWith(color: AppColor.grey600),
                ),
                const SizedBox(
                  height: 24,
                ),
                ListView.builder(
                    itemCount: 1,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Row(
                          children: [
                            SizedBox(
                                width: (width - 44) / 2,
                                child: const Text("gg",
                                    style: AppStyle.subTitle15Medium)),
                            SizedBox(
                              width: (width - 44) / 2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  loadAsset(AppIcon.doneOff,
                                      fit: BoxFit.scaleDown,
                                      height: 24,
                                      width: 24),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    })
              ],
            ),
          );
        },
      ),
      bottomSheet: SizedBox(
        height: 56,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 9),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(14.0)),
                  color: AppColor.orange100,
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
          ],
        ),
      ),
    );
  }
}
