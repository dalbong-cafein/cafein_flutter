import 'package:naver_map_plugin/naver_map_plugin.dart';

extension MarkerCopyWith on Marker {
  Marker copyWith({
    void Function(Marker? marker, Map<String, int?> iconSize)? onMarkerTab,
  }) =>
      Marker(
        markerId: markerId,
        position: position,
        infoWindow: infoWindow,
        alpha: alpha,
        flat: flat,
        onMarkerTab: onMarkerTab,
        icon: icon,
        captionText: captionText,
        captionTextSize: captionTextSize,
        captionColor: captionColor,
        captionHaloColor: captionHaloColor,
        width: width,
        height: height,
        maxZoom: maxZoom,
        minZoom: minZoom,
        angle: angle,
        anchor: anchor,
        captionRequestedWidth: captionRequestedWidth,
        captionMaxZoom: captionMaxZoom,
        captionMinZoom: captionMinZoom,
        captionOffset: captionOffset,
        captionPerspectiveEnabled: captionPerspectiveEnabled,
        zIndex: zIndex,
        globalZIndex: globalZIndex,
        iconTintColor: iconTintColor,
        subCaptionText: subCaptionText,
        subCaptionTextSize: subCaptionTextSize,
        subCaptionColor: subCaptionColor,
        subCaptionHaloColor: subCaptionHaloColor,
        subCaptionRequestedWidth: subCaptionRequestedWidth,
      );
}
