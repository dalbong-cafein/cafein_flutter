import 'package:cafein_flutter/feature/main/bloc/location_permission_bloc.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBodyHeader extends StatelessWidget {
  const SearchBodyHeader({
    Key? key,
    required this.isCardView,
    required this.isEmpty,
  }) : super(key: key);

  final bool isCardView;
  final bool isEmpty;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            left: 20,
            child: InkWell(
              onTap: () => context.read<LocationPermissionBloc>().add(
                    const LocationPermissionRequest(
                      processType: ProcessType.currentLocation,
                    ),
                  ),
              child: CircleAvatar(
                radius: 25,
                backgroundColor: AppColor.white,
                child: loadAsset(AppIcon.locationArrow),
              ),
            ),
          ),
          if (!isEmpty)
            InkWell(
              onTap: () {},
              child: Container(
                height: 34,
                width: isCardView ? 88 : 101,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColor.white,
                ),
                child: Center(
                  child: Text(
                    isCardView ? '목록 보기' : '카드뷰 보기',
                    style: AppStyle.body15Regular,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
