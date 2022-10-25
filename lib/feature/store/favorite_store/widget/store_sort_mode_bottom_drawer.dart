import 'package:cafein_flutter/feature/store/favorite_store/bloc/favorite_store_bloc.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreSortModeBottomDrawer extends StatelessWidget {
  final BuildContext bigContext;
  final int sortMode;

  const StoreSortModeBottomDrawer(
      {super.key, required this.bigContext, required this.sortMode});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 170,
      width: width,
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 20, top: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: InkWell(
                onTap: () {
                  bigContext.read<FavoriteStoreBloc>().add(
                        const SortModeChanged(sortMode: 0),
                      );
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    Text(
                      "등록순",
                      style: AppStyle.subTitle15Medium.copyWith(
                          color: sortMode == 0
                              ? AppColor.orange500
                              : AppColor.grey800),
                    ),
                    const Spacer(),
                    sortMode == 0 ? loadAsset(AppIcon.doneOn, width: 24, height: 24): const SizedBox.shrink()
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: InkWell(
                onTap: () {
                  bigContext.read<FavoriteStoreBloc>().add(
                        const SortModeChanged(sortMode: 2),
                      );
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    Text(
                      "혼잡도낮은순",
                      style: AppStyle.subTitle15Medium.copyWith(
                          color: sortMode == 2
                              ? AppColor.orange500
                              : AppColor.grey800),
                    ),
                    const Spacer(),
                    sortMode == 2 ? loadAsset(AppIcon.doneOn, width: 24, height: 24) : const SizedBox.shrink()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
