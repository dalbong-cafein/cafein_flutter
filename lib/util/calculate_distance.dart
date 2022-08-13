import 'dart:math';

import 'package:naver_map_plugin/naver_map_plugin.dart';

int calculateDistance({
  required LatLng currentLatLng,
  required LatLng targetLatLng,
}) {
  final x = pow(
    currentLatLng.latitude - targetLatLng.latitude,
    2,
  );

  final y = pow(
    currentLatLng.longitude - targetLatLng.longitude,
    2,
  );

  final distance = sqrt(x + y);

  return (distance * 1000).round();
}
