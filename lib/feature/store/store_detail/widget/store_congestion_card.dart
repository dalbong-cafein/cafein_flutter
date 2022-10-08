import 'package:cafein_flutter/feature/store/store_detail/bloc/congestion_bloc.dart';
import 'package:cafein_flutter/feature/store/store_detail/widget/store_congestion_bottom_sheet.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:cafein_flutter/widget/indicator/custom_circle_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class StoreCongestionCard extends StatefulWidget {
  const StoreCongestionCard({
    super.key,
  });

  @override
  State<StoreCongestionCard> createState() => _StoreCongestionCardState();
}

class _StoreCongestionCardState extends State<StoreCongestionCard> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<CongestionBloc>().add(
            CongestionRequested(
              day: '${DateFormat.E('ko_KR').format(
                DateTime.now(),
              )}요일',
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 20,
        ),
        child: BlocBuilder<CongestionBloc, CongestionState>(
          buildWhen: (pre, next) => next is CongestionLoaded,
          builder: (context, state) {
            if (state is CongestionLoaded) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '혼잡도',
                    style: AppStyle.subTitle17SemiBold,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 36,
                        width: 88,
                        child: ElevatedButton(
                          onPressed: () async {
                            final bloc = context.read<CongestionBloc>();
                            final result =
                                await StoreCongestionBottomSheet.show(
                              context,
                              selectedDay: state.day,
                            );

                            if (result.isEmpty) {
                              return;
                            }

                            if (result == state.day) {
                              return;
                            }

                            bloc.add(
                              CongestionRequested(day: result),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: AppColor.grey800,
                            backgroundColor: AppColor.white,
                            textStyle: AppStyle.subTitle14Medium,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              side: BorderSide(
                                color: AppColor.grey300,
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                state.day,
                                style: AppStyle.subTitle14Medium,
                              ),
                              const SizedBox(width: 4),
                              loadAsset(AppIcon.downXS),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 36,
                        width: 116,
                        child: ElevatedButton(
                          onPressed: () async {
                            final bloc = context.read<CongestionBloc>();

                            final result =
                                await CongestionCreateDialog.show(context);
                            if (result == -1) {
                              return;
                            }

                            bloc.add(CongestionCreateRequested(
                              score: result,
                            ));
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            padding: EdgeInsets.zero,
                            textStyle: AppStyle.subTitle14Medium,
                          ),
                          child: const Text('혼잡도 알려주기'),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }

            return const CustomCircleLoadingIndicator();
          },
        ),
      ),
    );
  }
}

class CongestionCreateDialog extends StatelessWidget {
  const CongestionCreateDialog({Key? key}) : super(key: key);

  static Future<int> show(BuildContext context) async {
    final result = await showDialog<int?>(
      context: context,
      builder: (context) => const CongestionCreateDialog(),
    );

    return result ?? 1;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: 292,
        width: 300,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
