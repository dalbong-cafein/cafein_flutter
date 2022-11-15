import 'package:cafein_flutter/feature/main/map/bloc/search_bloc.dart';
import 'package:cafein_flutter/feature/main/more_view/notice/notice_detail_page.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchEmptyStoreCard extends StatelessWidget {
  const SearchEmptyStoreCard({
    Key? key,
    required this.keyword,
  }) : super(key: key);

  final String keyword;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final boardId = context.watch<SearchBloc>().boardId;
    final imageUrl = context.watch<SearchBloc>().eventImageUrl;

    return CustomScrollView(
      physics: const NeverScrollableScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              const Spacer(),
              loadAsset(
                AppImage.noCafeQuestion,
                fit: BoxFit.scaleDown,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    keyword,
                    style: AppStyle.subTitle14Medium.copyWith(
                      color: AppColor.orange500,
                    ),
                  ),
                  Text(
                    "의 검색 결과가 없습니다.",
                    style: AppStyle.body14Regular.copyWith(
                      color: AppColor.grey800,
                    ),
                  )
                ],
              ),
              const Spacer(),
              if (boardId != 0)
                SafeArea(
                  child: InkWell(
                    onTap: () => Navigator.of(context).pushNamed(
                      NoticeDetailPage.routeName,
                      arguments: boardId,
                    ),
                    child: SizedBox(
                      height: (width - 32) / 5,
                      width: width - 32,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          imageUrl,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
