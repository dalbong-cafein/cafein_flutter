import 'dart:async';

import 'package:cafein_flutter/cafein_const.dart';
import 'package:cafein_flutter/feature/main/main_bottom_navigation_bar.dart';
import 'package:cafein_flutter/feature/main/search/bloc/search_bloc.dart';
import 'package:cafein_flutter/feature/main/search/widget/search_body_header.dart';
import 'package:cafein_flutter/feature/main/search/widget/search_store_card.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/widget/dialog/error_dialog.dart';
import 'package:cafein_flutter/widget/dialog/permission_dialog.dart';
import 'package:cafein_flutter/widget/indicator/circle_loading_indicator.dart';
import 'package:flutter/cupertino.dart';
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
  Completer<NaverMapController> mapController = Completer<NaverMapController>();

  final markers = <Marker>[];

  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<SearchBloc>().add(
            const SearchPermissionRequested(),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return BlocListener<SearchBloc, SearchState>(
      listener: (context, state) async {
        final bloc = context.read<SearchBloc>();

        if (state is SearchError) {
          ErrorDialog.show(
            context,
            error: state.error,
            refresh: state.event,
          );
        } else if (state is SearchPermissionChecked) {
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
        } else if (state is SearchLocationChecked) {
          bloc.add(
            SearchStoreRequested(location: state.location),
          );
        } else if (state is SearchStoreLoaded) {
          markers.addAll(state.markers);
          setState(() {});
        }
      },
      child: Scaffold(
        bottomNavigationBar: const MainBottomNavigationBar(),
        appBar: AppBar(
          toolbarHeight: 112,
          title: Column(
            children: [
              InkWell(
                onTap: () async {},
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
            SizedBox(
              height: 248,
              width: width,
              child: Column(
                children: [
                  const SearchBodyHeader(isCardView: true),
                  const SizedBox(height: 16),
                  Expanded(
                    child: BlocBuilder<SearchBloc, SearchState>(
                      buildWhen: (pre, next) => next is SearchStoreLoaded,
                      builder: (context, state) {
                        if (state is SearchStoreLoaded) {
                          return PageView.builder(
                            itemBuilder: (context, index) {
                              return SearchStoreCard(
                                store: state.stores[index],
                                index: index,
                              );
                            },
                            itemCount: state.stores.length,
                          );
                        }
                        return const CircleLoadingIndicator();
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ],
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
