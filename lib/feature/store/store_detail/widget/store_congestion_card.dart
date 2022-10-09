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
              if (state.congestionResponse.congestionList.isEmpty) {
                return Column(
                  children: [
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        '혼잡도',
                        style: AppStyle.subTitle17SemiBold,
                      ),
                    ),
                    const SizedBox(height: 24),
                    loadAsset(
                      AppImage.characterQuestionS,
                      width: 42,
                      height: 42,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '제보된 혼잡도 정보가 없어요\n혼잡도 눌려주기를 눌러 카페의 혼잡도를 알려주세요',
                      style: AppStyle.caption13Regular.copyWith(
                        color: AppColor.grey600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
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
                );
              }
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
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.congestionResponse.congestionList.length,
                      itemBuilder: (context, index) => SizedBox(
                        height: 56,
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: index == 0 ? 24 : 20,
                              backgroundColor: index == 0
                                  ? AppColor.green50
                                  : AppColor.grey50,
                              foregroundColor: index == 0
                                  ? AppColor.green500
                                  : AppColor.grey400,
                              child: Center(
                                child: Text(
                                  getCongestionTitle(state.congestionResponse
                                      .congestionList[index].congestionScore),
                                  style: index == 0
                                      ? AppStyle.subTitle15Medium
                                      : AppStyle.caption13Medium,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${state.congestionResponse.congestionList[index].nicknameOfWriter}의 제보',
                                    style: AppStyle.subTitle15Medium,
                                  ),
                                  const Spacer(),
                                  Text(
                                    state
                                        .congestionResponse
                                        .congestionList[index]
                                        .registeredDateTime,
                                    style: AppStyle.caption12Regular.copyWith(
                                      color: AppColor.grey600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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

String getCongestionTitle(int score) {
  if (score == 1) {
    return '혼잡';
  } else if (score == 2) {
    return '보통';
  } else {
    return '여유';
  }
}
