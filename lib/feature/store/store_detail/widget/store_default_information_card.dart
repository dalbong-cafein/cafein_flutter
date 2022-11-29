import 'package:cafein_flutter/cafein_config.dart';
import 'package:cafein_flutter/cafein_const.dart';
import 'package:cafein_flutter/data/model/store/business_info.dart';
import 'package:cafein_flutter/data/model/store/store_detail.dart';
import 'package:cafein_flutter/data/model/store/total_business_info.dart';
import 'package:cafein_flutter/feature/main/more_view/faq/widget/custom_expansion_tile.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/datetime/am_pm_format.dart';
import 'package:cafein_flutter/util/datetime/ymd_dot_format.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';
import 'package:url_launcher/url_launcher.dart';

class StoreDefaultInformationCard extends StatelessWidget {
  const StoreDefaultInformationCard({
    super.key,
    required this.storeDetail,
  });

  final StoreDetail storeDetail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '기본 정보',
            style: AppStyle.subTitle17SemiBold,
          ),
          const SizedBox(height: 16),
          Container(
            height: 110,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              border: Border.fromBorderSide(
                BorderSide(
                  width: 1,
                  color: AppColor.black.withOpacity(0.05),
                ),
              ),
            ),
            child: NaverMap(
              contentPadding: EdgeInsets.zero,
              scrollGestureEnable: false,
              zoomGestureEnable: false,
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  storeDetail.latY,
                  storeDetail.lngX,
                ),
              ),
              markers: [
                Marker(
                  markerId: '${storeDetail.storeId}',
                  position: LatLng(
                    storeDetail.latY,
                    storeDetail.lngX,
                  ),
                  icon: AppMarkers.orangeMarker,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _BusinessHoursCard(
            businessInfo: storeDetail.businessInfo,
            totalBusinessInfo: storeDetail.totalBusinessInfo,
          ),
          if (storeDetail.phone != null && storeDetail.phone!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: InkWell(
                onTap: () => launchUrl(
                  Uri.parse('tel:${storeDetail.phone!.replaceAll('-', '')}'),
                ),
                child: Row(
                  children: [
                    loadAsset(
                      AppIcon.call,
                      color: AppColor.grey400,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      storeDetail.phone ?? '',
                      style: AppStyle.body14Regular.copyWith(
                        color: AppColor.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          if (storeDetail.website != null && storeDetail.website!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: InkWell(
                onTap: () => launchUrl(Uri.parse(storeDetail.website!)),
                child: Row(
                  children: [
                    loadAsset(
                      AppIcon.world,
                      color: AppColor.grey400,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      storeDetail.website ?? '',
                      style: AppStyle.body14Regular,
                    ),
                  ],
                ),
              ),
            ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            margin: const EdgeInsets.only(top: 16),
            height: 1,
            color: AppColor.grey50,
          ),
          const SizedBox(height: 20),
          Text(
            '마지막 수정일 ${ymdDotFormat(storeDetail.modDateTime)}',
            style: AppStyle.caption11Regular.copyWith(
              color: AppColor.grey500,
            ),
          ),
        ],
      ),
    );
  }
}

class _BusinessHoursCard extends StatefulWidget {
  const _BusinessHoursCard({
    Key? key,
    required this.businessInfo,
    required this.totalBusinessInfo,
  }) : super(key: key);

  final BusinessInfo businessInfo;
  final TotalBusinessInfo? totalBusinessInfo;

  @override
  State<_BusinessHoursCard> createState() => _BusinessHoursCardState();
}

class _BusinessHoursCardState extends State<_BusinessHoursCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return CustomExpansionTile(
      tilePadding: EdgeInsets.zero,
      trailing: const SizedBox.shrink(),
      title: Row(
        children: [
          loadAsset(
            AppIcon.clock,
            color: AppColor.grey400,
          ),
          const SizedBox(width: 8),
          Text(
            (widget.businessInfo.isOpen) ? '영업 중' : '영업 종료',
            style: (widget.businessInfo.isOpen)
                ? AppStyle.subTitle14Medium.copyWith(
                    color: AppColor.orange500,
                  )
                : AppStyle.subTitle14Medium.copyWith(
                    color: AppColor.grey500,
                  ),
          ),
          const SizedBox(width: 4),
          if (widget.businessInfo.closed != null)
            Text(
              '${amPmFormat(widget.businessInfo.closed!)}에 영업 종료',
              style: AppStyle.body14Regular,
            ),
          AnimatedRotation(
            turns: isExpanded ? 0.5 : 0,
            duration: const Duration(milliseconds: 200),
            child: loadAsset(
              AppIcon.downXS,
              width: 20,
              color: AppColor.grey400,
            ),
          ),
        ],
      ),
      onExpansionChanged: (value) => setState(() => isExpanded = !isExpanded),
      childrenPadding: const EdgeInsets.only(
        left: 28,
      ),
      children: widget.totalBusinessInfo != null
          ? [
              _BusinessHourRow(
                businessInfo: widget.totalBusinessInfo?.onMonday,
                dayTitle: CafeinConst.krDays[0],
              ),
              _BusinessHourRow(
                businessInfo: widget.totalBusinessInfo?.onTuesday,
                dayTitle: CafeinConst.krDays[1],
              ),
              _BusinessHourRow(
                businessInfo: widget.totalBusinessInfo?.onWednesday,
                dayTitle: CafeinConst.krDays[2],
              ),
              _BusinessHourRow(
                businessInfo: widget.totalBusinessInfo?.onThursday,
                dayTitle: CafeinConst.krDays[3],
              ),
              _BusinessHourRow(
                businessInfo: widget.totalBusinessInfo?.onFriday,
                dayTitle: CafeinConst.krDays[4],
              ),
              _BusinessHourRow(
                businessInfo: widget.totalBusinessInfo?.onSaturday,
                dayTitle: CafeinConst.krDays[5],
              ),
              _BusinessHourRow(
                businessInfo: widget.totalBusinessInfo?.onSunday,
                dayTitle: CafeinConst.krDays[6],
              ),
            ]
          : [],
    );
  }
}

class _BusinessHourRow extends StatelessWidget {
  const _BusinessHourRow({
    Key? key,
    required this.businessInfo,
    required this.dayTitle,
  }) : super(key: key);

  final String dayTitle;
  final BusinessInfo? businessInfo;

  @override
  Widget build(BuildContext context) {
    final todayTitle = '${DateFormat.E('ko_KR').format(
      DateTime.now(),
    )}요일';

    if (businessInfo == null) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Row(
        children: [
          Text(
            dayTitle,
            style: AppStyle.body14Regular.copyWith(
              color: todayTitle == dayTitle
                  ? AppColor.orange500
                  : AppColor.grey500,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            '${businessInfo!.nextOpen} ~ ${businessInfo!.closed}',
            style: AppStyle.body14Regular.copyWith(
              color: todayTitle == dayTitle ? AppColor.orange500 : null,
            ),
          ),
        ],
      ),
    );
  }
}
