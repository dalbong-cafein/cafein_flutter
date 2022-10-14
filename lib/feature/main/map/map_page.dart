import 'dart:async';
import 'dart:io';

import 'package:cafein_flutter/cafein_const.dart';
import 'package:cafein_flutter/feature/main/bloc/location_permission_bloc.dart';
import 'package:cafein_flutter/feature/main/main_bottom_navigation_bar.dart';
import 'package:cafein_flutter/feature/main/map/bloc/map_bloc.dart';
import 'package:cafein_flutter/feature/main/map/search_page.dart';
import 'package:cafein_flutter/feature/main/map/widget/map/map_body_header.dart';
import 'package:cafein_flutter/feature/main/map/widget/map/map_keyword_tab.dart';
import 'package:cafein_flutter/feature/main/map/widget/map/map_store_card.dart';
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

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<NaverMapController> naverMapController =
      Completer<NaverMapController>();
  final pageController = PageController();

  final markers = <Marker>[];

  @override
  void initState() {
    super.initState();
    if (context.read<LocationPermissionBloc>().state ==
        const LocationPermissionInitial()) {
      Future.microtask(
        () => context.read<LocationPermissionBloc>().add(
              const LocationPermissionRequest(
                processType: ProcessType.searchRequest,
              ),
            ),
      );
    } else {
      final state = context.read<LocationPermissionBloc>().state
          as LocationPermissionChecked;
      final bloc = context.read<MapBloc>();
      if (state.permissionStatus.isGranted) {
        bloc.add(const MapLocationRequested());
      } else {
        bloc.add(const MapStoreRequested(
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
        BlocListener<MapBloc, MapState>(
          listener: (context, state) async {
            final bloc = context.read<MapBloc>();

            if (state is MapError) {
              ErrorDialog.show(
                context,
                error: state.error,
                refresh: state.event,
              );
            } else if (state is MapLocationChecked) {
              final currentLatLng = LatLng(
                state.latitude,
                state.longitude,
              );

              moveCurrentCamera(currentLatLng);
              updateCurrentLocation(currentLatLng);

              bloc.add(
                MapStoreRequested(location: state.location),
              );
            } else if (state is MapStoreLoaded) {
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
            final bloc = context.read<MapBloc>();
            if (state is LocationPermissionChecked &&
                state.processType == ProcessType.searchRequest) {
              if (state.permissionStatus.isGranted) {
                bloc.add(const MapLocationRequested());

                return;
              }

              final result = await PermissionDialog.show(context);
              if (!result) {
                bloc.add(const MapStoreRequested(
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
                  final result = await Navigator.of(context).pushNamed(
                    SearchPage.routeName,
                  );

                  if (result == null) {
                    return;
                  }
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
                      loadAsset(AppIcon.search, color: AppColor.grey700),
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
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            NaverMap(
              onMapCreated: onMapCreated,
              initialCameraPosition: const CameraPosition(
                target: CafeinConst.defaultLating,
              ),
              markers: markers,
            ),
            BlocBuilder<MapBloc, MapState>(
              buildWhen: (pre, next) => next is MapStoreLoaded,
              builder: (context, state) {
                if (state is MapStoreLoaded) {
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
