import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/cupertino.dart';

class SearchPopularWordTab extends StatelessWidget {
  const SearchPopularWordTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            "인기 검색어",
            style: AppStyle.subTitle17SemiBold,
          ),
          const SizedBox(
            height: 16,
          ),
          searchWordItem("안녕"),
        ],
      ),
    );
  }

  Widget searchWordItem(String word) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: AppColor.grey200),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 16),
        child: Text(
          word,
          style: AppStyle.body15Regular,
        ),
      ),
    );
  }
}
