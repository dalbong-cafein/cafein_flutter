part of 'gallery_bloc.dart';

abstract class GalleryState extends Equatable {
  const GalleryState();

  @override
  List<Object?> get props => [];
}

class GalleryInitial extends GalleryState {
  const GalleryInitial();
}

class GalleryLoading extends GalleryState {
  const GalleryLoading();
}

class GalleryLoaded extends GalleryState {
  const GalleryLoaded({
    required this.recentAssets,
  });

  final List<AssetEntity> recentAssets;

  @override
  List<Object?> get props => [
        recentAssets,
      ];
}

class GalleryPhotoChecked extends GalleryState {
  const GalleryPhotoChecked({
    required this.isLimited,
    required this.selectedCount,
    required this.isChecked,
  });

  final int selectedCount;
  final bool isLimited;
  final bool isChecked;

  @override
  List<Object?> get props => [
        isLimited,
        selectedCount,
        isChecked,
      ];
}

class GalleryErorr extends GalleryState {
  const GalleryErorr({
    required this.error,
    required this.event,
  });

  final dynamic error;
  final Function event;

  @override
  List<Object?> get props => [
        error,
      ];
}
