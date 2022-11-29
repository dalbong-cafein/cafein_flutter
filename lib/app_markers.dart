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
    final devicePixelRatio = window.devicePixelRatio;

    markerBadIcon = await OverlayImage.fromAssetImage(
      assetName: Platform.isAndroid ? AppIcon.markerBadX4 : AppIcon.markerBad,
      devicePixelRatio: devicePixelRatio,
    );

    markerGoodIcon = await OverlayImage.fromAssetImage(
      assetName: Platform.isAndroid ? AppIcon.markerGoodX4 : AppIcon.markerGood,
      devicePixelRatio: devicePixelRatio,
    );

    markerNormalIcon = await OverlayImage.fromAssetImage(
      assetName:
          Platform.isAndroid ? AppIcon.markerNormalX4 : AppIcon.markerNormal,
      devicePixelRatio: devicePixelRatio,
    );

    markerLikeBadIcon = await OverlayImage.fromAssetImage(
      assetName:
          Platform.isAndroid ? AppIcon.markerLikeBadX4 : AppIcon.markerLikeBad,
      devicePixelRatio: devicePixelRatio,
    );

    markerLikeNormalIcon = await OverlayImage.fromAssetImage(
      assetName: Platform.isAndroid
          ? AppIcon.markerLikeNormalX4
          : AppIcon.markerLikeNormal,
      devicePixelRatio: devicePixelRatio,
    );

    markerLikeGoodIcon = await OverlayImage.fromAssetImage(
      assetName: Platform.isAndroid
          ? AppIcon.markerLikeGoodX4
          : AppIcon.markerLikeGood,
      devicePixelRatio: devicePixelRatio,
    );

    markerNoneIcon = await OverlayImage.fromAssetImage(
      assetName: Platform.isAndroid ? AppIcon.markerNoneX4 : AppIcon.markerNone,
      devicePixelRatio: devicePixelRatio,
    );

    markerLikeNoneIcon = await OverlayImage.fromAssetImage(
      assetName: Platform.isAndroid
          ? AppIcon.markerLikeNoneX4
          : AppIcon.markerLikeNone,
      devicePixelRatio: devicePixelRatio,
    );

    markerSingleNone = await OverlayImage.fromAssetImage(
      assetName: Platform.isAndroid
          ? AppIcon.markerSingleNoneX4
          : AppIcon.markerSingleNone,
      devicePixelRatio: devicePixelRatio,
    );

    markerSingleBad = await OverlayImage.fromAssetImage(
      assetName: Platform.isAndroid
          ? AppIcon.markerSingleBadX4
          : AppIcon.markerSingleBad,
      devicePixelRatio: devicePixelRatio,
    );

    markerSingleNormal = await OverlayImage.fromAssetImage(
      assetName: Platform.isAndroid
          ? AppIcon.markerSingleNormalX4
          : AppIcon.markerSingleNormal,
      devicePixelRatio: devicePixelRatio,
    );

    markerSingleGood = await OverlayImage.fromAssetImage(
      assetName: Platform.isAndroid
          ? AppIcon.markerSingleGoodX4
          : AppIcon.markerSingleGood,
      devicePixelRatio: devicePixelRatio,
    );

    markerLikeSingleNone = await OverlayImage.fromAssetImage(
      assetName: Platform.isAndroid
          ? AppIcon.markerLikeSingleNoneX4
          : AppIcon.markerLikeSingleNone,
      devicePixelRatio: devicePixelRatio,
    );

    markerLikeSingleBad = await OverlayImage.fromAssetImage(
      assetName: Platform.isAndroid
          ? AppIcon.markerLikeSingleBadX4
          : AppIcon.markerLikeSingleBad,
      devicePixelRatio: devicePixelRatio,
    );

    markerLikeSingleNormal = await OverlayImage.fromAssetImage(
      assetName: Platform.isAndroid
          ? AppIcon.markerLikeSingleNormalX4
          : AppIcon.markerLikeSingleNormal,
      devicePixelRatio: devicePixelRatio,
    );

    markerLikeSingleGood = await OverlayImage.fromAssetImage(
      assetName: Platform.isAndroid
          ? AppIcon.markerLikeSingleGoodX4
          : AppIcon.markerLikeSingleGood,
      devicePixelRatio: devicePixelRatio,
    );

    orangeMarker = await OverlayImage.fromAssetImage(
      assetName:
          Platform.isAndroid ? AppIcon.markerOrangeX4 : AppIcon.markerOrange,
      devicePixelRatio: devicePixelRatio,
    );
  }
}
