import 'dart:async';
import 'dart:developer';

import 'package:cafein_flutter/cafein_config.dart';
import 'package:cafein_flutter/feature/main/main_bottom_navigation_bar.dart';
import 'package:cafein_flutter/feature/main/search/widget/search_store_card.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Completer<NaverMapController> mapController = Completer<NaverMapController>();
  final textController = TextEditingController();

  List<Marker> markers = [
    Marker(
      markerId: 'id',
      position: LatLng(37.563600, 126.962370),
      captionText: "커스텀 아이콘",
      captionColor: Colors.indigo,
      captionTextSize: 20.0,
      alpha: 0.8,
      captionOffset: 30,
      anchor: AnchorPoint(0.5, 1),
      width: 45,
      height: 45,
      infoWindow: '인포 윈도우',
    )
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      bottomNavigationBar: const MainBottomNavigationBar(),
      appBar: AppBar(
        toolbarHeight: 112,
        title: Column(
          children: [
            InkWell(
              onTap: () async {
                final result = await Geolocator.getCurrentPosition();
                log('result.latitude: ${result.latitude}');
                log('result.longitude: ${result.longitude}');

                final response = await Dio().get(
                  'https://dapi.kakao.com/v2/local/geo/coord2regioncode.json?x=${result.longitude}&y=${result.latitude}',
                  options: Options(
                    headers: {
                      'Authorization': 'KakaoAK ${CafeinConfig.kakaoRestApiKey}',
                    },
                  ),
                );
                log('${response.data}');
              },
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                height: 44,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColor.grey50,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(CupertinoIcons.search),
                    const SizedBox(width: 8),
                    Text(
                      '카페 이름, 구, 동, 역 등으로 검색',
                      style: AppStyle.body15Regular.copyWith(
                        color: AppColor.grey500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
              width: MediaQuery.of(context).size.width,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  height: 30,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColor.grey200),
                  ),
                  child: Center(
                    child: Text(
                      '영업중 $index',
                      style: AppStyle.body14Regular,
                    ),
                  ),
                ),
                separatorBuilder: (context, index) => const SizedBox(width: 8),
                itemCount: 20,
              ),
            ),
          ],
        ),
      ),
      body: SlidingUpPanel(
        panel: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 12,
                bottom: 16,
              ),
              height: 3,
              width: 48,
              decoration: BoxDecoration(
                color: AppColor.grey400,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => const SearchStorePanelCard(),
                separatorBuilder: (context, index) => Container(
                  height: 1,
                  color: AppColor.grey500,
                ),
                itemCount: 10,
              ),
            ),
          ],
        ),
        maxHeight: 500,
        body: NaverMap(
          onMapCreated: onMapCreated,
          markers: markers,
        ),
      ),
    );
  }

  void onMapCreated(NaverMapController controller) {
    if (mapController.isCompleted) {
      mapController = Completer<NaverMapController>();
    }
    mapController.complete(controller);
  }
}
