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

class CongestionCreateDialog extends StatefulWidget {
  const CongestionCreateDialog({Key? key}) : super(key: key);

  static Future<int> show(BuildContext context) async {
    final result = await showDialog<int?>(
      context: context,
      builder: (context) => const CongestionCreateDialog(),
    );

    return result ?? -1;
  }

  @override
  State<CongestionCreateDialog> createState() => _CongestionCreateDialogState();
}

class _CongestionCreateDialogState extends State<CongestionCreateDialog> {
  int score = -1;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: 300,
        width: 300,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                '지금 카페의 혼잡도는 어떤가요?',
                style: AppStyle.subTitle17Bold,
              ),
              const SizedBox(height: 12),
              Text(
                '혼잡도를 알려주시면 스티커를 드려요.',
                style: AppStyle.body14Regular.copyWith(
                  color: AppColor.grey600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () => setState(() => score = 3),
                    child: _CongestionScoreColumn(
                      isChecked: score == 3,
                      title: '널널해요',
                      offIcon: AppImage.confGoodGrey,
                      onIcon: AppImage.confGood,
                    ),
                  ),
                  InkWell(
                    onTap: () => setState(() => score = 2),
                    child: _CongestionScoreColumn(
                      isChecked: score == 2,
                      title: '괜찮아요',
                      offIcon: AppImage.confGoodGrey,
                      onIcon: AppImage.confGood,
                    ),
                  ),
                  InkWell(
                    onTap: () => setState(() => score = 1),
                    child: _CongestionScoreColumn(
                      isChecked: score == 1,
                      title: '북적거려요',
                      offIcon: AppImage.confGoodGrey,
                      onIcon: AppImage.confGood,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              SizedBox(
                height: 44,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: score != -1
                      ? () => Navigator.of(context).pop(score)
                      : null,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: AppColor.white,
                    backgroundColor: AppColor.orange400,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    textStyle: AppStyle.subTitle16Medium,
                  ),
                  child: const Text('확인'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CongestionScoreColumn extends StatelessWidget {
  const _CongestionScoreColumn({
    Key? key,
    required this.isChecked,
    required this.title,
    required this.offIcon,
    required this.onIcon,
  }) : super(key: key);

  final bool isChecked;
  final String title;
  final String onIcon;
  final String offIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        loadAsset(
          isChecked ? onIcon : offIcon,
          height: 72,
          width: 72,
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          title,
          style: AppStyle.caption13Medium.copyWith(
            color: isChecked ? AppColor.grey800 : AppColor.grey400,
          ),
        )
      ],
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
