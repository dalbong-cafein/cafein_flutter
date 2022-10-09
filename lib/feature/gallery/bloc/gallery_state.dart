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
    this.nextPage,
  });

  final List<AssetEntity> recentAssets;
  final int? nextPage;

  @override
  List<Object?> get props => [
        recentAssets,
        nextPage,
      ];
}

class GalleryCameraPhotoLoaded extends GalleryState {
  const GalleryCameraPhotoLoaded({
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  List<Object?> get props => [
        imageUrl,
      ];
}

class GalleryPhotoChecked extends GalleryState {
  const GalleryPhotoChecked({
    this.isLimited = false,
    required this.selectedCount,
    required this.isChecked,
    required this.index,
    required this.selectedDataList,
  });

  final int selectedCount;
  final bool isLimited;
  final bool isChecked;
  final List<AssetEntity> selectedDataList;
  final int index;

  @override
  List<Object?> get props => [
        isLimited,
        selectedCount,
        isChecked,
        index,
        selectedDataList,
      ];
}

class GalleryError extends GalleryState {
  const GalleryError({
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
