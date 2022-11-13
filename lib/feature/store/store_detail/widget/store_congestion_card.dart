import 'package:cafein_flutter/data/model/congestion/congestion.dart';
import 'package:cafein_flutter/feature/main/bloc/location_permission_bloc.dart';
import 'package:cafein_flutter/feature/sticker/sticker_page.dart';
import 'package:cafein_flutter/feature/store/store_detail/bloc/congestion_bloc.dart';
import 'package:cafein_flutter/feature/store/store_detail/widget/congestion/congestion_sticker_max_dialog.dart';
import 'package:cafein_flutter/feature/store/store_detail/widget/store_congestion_bottom_sheet.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/datetime/ymd_dot_format.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:cafein_flutter/widget/dialog/error_dialog.dart';
import 'package:cafein_flutter/widget/dialog/permission_dialog.dart';
import 'package:cafein_flutter/widget/dialog/toast_dialog.dart';
import 'package:cafein_flutter/widget/indicator/custom_circle_loading_indicator.dart';
import 'package:cafein_flutter/widget/indicator/dots_loading_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

part './congestion/congestion_possible_dialog.dart';
part './congestion/created_succed_without_sticker_dialog.dart';
part './congestion/created_succeed_dialog.dart';
part './congestion/sticker_count_dialog.dart';
part './congestion/congestion_create_dialog.dart';
part './congestion/congestion_list_view.dart';

class StoreCongestionCard extends StatefulWidget {
  const StoreCongestionCard({
    super.key,
    required this.latY,
    required this.lngX,
  });

  final double latY;
  final double lngX;

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
    return BlocListener<LocationPermissionBloc, LocationPermissionState>(
      listener: (context, state) async {
        final bloc = context.read<CongestionBloc>();
        if (state is LocationPermissionChecked &&
            state.processType == ProcessType.congestion) {
          if (!state.permissionStatus.isGranted) {
            final result = await PermissionDialog.show(context);

            if (!result) {
              return;
            }
            openAppSettings();

            return;
          }

          bloc.add(CongestionLocationRequested(
            latY: widget.latY,
            lngX: widget.lngX,
          ));
        }
      },
      child: BlocConsumer<CongestionBloc, CongestionState>(
        listener: (context, state) async {
          final bloc = context.read<CongestionBloc>();
          final navigator = Navigator.of(context);

          if (state is CongestionLocationChecked) {
            if (!state.isAvailable) {
              ToastDialog.show(
                context,
                title: '혼잡도는 카페 근처에서\n알려줄 수 있어요',
              );

              return;
            }

            bloc.add(const CongestionPossibleRequested());
          } else if (state is CongestionError) {
            ErrorDialog.show(
              context,
              error: state.error,
              refresh: state.event,
            );
          } else if (state is CongestionPossibleChecked) {
            if (state.isPossible) {
              bloc.add(const CongestionStickerPossibleRequested());

              return;
            }

            CongestionPossibleDialog.show(context);
          } else if (state is CongestionStickerPossibleChecked) {
            if (state.isPossible) {
              final result = await CongestionCreateDialog.show(context);

              if (result == -1) {
                return;
              }

              bloc.add(
                CongestionCreateRequested(
                  isAvailable: true,
                  score: result,
                ),
              );

              return;
            }

            if (state.reason == '보유 가능한 스티커 수량 초과') {
              final result = await StickerCountDialog.show(context);

              if (result == null) {
                return;
              }

              if (result) {
                navigator.pushReplacementNamed(
                  StickerPage.routeName,
                );

                return;
              }

              // ignore: use_build_context_synchronously
              final score = await CongestionCreateDialog.show(context);

              if (score == -1) {
                return;
              }

              bloc.add(
                CongestionCreateRequested(
                  isAvailable: false,
                  score: score,
                ),
              );
            } else if (state.reason == '하루 최대 스티커 발급 수량 초과') {
              final result = await CongestionStickerMaxDialog.show(context);

              if (!result) {
                return;
              }

              // ignore: use_build_context_synchronously
              final score = await CongestionCreateDialog.show(context);

              if (score == -1) {
                return;
              }

              bloc.add(
                CongestionCreateRequested(
                  isAvailable: false,
                  score: score,
                ),
              );
            } else {
              ErrorDialog.show(
                context,
                error: Error(),
                refresh: () {},
              );
            }
          } else if (state is CongestionCreatedSucceed) {
            await CreatedSucceedWithoutStickerDialog.show(context);

            bloc.add(CongestionRequested(
              day: '${DateFormat.E('ko_KR').format(
                DateTime.now(),
              )}요일',
            ));
          } else if (state is CongestionStickerCreatedSucceed) {
            await CreatedSucceedDialog.show(
              context,
              isCreatedSticker: true,
            );

            bloc.add(CongestionRequested(
              day: '${DateFormat.E('ko_KR').format(
                DateTime.now(),
              )}요일',
            ));
          } else if (state is CongestionStickerError) {
            CreatedSucceedWithoutStickerDialog.show(context);
          }
        },
        buildWhen: (pre, next) => next is CongestionLoaded,
        builder: (context, state) {
          if (state is CongestionLoaded) {
            if (state.congestionResponse.congestionList.isEmpty) {
              if (!state.isInitialLoaded) {
                return SizedBox(
                  height: 280,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 20,
                    ),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: InkWell(
                            onTap: () => CongestionPossibleDialog.show(context),
                            child: const Text(
                              '혼잡도',
                              style: AppStyle.subTitle17SemiBold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
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
                              child:
                                  BlocBuilder<CongestionBloc, CongestionState>(
                                buildWhen: (pre, next) =>
                                    pre is CongestionLoading ||
                                    next is CongestionLoading,
                                builder: (context, state) {
                                  bool isLoading = false;

                                  if (state is CongestionLoading) {
                                    isLoading = true;
                                  }
                                  return ElevatedButton(
                                    onPressed: isLoading
                                        ? null
                                        : () => context
                                            .read<LocationPermissionBloc>()
                                            .add(
                                              const LocationPermissionRequest(
                                                processType:
                                                    ProcessType.congestion,
                                              ),
                                            ),
                                    style: ElevatedButton.styleFrom(
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                      padding: EdgeInsets.zero,
                                      textStyle: AppStyle.subTitle14Medium,
                                    ),
                                    child: isLoading
                                        ? const DotsLoadingIndicator()
                                        : const Text('혼잡도 알려주기'),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        loadAsset(
                          AppImage.characterQuestionS,
                          width: 40,
                          height: 40,
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
                      ],
                    ),
                  ),
                );
              }
              return SizedBox(
                height: 280,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 20,
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: InkWell(
                          onTap: () => CongestionPossibleDialog.show(context),
                          child: const Text(
                            '혼잡도',
                            style: AppStyle.subTitle17SemiBold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      loadAsset(
                        AppImage.characterQuestionS,
                        width: 40,
                        height: 40,
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
                        child: BlocBuilder<CongestionBloc, CongestionState>(
                          buildWhen: (pre, next) =>
                              pre is CongestionLoading ||
                              next is CongestionLoading,
                          builder: (context, state) {
                            bool isLoading = false;

                            if (state is CongestionLoading) {
                              isLoading = true;
                            }
                            return ElevatedButton(
                              onPressed: isLoading
                                  ? null
                                  : () => context
                                      .read<LocationPermissionBloc>()
                                      .add(
                                        const LocationPermissionRequest(
                                          processType: ProcessType.congestion,
                                        ),
                                      ),
                              style: ElevatedButton.styleFrom(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                padding: EdgeInsets.zero,
                                textStyle: AppStyle.subTitle14Medium,
                              ),
                              child: isLoading
                                  ? const DotsLoadingIndicator()
                                  : const Text('혼잡도 알려주기'),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            return CongestionListView(
              congestionList: state.congestionResponse.congestionList,
              day: state.day,
            );
          }
          return const CustomCircleLoadingIndicator();
        },
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
