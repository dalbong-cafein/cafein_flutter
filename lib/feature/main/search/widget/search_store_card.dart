import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:flutter/material.dart';

class SearchStorePanelCard extends StatelessWidget {
  const SearchStorePanelCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(
        children: [
          loadAsset(AppImage.passcucci, width: 64, height: 64),
          Expanded(
            child: Column(
              children: [
                Text(
                  '투썸플레이스 합정역점',
                  style: AppStyle.subTitle15Medium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
