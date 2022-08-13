import 'package:cafein_flutter/cafein_config.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

OverlayImage getMarkerIcon({
  required double? confuseScore,
  required bool isLike,
}) {
  late OverlayImage icon;

  if (confuseScore == null) {
    icon = isLike ? CafeinConfig.markerLikeNoneIcon : CafeinConfig.markerNoneIcon;
  } else if (confuseScore <= 1.5) {
    icon = isLike ? CafeinConfig.markerLikeGoodIcon : CafeinConfig.markerGoodIcon;
  } else if (confuseScore <= 2.5) {
    icon = isLike ? CafeinConfig.markerLikeNormalIcon : CafeinConfig.markerNormalIcon;
  } else {
    icon = isLike ? CafeinConfig.markerLikeBadIcon : CafeinConfig.markerBadIcon;
  }

  return icon;
}
