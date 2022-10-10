import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/cupertino.dart';

class SearchRealTimeCard extends StatelessWidget {
  const SearchRealTimeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return searchItem("투썸플레이스"," 노원역점", "서울시 노원");
        });
  }

  Widget searchItem(String matchedStoreName, String differentStoreName,
      String storeLocation) {
    return Padding(
      padding: const EdgeInsets.only(left : 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(height: 1.0, width: 1000, color: AppColor.grey100),
          const SizedBox(
            height: 14,
          ),
          Row(
            children: [
              Text(
                matchedStoreName,
                style:
                    AppStyle.subTitle16Medium.copyWith(color: AppColor.orange500),
              ),
              Text(
                differentStoreName,
                style: AppStyle.subTitle16Medium,
              )
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            storeLocation,
            style: AppStyle.caption13Regular.copyWith(color: AppColor.grey600),
          ),
          const SizedBox(
            height: 14,
          ),
        ],
      ),
    );
  }
}
