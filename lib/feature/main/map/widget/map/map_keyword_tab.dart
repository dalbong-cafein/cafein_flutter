import 'package:cafein_flutter/data/model/enum/map_filter_keyword.dart';
import 'package:cafein_flutter/feature/main/bloc/location_permission_bloc.dart';
import 'package:cafein_flutter/feature/main/map/bloc/map_bloc.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchKeywordTab extends StatelessWidget {
  const SearchKeywordTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: Color(0xffefefef),
          ),
        ),
      ),
      padding: const EdgeInsets.only(bottom: 12),
      height: 42,
      width: MediaQuery.of(context).size.width,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            if (index == 2) {
              context
                  .read<LocationPermissionBloc>()
                  .add(const LocationPermissionRequest(
                    processType: ProcessType.mapFilter,
                  ));

              return;
            }

            context.read<MapBloc>().add(
                  MapKeywordTaped(
                    searchKeyword: MapFilterKeyword.values[index],
                  ),
                );
          },
          child: BlocBuilder<MapBloc, MapState>(
            buildWhen: (pre, next) => next is MapFilterKeywordChecked,
            builder: (context, state) {
              String? checkedKeyword;
              if (state is MapFilterKeywordChecked) {
                checkedKeyword = state.filterKeyword.title;
              }

              return Container(
                height: 30,
                width: 25 + 12.0 * MapFilterKeyword.values[index].title.length,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color:
                        checkedKeyword == MapFilterKeyword.values[index].title
                            ? AppColor.orange500
                            : AppColor.grey200,
                  ),
                ),
                child: Center(
                  child: Text(
                    MapFilterKeyword.values[index].title,
                    style: AppStyle.body14Regular.copyWith(
                      color:
                          checkedKeyword == MapFilterKeyword.values[index].title
                              ? AppColor.orange500
                              : null,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(
          width: 6,
        ),
        itemCount: MapFilterKeyword.values.length,
      ),
    );
  }
}
