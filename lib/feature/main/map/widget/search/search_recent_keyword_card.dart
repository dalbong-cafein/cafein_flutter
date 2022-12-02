import 'package:cafein_flutter/data/model/common/search_data.dart';
import 'package:cafein_flutter/feature/main/map/bloc/search_bloc.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/datetime/text_format.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchRecentKeywordCard extends StatelessWidget {
  const SearchRecentKeywordCard({
    Key? key,
    required this.searchDataList,
    required this.onTap,
  }) : super(key: key);

  final List<SearchData> searchDataList;
  final void Function(String keyword) onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Row(
            children: [
              const Text(
                "최근 검색어",
                style: AppStyle.subTitle14Medium,
              ),
              const Spacer(),
              InkWell(
                onTap: () => context.read<SearchBloc>().add(
                      const SearchRecentKeywordAllDeleted(),
                    ),
                child: Text(
                  "전체 삭제",
                  style: AppStyle.caption13Medium.copyWith(
                    color: AppColor.grey500,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.zero,
            itemCount: searchDataList.length,
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                onTap(searchDataList[index].keyword);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Row(
                  children: [
                    loadAsset(
                      AppIcon.search,
                      color: AppColor.grey600,
                      width: 16,
                      height: 16,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      searchDataList[index].keyword,
                      style: AppStyle.body15Regular,
                    ),
                    const Spacer(),
                    Text(
                      searchDataList[index].dateTime.textTimeMD,
                      style: AppStyle.caption12Regular.copyWith(
                        color: AppColor.grey300,
                      ),
                    ),
                    const SizedBox(width: 16),
                    InkWell(
                      onTap: () => context.read<SearchBloc>().add(
                            SearchRecentKeywordDeleted(index: index),
                          ),
                      child: loadAsset(
                        AppIcon.clear24S,
                        color: AppColor.grey300,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            separatorBuilder: (context, index) => Container(
              height: 1.0,
              color: AppColor.grey100,
            ),
          ),
        )
      ],
    );
  }
}
