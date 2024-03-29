import 'package:cafein_flutter/feature/login/login_page.dart';
import 'package:cafein_flutter/feature/main/bloc/location_permission_bloc.dart';
import 'package:cafein_flutter/feature/main/bloc/main_bloc.dart';
import 'package:cafein_flutter/feature/main/cubit/auth_cubit.dart';
import 'package:cafein_flutter/feature/main/home/bloc/home_bloc.dart';
import 'package:cafein_flutter/feature/main/home/widget/request_location_card.dart';
import 'package:cafein_flutter/feature/store/store_detail/store_detail_page.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/calculate_distance.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:cafein_flutter/widget/chip/confuse_chip.dart';
import 'package:cafein_flutter/widget/chip/open_close_chip.dart';
import 'package:cafein_flutter/widget/chip/store_additional_information_row.dart';
import 'package:cafein_flutter/widget/dialog/error_dialog.dart';
import 'package:cafein_flutter/widget/dialog/login_dialog.dart';
import 'package:cafein_flutter/widget/indicator/custom_circle_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:permission_handler/permission_handler.dart';

class RecommendStoresCard extends StatelessWidget {
  const RecommendStoresCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return MultiBlocListener(
      listeners: [
        BlocListener<LocationPermissionBloc, LocationPermissionState>(
          listener: (context, state) {
            if (state is LocationPermissionChecked &&
                state.processType == ProcessType.home) {
              context.read<HomeBloc>().add(
                    HomeRecommendStoreRequested(
                      isGranted: state.permissionStatus.isGranted,
                    ),
                  );
            }
          },
        ),
        BlocListener<MainBloc, MainState>(
          listenWhen: (pre, next) => next is MainNavigationSelected,
          listener: (context, state) {
            if (state is MainNavigationSelected && state.index == 0) {
              context.read<LocationPermissionBloc>().add(
                    const LocationPermissionRequest(
                      processType: ProcessType.home,
                    ),
                  );
            }
          },
        ),
      ],
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is HomeError) {
            ErrorDialog.show(
              context,
              error: state.error,
              refresh: state.event,
            );
          }
        },
        buildWhen: (pre, next) => next is HomeRecommendStoreLoaded,
        builder: (blocContext, state) {
          if (state is HomeRecommendStoreLoaded) {
            if (!state.isGranted) {
              return const RequestLocationCard();
            }

            if (state.recommendStores.isEmpty) {
              return const SizedBox.shrink();
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 16),
                  child: Text(
                    "근처에 있는 카공 카페를 찾아봤어요",
                    style: AppStyle.subTitle17SemiBold.copyWith(height: 1),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, left: 4),
                  child: SizedBox(
                    width: width,
                    height: 172,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (lis3tContext, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              StoreDetailPage.routeName,
                              arguments: state.recommendStores[index].storeId,
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(16),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ...List.generate(
                                          3,
                                          (imageIndex) => Padding(
                                            padding: imageIndex == 1
                                                ? const EdgeInsets.symmetric(
                                                    horizontal: 6,
                                                  )
                                                : const EdgeInsets.only(),
                                            child: SizedBox(
                                              width: 70,
                                              height: 70,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: SizedBox.fromSize(
                                                  size:
                                                      const Size.fromRadius(48),
                                                  child:
                                                      (state.recommendStores[index].imageIdPair ??
                                                                          [])
                                                                      .length -
                                                                  1 <
                                                              imageIndex
                                                          ? loadAsset(
                                                              AppImage.noImage,
                                                              height: 48,
                                                              width: 48)
                                                          : Image.network(
                                                              state
                                                                  .recommendStores[
                                                                      index]
                                                                  .imageIdPair![
                                                                      imageIndex]
                                                                  .imageUrl,
                                                              fit: BoxFit.cover,
                                                            ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      state.recommendStores[index].storeName,
                                      style: AppStyle.subTitle15Medium
                                          .copyWith(height: 1),
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 150,
                                          child: Row(
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      OpenCloseChip(
                                                        isOpen: state
                                                                .recommendStores[
                                                                    index]
                                                                .businessInfo
                                                                ?.isOpen ??
                                                            false,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          left: 4,
                                                        ),
                                                        child: ConfuseChip(
                                                          confuseScore: state
                                                              .recommendStores[
                                                                  index]
                                                              .congestionScoreAvg,
                                                          height: 18,
                                                          textStyle: AppStyle
                                                              .caption12Medium
                                                              .copyWith(
                                                                  height: 1),
                                                          width: 29,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  StoreAdditionalInformationRow(
                                                    textStyle: AppStyle
                                                        .caption12Regular
                                                        .copyWith(height: 1),
                                                    distance: calculateDistance(
                                                      currentLatLng: context.watch<HomeBloc>().currentLatLng,
                                                      targetLatLng: LatLng(state.recommendStores[index].latY, state.recommendStores[index].lngX),
                                                    ),
                                                    recommendScore: state
                                                            .recommendStores[
                                                                index]
                                                            .recommendPercent
                                                            ?.toInt() ??
                                                        0,
                                                    likeCount: state
                                                        .recommendStores[index]
                                                        .heartCnt,
                                                    iconSize: 16,
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 72,
                                          height: 50,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              InkWell(
                                                onTap: () async {
                                                  final bloc =
                                                      context.read<HomeBloc>();
                                                  final navigator =
                                                      Navigator.of(context);
                                                  final isPreview = context
                                                          .read<AuthCubit>()
                                                          .state ==
                                                      const AuthPreviewed();

                                                  if (isPreview) {
                                                    final result =
                                                        await LoginDialog.show(
                                                            context);

                                                    if (!result) {
                                                      return;
                                                    }

                                                    return navigator.popUntil(
                                                        ModalRoute.withName(
                                                            LoginPage
                                                                .routeName));
                                                  }

                                                  bloc.add(
                                                    HomeStoreHeartRequested(
                                                      index: index,
                                                      isLike: !state
                                                          .recommendStores[
                                                              index]
                                                          .isHeart,
                                                    ),
                                                  );
                                                },
                                                child: state
                                                        .recommendStores[index]
                                                        .isHeart
                                                    ? loadAsset(
                                                        AppIcon.heartOn,
                                                      )
                                                    : loadAsset(
                                                        AppIcon.heartLine,
                                                        color: AppColor.grey500,
                                                      ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            );
          }
          return const CustomCircleLoadingIndicator();
        },
      ),
    );
  }
}
