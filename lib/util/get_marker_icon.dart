import 'package:cafein_flutter/cafein_config.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

OverlayImage getMarkerIcon({
  required double? confuseScore,
  required bool isLike,
  required bool isSingle,
}) {
  late OverlayImage icon;

  if (confuseScore == null) {
    icon = isSingle
        ? (isLike
            ? AppMarkers.markerLikeSingleNone
            : AppMarkers.markerSingleNone)
        : (isLike ? AppMarkers.markerLikeNoneIcon : AppMarkers.markerNoneIcon);
  } else if (confuseScore <= 1.5) {
    icon = isSingle
        ? (isLike
            ? AppMarkers.markerLikeSingleGood
            : AppMarkers.markerSingleGood)
        : (isLike ? AppMarkers.markerLikeGoodIcon : AppMarkers.markerGoodIcon);
  } else if (confuseScore <= 2.5) {
    icon = isSingle
        ? (isLike
            ? AppMarkers.markerLikeSingleNormal
            : AppMarkers.markerSingleNormal)
        : (isLike
            ? AppMarkers.markerLikeNormalIcon
            : AppMarkers.markerNormalIcon);
  } else {
    icon = isSingle
        ? (isLike ? AppMarkers.markerLikeSingleBad : AppMarkers.markerSingleBad)
        : (isLike ? AppMarkers.markerLikeBadIcon : AppMarkers.markerBadIcon);
  }

  return icon;
}
