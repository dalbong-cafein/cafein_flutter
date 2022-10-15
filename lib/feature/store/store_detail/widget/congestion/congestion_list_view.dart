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
              SizedBox(
                height: 36,
                width: 116,
                child: ElevatedButton(
                  onPressed: () => context.read<LocationPermissionBloc>().add(
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
                  child: const Text('혼잡도 알려주기'),
                ),
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
                  );
                } else {
                  if (widget.congestionList.length >= 3 && index == 2) {
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
  }) : super(key: key);

  final Congestion congestion;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: AppColor.green50,
            foregroundColor: AppColor.green500,
            child: Center(
              child: Text(
                getCongestionTitle(congestion.congestionScore),
                style: AppStyle.subTitle15Medium,
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
                Text(
                  ymdDotFormatShort(congestion.registeredDateTime),
                  style: AppStyle.caption12Regular.copyWith(
                    color: AppColor.grey600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
