import 'package:cafein_flutter/cafein_config.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

OverlayImage getMarkerIcon({
  required double? confuseScore,
  required bool isLike,
  required bool isSingle,
}) {
  late OverlayImage icon;

  if (confuseScore == null) {
    icon = isSingle
        ? CafeinConfig.markerSingleNone
        : (isLike
            ? CafeinConfig.markerLikeNoneIcon
            : CafeinConfig.markerNoneIcon);
  } else if (confuseScore <= 1.5) {
    icon = isSingle
        ? CafeinConfig.markerSingleBad
        : (isLike
            ? CafeinConfig.markerLikeGoodIcon
            : CafeinConfig.markerGoodIcon);
  } else if (confuseScore <= 2.5) {
    icon = isSingle
        ? CafeinConfig.markerSingleNormal
        : (isLike
            ? CafeinConfig.markerLikeNormalIcon
            : CafeinConfig.markerNormalIcon);
  } else {
    icon = isSingle
        ? CafeinConfig.markerSingleGood
        : (isLike
            ? CafeinConfig.markerLikeBadIcon
            : CafeinConfig.markerBadIcon);
  }

  return icon;
}
