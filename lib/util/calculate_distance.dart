import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:latlong2/latlong.dart' as lat_lng;

int calculateDistance({
  required LatLng currentLatLng,
  required LatLng targetLatLng,
}) {
  const distance = lat_lng.Distance();
  return distance(
    lat_lng.LatLng(currentLatLng.latitude, currentLatLng.longitude),
    lat_lng.LatLng(targetLatLng.latitude, targetLatLng.longitude),
  ).round();
}
