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
              child: Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                  color: AppColor.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(16, 0, 0, 0),
                      spreadRadius: 12,
                      blurRadius: 12,
                    ),
                  ],
                ),
                child: loadAsset(
                  AppIcon.nearMe,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
