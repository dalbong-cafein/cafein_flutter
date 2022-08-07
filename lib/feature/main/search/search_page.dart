import 'dart:async';

import 'package:cafein_flutter/cafein_const.dart';
import 'package:cafein_flutter/feature/main/main_bottom_navigation_bar.dart';
import 'package:cafein_flutter/feature/main/search/bloc/search_bloc.dart';
import 'package:cafein_flutter/feature/main/search/widget/search_body_header.dart';
import 'package:cafein_flutter/feature/main/search/widget/search_store_card.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/widget/dialog/error_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Completer<NaverMapController> mapController = Completer<NaverMapController>();

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
      listener: (context, state) {
        final bloc = context.read<SearchBloc>();

        if (state is SearchError) {
          ErrorDialog.show(
            context,
            error: state.error,
            refresh: state.event,
          );
        } else if (state is SearchPermissionChecked) {
          if (!state.permissionStatus.isGranted) {
            bloc.add(const SearchStoreRequested(
              location: CafeinConst.defaultLocation,
            ));
            return;
          }

          bloc.add(const SearchLocationRequested());
        } else if (state is SearchLocationChecked) {
          bloc.add(
            SearchStoreRequested(location: state.location),
          );
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
        body: BlocBuilder<SearchBloc, SearchState>(
          buildWhen: (pre, next) => next is SearchViewTypeChecked,
          builder: (context, state) {
            bool isCardView = false;
            if (state is SearchViewTypeChecked) {
              isCardView = state.isCard;
            }
            if (isCardView) {
              return Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  NaverMap(
                    onMapCreated: onMapCreated,
                  ),
                  SizedBox(
                    height: 248,
                    width: width,
                    child: Column(
                      children: [
                        SearchBodyHeader(
                          isCardView: isCardView,
                        ),
                        Expanded(
                          child: PageView.builder(
                            itemBuilder: (context, index) {
                              return Center(
                                child: Text('$index'),
                              );
                            },
                            itemCount: 5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return SlidingUpPanel(
                color: Colors.transparent,
                backdropOpacity: 0,
                backdropColor: Colors.transparent,
                boxShadow: const [],
                backdropEnabled: false,
                panel: Container(
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      SearchBodyHeader(
                        isCardView: isCardView,
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                            color: AppColor.white,
                          ),
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                  top: 12,
                                  bottom: 16,
                                ),
                                height: 3,
                                width: 48,
                                decoration: BoxDecoration(
                                  color: AppColor.grey200,
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
                        ),
                      ),
                    ],
                  ),
                ),
                maxHeight: 700,
                minHeight: MediaQuery.of(context).size.height * 0.35,
                body: BlocBuilder<SearchBloc, SearchState>(
                  buildWhen: (pre, next) => next is SearchStoreLoaded,
                  builder: (context, state) {
                    List<Marker> storeMarkers = [];

                    if (state is SearchStoreLoaded) {
                      storeMarkers = [...state.markers];
                    }

                    return NaverMap(
                      onMapCreated: onMapCreated,
                      markers: storeMarkers,
                    );
                  },
                ),
              );
            }
          },
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
