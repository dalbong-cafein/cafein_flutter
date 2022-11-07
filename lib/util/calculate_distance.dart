import 'package:latlong2/latlong.dart' as lat_lng;
import 'package:naver_map_plugin/naver_map_plugin.dart';

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
