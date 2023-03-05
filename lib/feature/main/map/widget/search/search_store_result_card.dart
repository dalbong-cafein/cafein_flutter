import 'package:cafein_flutter/data/model/kakao/kakao_store_response.dart';
import 'package:cafein_flutter/data/model/store/auto_completed_store.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchStoreResultCard extends StatelessWidget {
  const SearchStoreResultCard({
    Key? key,
    required this.keyword,
    required this.store,
  }) : super(key: key);

  final String keyword;
  final AutoCompletedStore store;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 12,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                children: highlightOccurrences(
                  store.storeName,
                  keyword,
                ),
                style: AppStyle.subTitle16Medium.copyWith(
                  color: AppColor.grey800,
                ),
              ),
            ),
            Text(
              store.storeName,
              style: AppStyle.caption13Regular.copyWith(
                color: AppColor.grey600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<TextSpan> highlightOccurrences(
    String source,
    String query,
  ) {
    var matches = <Match>[];
    for (final token in query.trim().toLowerCase().split(' ')) {
      matches.addAll(token.allMatches(source.toLowerCase()));
    }

    if (matches.isEmpty) {
      return [TextSpan(text: source)];
    }
    matches.sort((a, b) => a.start.compareTo(b.start));

    int lastMatchEnd = 0;
    final List<TextSpan> children = [];
    for (final match in matches) {
      if (match.end <= lastMatchEnd) {
        // already matched -> ignore
      } else if (match.start <= lastMatchEnd) {
        children.add(
          TextSpan(
            text: source.substring(lastMatchEnd, match.end),
            style: AppStyle.subTitle16Medium.copyWith(
              color: AppColor.orange500,
            ),
          ),
        );
      } else if (match.start > lastMatchEnd) {
        children.add(
          TextSpan(
            text: source.substring(lastMatchEnd, match.start),
          ),
        );

        children.add(
          TextSpan(
            text: source.substring(match.start, match.end),
            style: AppStyle.subTitle16Medium.copyWith(
              color: AppColor.orange500,
            ),
          ),
        );
      }

      if (lastMatchEnd < match.end) {
        lastMatchEnd = match.end;
      }
    }

    if (lastMatchEnd < source.length) {
      children.add(
        TextSpan(
          text: source.substring(lastMatchEnd, source.length),
        ),
      );
    }

    return children;
  }
}
