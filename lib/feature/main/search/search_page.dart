import 'dart:async';
import 'dart:io';

import 'package:cafein_flutter/cafein_const.dart';
import 'package:cafein_flutter/feature/main/bloc/location_permission_bloc.dart';
import 'package:cafein_flutter/feature/main/main_bottom_navigation_bar.dart';
import 'package:cafein_flutter/feature/main/search/bloc/search_bloc.dart';
import 'package:cafein_flutter/feature/main/search/search_keyword_page.dart';
import 'package:cafein_flutter/feature/main/search/widget/search_body_header.dart';
import 'package:cafein_flutter/feature/main/search/widget/search_keyword_tab.dart';
import 'package:cafein_flutter/feature/main/search/widget/search_log_card.dart';
import 'package:cafein_flutter/feature/main/search/widget/search_nolog_card.dart';
import 'package:cafein_flutter/feature/main/search/widget/search_noresult_card.dart';
import 'package:cafein_flutter/feature/main/search/widget/search_real_time_card.dart';
import 'package:cafein_flutter/feature/main/search/widget/search_store_card.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/get_marker_icon.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:cafein_flutter/widget/dialog/error_dialog.dart';
import 'package:cafein_flutter/widget/dialog/permission_dialog.dart';
import 'package:cafein_flutter/widget/indicator/custom_circle_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';
import 'package:permission_handler/permission_handler.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Completer<NaverMapController> naverMapController = Completer<NaverMapController>();
  final pageController = PageController();

  final markers = <Marker>[];

  @override
  void initState() {
    super.initState();
    if (context.read<LocationPermissionBloc>().state == const LocationPermissionInitial()) {
      Future.microtask(
        () => context.read<LocationPermissionBloc>().add(
              const LocationPermissionRequest(),
            ),
      );
    } else {
      final state = context.read<LocationPermissionBloc>().state as LocationPermissionChecked;
      final bloc = context.read<SearchBloc>();
      if (state.permissionStatus.isGranted) {
        bloc.add(const SearchLocationRequested());
      } else {
        bloc.add(const SearchStoreRequested(
          location: CafeinConst.defaultLocation,
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return MultiBlocListener(
      listeners: [
        BlocListener<SearchBloc, SearchState>(
          listener: (context, state) async {
            final bloc = context.read<SearchBloc>();

            if (state is SearchError) {
              ErrorDialog.show(
                context,
                error: state.error,
                refresh: state.event,
              );
            } else if (state is SearchLocationChecked) {
              final currentLatLng = LatLng(
                state.latitude,
                state.longitude,
              );

              moveCurrentCamera(currentLatLng);
              updateCurrentLocation(currentLatLng);

              bloc.add(
                SearchStoreRequested(location: state.location),
              );
            } else if (state is SearchStoreLoaded) {
              markers.clear();
              markers.addAll(
                List.generate(
                  state.stores.length,
                  (index) => Marker(
                    markerId: '${state.stores[index].storeId}',
                    position: LatLng(
                      state.stores[index].latY,
                      state.stores[index].lngX,
                    ),
                    icon: getMarkerIcon(
                      confuseScore: state.stores[index].congestionScoreAvg,
                      isLike: state.stores[index].isHeart,
                    ),
                    onMarkerTab: (marker, iconSize) async {
                      if (marker?.position == null) {
                        return;
                      }

                      // 마커 눌렀을 때 맵 이동
                      moveCurrentCamera(marker!.position!);

                      final moveIndex = state.stores.indexWhere(
                        (store) => '${store.storeId}' == marker.markerId,
                      );

                      if (moveIndex == -1) {
                        return;
                      }

                      // 카드 페이지 이동
                      moveToCurrentStoreCard(moveIndex);
                    },
                  ),
                ),
              );

              setState(() {});
            }
          },
        ),
        BlocListener<LocationPermissionBloc, LocationPermissionState>(
          listener: (context, state) async {
            final bloc = context.read<SearchBloc>();
            if (state is LocationPermissionChecked) {
              if (state.permissionStatus.isGranted) {
                bloc.add(const SearchLocationRequested());

                return;
              }

              final result = await PermissionDialog.show(context);
              if (!result) {
                bloc.add(const SearchStoreRequested(
                  location: CafeinConst.defaultLocation,
                ));
                return;
              }

              openAppSettings();
            }
          },
        ),
      ],
      child: Scaffold(
        bottomNavigationBar: const MainBottomNavigationBar(),
        appBar: AppBar(
          toolbarHeight: 112,
          title: Column(
            children: [
              InkWell(
                onTap: () async {
                  Navigator.of(context).pushNamed(SearchKeywordPage.routeName);
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
                      loadAsset(
                        AppIcon.search,
                        color : AppColor.grey700
                      ),
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
              const SearchKeywordTab(),
            ],
          ),
        ),
        body: true? SearchRealTimeCard() : Stack(
          alignment: Alignment.bottomCenter,
          children: [
            NaverMap(
              onMapCreated: onMapCreated,
              initialCameraPosition: const CameraPosition(
                target: CafeinConst.defaultLating,
              ),
              markers: markers,
            ),
            BlocBuilder<SearchBloc, SearchState>(
              buildWhen: (pre, next) => next is SearchStoreLoaded,
              builder: (context, state) {
                if (state is SearchStoreLoaded) {
                  if (state.stores.isEmpty) {
                    return const Padding(
                      padding: EdgeInsets.only(bottom: 12),
                      child: SearchBodyHeader(
                        isCardView: true,
                        isEmpty: true,
                      ),
                    );
                  }

                  return SizedBox(
                    height: 248,
                    width: width,
                    child: Column(
                      children: [
                        const SearchBodyHeader(
                          isCardView: true,
                          isEmpty: false,
                        ),
                        const SizedBox(height: 16),
                        Expanded(
                          child: PageView.builder(
                            controller: pageController,
                            itemBuilder: (context, index) => SearchStoreCard(
                              store: state.stores[index],
                              index: index,
                            ),
                            itemCount: state.stores.length,
                          ),
                        ),
                        const SizedBox(height: 12),
                      ],
                    ),
                  );
                }
                return const CustomCircleLoadingIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }

  void onMapCreated(NaverMapController controller) {
    if (naverMapController.isCompleted) {
      naverMapController = Completer<NaverMapController>();
    }
    naverMapController.complete(controller);
  }

  Future<void> moveCurrentCamera(LatLng latLng) async {
    final controller = await naverMapController.future;
    if (Platform.isAndroid) {
      controller.moveCamera(
        CameraUpdate.toCameraPosition(
          CameraPosition(
            target: latLng,
          ),
        ),
      );
    } else if (Platform.isIOS) {
      controller.moveCamera(
        CameraUpdate.scrollTo(latLng),
      );
    }
  }

  Future<void> updateCurrentLocation(LatLng latLng) async {
    final controller = await naverMapController.future;
    controller.locationOverlay = LocationOverlay(
      controller,
    );
    controller.locationOverlay!.setPosition(latLng);
  }

  void moveToCurrentStoreCard(int moveIndex) => pageController.animateToPage(
        moveIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.linear,
      );
}
