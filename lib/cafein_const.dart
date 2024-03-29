import 'dart:math';

import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

abstract class CafeinConst {
  static const defaultProfiles = [
    AppImage.profile1,
    AppImage.profile2,
    AppImage.profile3,
  ];
  static const randomStickers = [
    AppIcon.americanoSticker,
    AppIcon.eggSandwichSticker,
    AppIcon.greenDessertSticker,
    AppIcon.latteSticker,
    AppIcon.mintDrinkSticker,
    AppIcon.orangeDessertSticker,
    AppIcon.orangeDrinkSticker,
    AppIcon.pinkDessertSticker,
    AppIcon.pinkDrinkSticker,
    AppIcon.sandwichSticker
  ];

  static late String defaultProfile;

  static const defaultProfileFlag = 'defaultProfile';

  static initConst() {
    defaultProfile = defaultProfiles[Random().nextInt(2)];
  }

  static const defaultLocation = '종로구';
  static const defaultLating = LatLng(
    37.57002838826,
    126.97962084516,
  );

  static final defaultLatLngBounds = LatLngBounds(
    northeast: const LatLng(
      37.57520092751555,
      126.98377648145288,
    ),
    southwest: const LatLng(
      37.56484333622498,
      126.9754079892881,
    ),
  );

  static const defaultStoreImage =
      'https://raw.githubusercontent.com/dalbong-cafein/cafein_flutter/develop/default_store_image.png';

  static const couponStoreImages = [
    AppImage.starbucks,
    AppImage.passcucci,
    AppImage.tomntoms,
    AppImage.twosomeplace,
    AppImage.ediya
  ];

  static const couponStoreIcons = [
    AppIcon.starbucks,
    AppIcon.passcucci,
    AppIcon.tomntoms,
    AppIcon.twosomeplace,
    AppIcon.ediya
  ];

  static const couponStoreNames = ["스타벅스", "파스쿠찌", "탐앤탐스", "투썸플레이스", "이디야"];

  static const couponItemNames = [
    "아이스 카페 아메리카노 T",
    "아이스 아메리카노(R)",
    "아이스 아메리카노 T",
    "아메리카노(R)",
    "카페 아메리카노(ICE)(EXTRA)"
  ];

  static final krDays = [
    '월요일',
    '화요일',
    '수요일',
    '목요일',
    '금요일',
    '토요일',
    '일요일',
  ];

  static final sortModeText = ["등록순", "가까운순", "혼잡도낮은순"];

  static const defaultStoreImageUrl =
      'https://raw.githubusercontent.com/dalbong-cafein/cafein_flutter/develop/default_store_image.png';
}
