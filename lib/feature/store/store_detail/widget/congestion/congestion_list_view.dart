part of '../store_congestion_card.dart';

class CongestionListView extends StatefulWidget {
  const CongestionListView({
    Key? key,
    required this.congestionList,
    required this.day,
  }) : super(key: key);

  final List<Congestion> congestionList;
  final String day;

  @override
  State<CongestionListView> createState() => _CongestionListViewState();
}

class _CongestionListViewState extends State<CongestionListView> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: isExpanded ? 280 + (widget.congestionList.length - 2) * 56 : 280,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 20,
      ),
      child: Column(
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
                    final result = await StoreCongestionBottomSheet.show(
                      context,
                      selectedDay: widget.day,
                    );

                    if (result.isEmpty) {
                      return;
                    }

                    if (result == widget.day) {
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
                        widget.day,
                        style: AppStyle.subTitle14Medium,
                      ),
                      const SizedBox(width: 4),
                      loadAsset(AppIcon.downXS),
                    ],
                  ),
                ),
              ),
              BlocBuilder<CongestionBloc, CongestionState>(
                buildWhen: (pre, next) =>
                    pre is CongestionLoading || next is CongestionLoading,
                builder: (context, state) {
                  bool isLoading = false;

                  if (state is CongestionLoading) {
                    isLoading = true;
                  }
                  return SizedBox(
                    height: 36,
                    width: 116,
                    child: ElevatedButton(
                      onPressed: isLoading
                          ? null
                          : () async {
                              final bloc =
                                  context.read<LocationPermissionBloc>();
                              final navigator = Navigator.of(context);
                              final isPreview =
                                  context.read<AuthCubit>().state ==
                                      const AuthPreviewed();

                              if (isPreview) {
                                final result = await LoginDialog.show(context);

                                if (!result) {
                                  return;
                                }

                                return navigator.popUntil(
                                    ModalRoute.withName(LoginPage.routeName));
                              }

                              bloc.add(const LocationPermissionRequest(
                                processType: ProcessType.congestion,
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
                      child: isLoading
                          ? const DotsLoadingIndicator()
                          : const Text('혼잡도 알려주기'),
                    ),
                  );
                },
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 12),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.congestionList.length >= 2
                  ? (isExpanded ? widget.congestionList.length + 1 : 3)
                  : widget.congestionList.length,
              itemBuilder: (context, index) {
                if (isExpanded) {
                  if (index == widget.congestionList.length) {
                    return InkWell(
                      onTap: () => setState(() => isExpanded = !isExpanded),
                      child: Container(
                        height: 48,
                        margin: const EdgeInsets.only(top: 12),
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: AppColor.grey100,
                            ),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            '접기',
                            style: AppStyle.body14Regular,
                          ),
                        ),
                      ),
                    );
                  }
                  return _CongestionCard(
                    congestion: widget.congestionList[index],
                    index: index,
                  );
                } else {
                  if (widget.congestionList.length >= 2 && index == 2) {
                    return InkWell(
                      onTap: () => setState(() => isExpanded = !isExpanded),
                      child: Container(
                        height: 48,
                        margin: const EdgeInsets.only(top: 12),
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: AppColor.grey100,
                            ),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '혼잡도 ${widget.congestionList.length - 2}건 더보기',
                            style: AppStyle.body14Regular,
                          ),
                        ),
                      ),
                    );
                  }

                  return _CongestionCard(
                    congestion: widget.congestionList[index],
                    index: index,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _CongestionCard extends StatelessWidget {
  const _CongestionCard({
    Key? key,
    required this.congestion,
    required this.index,
  }) : super(key: key);

  final int index;
  final Congestion congestion;

  Color getBackgroundColor() {
    if (congestion.congestionScore <= 1.5) {
      return AppColor.green50;
    } else if (congestion.congestionScore <= 2.5) {
      return AppColor.amber50;
    } else {
      return AppColor.scarlet50;
    }
  }

  Color getForegroundColor() {
    if (congestion.congestionScore <= 1.5) {
      return AppColor.green500;
    } else if (congestion.congestionScore <= 2.5) {
      return AppColor.amber500;
    } else {
      return AppColor.scarlet500;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isRecent = DateTime.now()
            .difference(DateTime.parse(congestion.registeredDateTime))
            .inHours <
        2;

    return SizedBox(
      height: 56,
      child: Row(
        children: [
          CircleAvatar(
            radius: isRecent ? 24 : 20,
            backgroundColor: isRecent ? getBackgroundColor() : AppColor.grey50,
            foregroundColor: isRecent ? getForegroundColor() : AppColor.grey500,
            child: Center(
              child: Text(
                getCongestionTitle(congestion.congestionScore),
                style: isRecent
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
                  '${congestion.nicknameOfWriter}의 제보',
                  style: AppStyle.subTitle15Medium,
                ),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      congestion.registeredDateTime.textTime,
                      style: AppStyle.caption12Regular.copyWith(
                        color: AppColor.grey600,
                      ),
                    ),
                    if (index == 0)
                      Text(
                        ' · 가장 최근에 공유했어요',
                        style: AppStyle.caption12Regular.copyWith(
                          color: AppColor.orange500,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
