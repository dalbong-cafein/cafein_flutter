import 'package:cafein_flutter/cafein_const.dart';
import 'package:cafein_flutter/data/model/common/image_id_pair.dart';
import 'package:cafein_flutter/data/model/store/store.dart';
import 'package:cafein_flutter/feature/main/cubit/auth_cubit.dart';
import 'package:cafein_flutter/feature/main/map/bloc/map_bloc.dart';
import 'package:cafein_flutter/feature/store/store_detail/store_detail_page.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/calculate_distance.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:cafein_flutter/widget/card/custom_cached_network_image.dart';
import 'package:cafein_flutter/widget/chip/confuse_chip.dart';
import 'package:cafein_flutter/widget/chip/open_close_chip.dart';
import 'package:cafein_flutter/widget/chip/store_additional_information_row.dart';
import 'package:cafein_flutter/widget/dialog/login_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

class SearchStoreCard extends StatelessWidget {
  const SearchStoreCard({
    Key? key,
    required this.store,
    required this.index,
    required this.imageWidth,
  }) : super(key: key);

  final Store store;
  final int index;
  final double imageWidth;

  @override
  Widget build(BuildContext context) {
    final imageList = [...store.imageIdPair ?? []];
    if (imageList.length < 4) {
      final length = 4 - imageList.length;
      for (int i = 0; i < length; i++) {
        imageList.add(
          ImageIdPair(
            imageId: -1,
            imageUrl: CafeinConst.defaultStoreImage,
          ),
        );
      }
    }

    return InkWell(
      onTap: () async {
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        final bloc = context.read<MapBloc>();

        await Navigator.of(context).pushNamed(
          StoreDetailPage.routeName,
          arguments: store.storeId,
        );

        bloc.add(MapStoreRequested(
          location: bloc.currentLocation,
          storeId: store.storeId,
        ));
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.2),
              spreadRadius: 4,
              blurRadius: 12,
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  store.storeName,
                  style: AppStyle.subTitle16SemiBold,
                ),
                InkWell(
                  onTap: () async {
                    final isPreview = context.read<AuthCubit>().state ==
                        const AuthPreviewed();

                    final navigator = Navigator.of(context);

                    final bloc = context.read<MapBloc>();

                    if (isPreview) {
                      final result = await LoginDialog.show(context);

                      if (!result) {
                        return;
                      }

                      return navigator.pop();
                    }

                    bloc.add(MapStoreHeartRequested(
                      isLike: !store.isHeart,
                      index: index,
                    ));
                  },
                  child: store.isHeart
                      ? loadAsset(
                          AppIcon.heartOn,
                          color: AppColor.orange500,
                        )
                      : loadAsset(
                          AppIcon.heartLine,
                          color: AppColor.grey300,
                        ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                OpenCloseChip(
                  isOpen: store.businessInfo?.isOpen ?? false,
                ),
                const SizedBox(width: 4),
                ConfuseChip(
                  confuseScore: store.congestionScoreAvg,
                  height: 18,
                  width: 29,
                  textStyle: AppStyle.caption12Medium,
                ),
              ],
            ),
            const SizedBox(height: 8),
            StoreAdditionalInformationRow(
              textStyle: AppStyle.caption12Regular,
              distance: calculateDistance(
                currentLatLng: context.watch<MapBloc>().currentLatLng,
                targetLatLng: LatLng(store.latY, store.lngX),
              ),
              recommendScore: store.recommendPercent?.toInt() ?? 0,
              likeCount: store.heartCnt,
              iconSize: 16,
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...List.generate(
                    3,
                    (index) => ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8),
                      ),
                      child: CustomCachedNetworkImage(
                        imageUrl: imageList[index].imageUrl,
                        width: imageWidth,
                        height: imageWidth,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: imageWidth,
                    height: imageWidth,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8),
                          ),
                          child: CustomCachedNetworkImage(
                            imageUrl: imageList[3].imageUrl,
                            width: imageWidth,
                            height: imageWidth,
                            fit: BoxFit.cover,
                          ),
                        ),
                        if (imageList.length >= 5)
                          Container(
                            width: imageWidth,
                            height: imageWidth,
                            decoration: BoxDecoration(
                              color: AppColor.black.withOpacity(0.48),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                '+${imageList.length - 4}',
                                style: AppStyle.subTitle15Medium.copyWith(
                                  color: AppColor.white,
                                ),
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
