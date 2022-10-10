import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/cupertino.dart';

class SearchPopularWordTab extends StatelessWidget {
  const SearchPopularWordTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        const Padding(
          padding: EdgeInsets.only(left : 16),
          child: Text(
            "인기 검색어",
            style: AppStyle.subTitle17SemiBold,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          height: 100,
          width: 1000,
          child: Padding(
            padding: const EdgeInsets.only(left : 16),
            child: ListView.builder(
              itemCount: 1,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context , int index){
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      searchWordItem("투썸플레이스"),
                      searchWordItem("투썸플레이스"),
                      searchWordItem("투썸플레이스"),
                      searchWordItem("투썸플레이스")
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      searchWordItem("요소1"),
                      searchWordItem("요소1"),
                      searchWordItem("요소1"),
                      searchWordItem("요소1")
                    ],
                  )
                ],
              );
            }),
          ),
        ),


      ],
    );
  }

  Widget searchWordItem(String word) {
    return Padding(
      padding: const EdgeInsets.only(right: 6),
      child: Container(
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
      ),
    );
  }
}
