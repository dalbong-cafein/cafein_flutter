part of 'cafein_config.dart';

abstract class AppMarkers {
  static late final OverlayImage markerBadIcon;
  static late final OverlayImage markerNormalIcon;
  static late final OverlayImage markerGoodIcon;
  static late final OverlayImage markerLikeBadIcon;
  static late final OverlayImage markerLikeNormalIcon;
  static late final OverlayImage markerLikeGoodIcon;
  static late final OverlayImage markerNoneIcon;
  static late final OverlayImage markerLikeNoneIcon;

  static late final OverlayImage markerSingleNone;
  static late final OverlayImage markerSingleBad;
  static late final OverlayImage markerSingleNormal;
  static late final OverlayImage markerSingleGood;

  static late final OverlayImage markerLikeSingleNone;
  static late final OverlayImage markerLikeSingleBad;
  static late final OverlayImage markerLikeSingleNormal;
  static late final OverlayImage markerLikeSingleGood;

  static late final OverlayImage orangeMarker;

  static Future<void> initMarkers() async {
    final devicePixelRatio = Platform.isAndroid
        ? window.devicePixelRatio * 2
        : window.devicePixelRatio;

    markerBadIcon = await OverlayImage.fromAssetImage(
      assetName: AppIcon.markerBad,
      devicePixelRatio: devicePixelRatio,
    );

    markerGoodIcon = await OverlayImage.fromAssetImage(
      assetName: AppIcon.markerGood,
      devicePixelRatio: devicePixelRatio,
    );

    markerNormalIcon = await OverlayImage.fromAssetImage(
      assetName: AppIcon.markerNormal,
      devicePixelRatio: devicePixelRatio,
    );

    markerLikeBadIcon = await OverlayImage.fromAssetImage(
      assetName: AppIcon.markerLikeBad,
      devicePixelRatio: devicePixelRatio,
    );

    markerLikeNormalIcon = await OverlayImage.fromAssetImage(
      assetName: AppIcon.markerLikeNormal,
      devicePixelRatio: devicePixelRatio,
    );

    markerLikeGoodIcon = await OverlayImage.fromAssetImage(
      assetName: AppIcon.markerLikeGood,
      devicePixelRatio: devicePixelRatio,
    );

    markerNoneIcon = await OverlayImage.fromAssetImage(
      assetName: AppIcon.markerNone,
      devicePixelRatio: devicePixelRatio,
    );

    markerLikeNoneIcon = await OverlayImage.fromAssetImage(
      assetName: AppIcon.markerLikeNone,
      devicePixelRatio: devicePixelRatio,
    );

    markerSingleNone = await OverlayImage.fromAssetImage(
      assetName: AppIcon.markerSingleNone,
      devicePixelRatio: devicePixelRatio,
    );

    markerSingleBad = await OverlayImage.fromAssetImage(
      assetName: AppIcon.markerSingleBad,
      devicePixelRatio: devicePixelRatio,
    );

    markerSingleNormal = await OverlayImage.fromAssetImage(
      assetName: AppIcon.markerSingleNormal,
      devicePixelRatio: devicePixelRatio,
    );

    markerSingleGood = await OverlayImage.fromAssetImage(
      assetName: AppIcon.markerSingleGood,
      devicePixelRatio: devicePixelRatio,
    );

    markerLikeSingleNone = await OverlayImage.fromAssetImage(
      assetName: AppIcon.markerLikeSingleNone,
      devicePixelRatio: devicePixelRatio,
    );

    markerLikeSingleBad = await OverlayImage.fromAssetImage(
      assetName: AppIcon.markerLikeSingleBad,
      devicePixelRatio: devicePixelRatio,
    );

    markerLikeSingleNormal = await OverlayImage.fromAssetImage(
      assetName: AppIcon.markerLikeSingleNormal,
      devicePixelRatio: devicePixelRatio,
    );

    markerLikeSingleGood = await OverlayImage.fromAssetImage(
      assetName: AppIcon.markerLikeSingleGood,
      devicePixelRatio: devicePixelRatio,
    );

    orangeMarker = await OverlayImage.fromAssetImage(
      assetName: AppIcon.markerOrange,
      devicePixelRatio: devicePixelRatio,
    );
  }
}
