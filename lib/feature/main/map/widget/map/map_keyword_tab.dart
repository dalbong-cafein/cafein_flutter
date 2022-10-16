import 'package:cafein_flutter/data/model/enum/search_keyword.dart';
import 'package:cafein_flutter/feature/main/bloc/location_permission_bloc.dart';
import 'package:cafein_flutter/feature/main/map/bloc/map_bloc.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

class SearchKeywordTab extends StatelessWidget {
  const SearchKeywordTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: MediaQuery.of(context).size.width,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            if (index == 2) {
              final state = context.read<LocationPermissionBloc>().state;
              if (state is! LocationPermissionChecked) {
                return;
              }
              if (!state.permissionStatus.isGranted) {
                return;
              }
            }

            context.read<MapBloc>().add(
                  MapKeywordTaped(
                    searchKeyword: SearchKeyword.values[index],
                  ),
                );
          },
          child: Container(
            height: 30,
            width: 25 + 12.0 * SearchKeyword.values[index].title.length,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: AppColor.grey200,
              ),
            ),
            child: Center(
              child: Text(
                SearchKeyword.values[index].title,
                style: AppStyle.body14Regular,
              ),
            ),
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(
          width: 8,
        ),
        itemCount: SearchKeyword.values.length,
      ),
    );
  }
}
