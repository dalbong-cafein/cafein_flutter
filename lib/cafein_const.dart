import 'package:cafein_flutter/resource/resource.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

abstract class CafeinConst {
  static const defaultProfiles = [
    AppImage.profile1,
    AppImage.profile2,
    AppImage.profile3,
  ];

  static const defaultLocation = '종로구';
  static const defaultLating = LatLng(
    37.57002838826,
    126.97962084516,
  );

  static const defaultStoreImage =
      'https://raw.githubusercontent.com/dalbong-cafein/cafein_flutter/develop/default_store_image.png';
}
