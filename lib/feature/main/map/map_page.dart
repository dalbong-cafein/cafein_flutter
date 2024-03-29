import 'dart:async';
import 'dart:io';

import 'package:cafein_flutter/cafein_const.dart';
import 'package:cafein_flutter/data/model/enum/map_filter_keyword.dart';
import 'package:cafein_flutter/feature/main/bloc/location_permission_bloc.dart';
import 'package:cafein_flutter/feature/main/bloc/main_bloc.dart';
import 'package:cafein_flutter/feature/main/main_bottom_navigation_bar.dart';
import 'package:cafein_flutter/feature/main/map/bloc/map_bloc.dart';
import 'package:cafein_flutter/feature/main/map/search_page.dart';
import 'package:cafein_flutter/feature/main/map/widget/map/map_body_header.dart';
import 'package:cafein_flutter/feature/main/map/widget/map/map_keyword_tab.dart';
import 'package:cafein_flutter/feature/main/map/widget/map/map_store_card.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/get_marker_icon.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:cafein_flutter/widget/dialog/bottom_toast_dialog.dart';
import 'package:cafein_flutter/widget/dialog/error_dialog.dart';
import 'package:cafein_flutter/widget/dialog/permission_dialog.dart';
import 'package:cafein_flutter/widget/indicator/custom_circle_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
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

  late final imageWidth =
      (MediaQuery.of(context).size.width - 40 - 24 - 18) / 4;

  late final columnHeight = imageWidth + 100 + 50 + 28;

  bool isTapped = false;

  @override
  void initState() {
    super.initState();
    final locationBloc = context.read<LocationPermissionBloc>();
    final mapBloc = context.read<MapBloc>();

    if (locationBloc.state == const LocationPermissionInitial()) {
      Future.microtask(
        () => locationBloc.add(const LocationPermissionRequest(
          processType: ProcessType.searchRequest,
        )),
      );
    } else {
      final state = locationBloc.state as LocationPermissionChecked;

      if (state.permissionStatus.isGranted) {
        mapBloc.add(const MapLocationRequested());
      } else {
        mapBloc.add(const MapStoreRequested(
          location: CafeinConst.defaultLocation,
        ));
      }
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              final currentLatLng = LatLng(state.latitude, state.longitude);

              await moveCurrentCamera(currentLatLng, bloc: bloc);
              await updateCurrentLocation(currentLatLng);

              if (!state.isInitialChecked) {
                return;
              }
            } else if (state is MapStoreLoaded) {
              markers.clear();
              markers.addAll(List.generate(
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
                    isSingle: state.focusedIndex == null
                        ? state.stores.length == 1
                        : (index == state.focusedIndex ? true : false),
                  ),
                  onMarkerTab: (marker, iconSize) async {
                    if (marker?.position == null) {
                      return;
                    }

                    final focusIndex = state.stores.indexWhere(
                      (store) => '${store.storeId}' == marker!.markerId,
                    );

                    bloc.add(MapFocusChanged(focusedIndex: focusIndex));
                  },
                ),
              ));

              if (state.stores.isNotEmpty && state.focusedIndex != null) {
                final marker = markers[state.focusedIndex!];

                // 마커 눌렀을 때 맵 이동
                await moveCurrentCamera(marker.position!);

                isTapped = true;

                // 카드 페이지 이동
                if (state.isMoveCamera) {
                  await moveToCurrentStoreCard(state.focusedIndex!);
                }

                isTapped = false;
              }

              // 검색 후 첫번째 결과로 카메라 이동
              if (state.focusedIndex == null &&
                  state.stores.isNotEmpty &&
                  state.keyword.isNotEmpty) {
                moveCurrentCamera(
                  LatLng(
                    state.stores.first.latY,
                    state.stores.first.lngX,
                  ),
                );
              }

              if (state.isGoingToFirst) {
                pageController.jumpToPage(0);
              }

              setState(() {});

              if (state.isHeart != null) {
                // ignore: use_build_context_synchronously
                BottomToastDialog.show(context, isHeart: state.isHeart!);
              }

              if (state.storeId != null) {
                final index = markers.indexWhere(
                    (element) => element.markerId == '${state.storeId}');

                bloc.add(MapStoreDetailCallbackRequested(index: index));
              }
            } else if (state is MapStoreDetailCallbackChecked) {
              Future.delayed(
                const Duration(milliseconds: 200),
                () => pageController.jumpToPage(state.index),
              );
            }
          },
        ),
        BlocListener<LocationPermissionBloc, LocationPermissionState>(
          listener: (context, state) async {
            final bloc = context.read<MapBloc>();

            if (state is! LocationPermissionChecked) {
              return;
            }

            if ((state.processType == ProcessType.currentLocation ||
                    state.processType == ProcessType.searchRequest ||
                    state.processType == ProcessType.mapFilter) &&
                !state.permissionStatus.isGranted) {
              final result = await PermissionDialog.show(context);

              if (!result) {
                bloc.add(const MapStoreRequested(
                  location: CafeinConst.defaultLocation,
                ));

                return;
              }

              openAppSettings();
            }

            switch (state.processType) {
              case ProcessType.searchRequest:
                bloc.add(const MapLocationRequested());

                break;
              case ProcessType.currentLocation:
                bloc.add(const MapCurrentLocationRequested());

                break;

              case ProcessType.mapFilter:
                bloc.add(const MapKeywordTaped(
                  searchKeyword: MapFilterKeyword.close,
                ));

                break;
              default:
                return;
            }
          },
        ),
        BlocListener<MainBloc, MainState>(
          listenWhen: (pre, next) => next is MainNavigationSelected,
          listener: (context, state) {
            final bloc = context.read<MapBloc>();

            if (state is MainNavigationSelected && state.index == 1) {
              bloc.add(const MapKeywordTaped(
                searchKeyword: MapFilterKeyword.none,
              ));
            }
          },
        ),
      ],
      child: Scaffold(
        bottomNavigationBar: const MainBottomNavigationBar(),
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 56,
          titleSpacing: 0,
          automaticallyImplyLeading: false,
          title: InkWell(
            onTap: () async {
              final bloc = context.read<MapBloc>();
              final navigator = Navigator.of(context);
              final controller = await naverMapController.future;
              final cameraPosition = await controller.getCameraPosition();
              final centerLatLng = cameraPosition.target;

              final result = await navigator.pushNamed(
                SearchPage.routeName,
                arguments: centerLatLng,
              );

              if (result == null) {
                return;
              }

              final searchResultData = result as SearchPageResult;

              bloc.add(MapSearchResultChanged(
                storeList: searchResultData.storeList,
                keyword: searchResultData.keyword,
              ));
            },
            child: Container(
              margin:
                  const EdgeInsets.only(left: 16, right: 16, bottom: 6, top: 6),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 44,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColor.grey50,
              ),
              child: BlocBuilder<MapBloc, MapState>(
                buildWhen: (pre, next) => next is MapStoreLoaded,
                builder: (context, state) {
                  if (state is MapStoreLoaded && state.keyword.isNotEmpty) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        loadAsset(AppIcon.search, color: AppColor.grey700),
                        const SizedBox(width: 8),
                        Text(
                          state.keyword,
                          style: AppStyle.body15Regular,
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () => context.read<MapBloc>().add(
                                const MapSearchKeywordDeleteRequested(),
                              ),
                          child: loadAsset(AppIcon.circleDeleteGrey),
                        ),
                      ],
                    );
                  }

                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      loadAsset(AppIcon.search, color: AppColor.grey700),
                      const SizedBox(width: 8),
                      Text(
                        '대학교, 지하철, 지역, 카페 이름 등으로 검색',
                        style: AppStyle.body15Regular.copyWith(
                          color: AppColor.grey500,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            const SearchKeywordTab(),
            Expanded(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  NaverMap(
                    onMapCreated: onMapCreated,
                    initialCameraPosition: const CameraPosition(
                      target: CafeinConst.defaultLating,
                    ),
                    markers: markers,
                    onCameraChange: (latLng, reason, isAnimated) async {
                      final bloc = context.read<MapBloc>();

                      if (isAnimated == true && latLng != null) {
                        final controller = await naverMapController.future;
                        final cameraPosition =
                            await controller.getCameraPosition();

                        final centerLatLng = cameraPosition.target;

                        final visibleRegion =
                            await controller.getVisibleRegion();

                        bloc.add(
                          MapCameraPositionChanged(
                            latLngBounds: visibleRegion,
                            centerLatLng: centerLatLng,
                          ),
                        );
                      }
                    },
                  ),
                  BlocBuilder<MapBloc, MapState>(
                    buildWhen: (pre, next) =>
                        pre is MapStoreLoading ||
                        next is MapStoreLoading ||
                        next is MapStoreLoaded,
                    builder: (context, state) {
                      if (state is! MapStoreLoaded) {
                        return const CustomCircleLoadingIndicator();
                      }

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
                        height: columnHeight,
                        width: double.infinity,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SearchBodyHeader(
                              isCardView: true,
                              isEmpty: false,
                            ),
                            const SizedBox(height: 16),
                            Expanded(
                              child: PageView.builder(
                                controller: pageController,
                                itemBuilder: (context, index) =>
                                    SearchStoreCard(
                                  store: state.stores[index],
                                  index: index,
                                  imageWidth: imageWidth,
                                ),
                                onPageChanged: (index) {
                                  if (isTapped) {
                                    return;
                                  }

                                  context.read<MapBloc>().add(
                                      MapFocusChanged(focusedIndex: index));
                                },
                                itemCount: state.stores.length,
                              ),
                            ),
                            const SizedBox(height: 12),
                          ],
                        ),
                      );
                    },
                  ),
                  BlocBuilder<MapBloc, MapState>(
                    buildWhen: (pre, next) =>
                        next is MapCameraPositionChecked ||
                        next is MapStoreLoaded,
                    builder: (context, state) {
                      if (state is! MapCameraPositionChecked) {
                        return const SizedBox.shrink();
                      }

                      return Positioned(
                        top: 12,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: InkWell(
                            onTap: () => context.read<MapBloc>().add(
                                  MapStoreRequested(
                                    latLngBounds: state.latLngBounds,
                                    centerLatLng: state.centerLatLng,
                                  ),
                                ),
                            child: Container(
                              width: 144,
                              height: 36,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                color: AppColor.orange500,
                              ),
                              child: Center(
                                child: Text(
                                  '이 지역에서 재검색',
                                  style: AppStyle.subTitle15Medium.copyWith(
                                    color: AppColor.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
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

  Future<void> moveCurrentCamera(
    LatLng latLng, {
    MapBloc? bloc,
  }) async {
    final controller = await naverMapController.future;

    if (Platform.isAndroid) {
      await controller.moveCamera(
        CameraUpdate.toCameraPosition(CameraPosition(target: latLng)),
      );
    } else if (Platform.isIOS) {
      await controller.moveCamera(CameraUpdate.scrollTo(latLng));
    }

    final visibleRegion = await controller.getVisibleRegion();

    if (bloc != null) {
      bloc.add(MapStoreRequested(latLngBounds: visibleRegion));
    }
  }

  Future<void> updateCurrentLocation(LatLng latLng) async {
    final controller = await naverMapController.future;

    controller.locationOverlay = LocationOverlay(
      controller,
    );
    await controller.locationOverlay!.setPosition(latLng);
  }

  Future<void> moveToCurrentStoreCard(int moveIndex) async =>
      pageController.jumpToPage(moveIndex);
}
