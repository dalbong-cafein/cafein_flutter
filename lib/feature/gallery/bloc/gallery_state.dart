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

class GalleryPhotoChecked extends GalleryState {
  const GalleryPhotoChecked({
    this.isLimited = false,
    required this.selectedCount,
    required this.isChecked,
    required this.currentCount,
    required this.index,
  });

  final int selectedCount;
  final bool isLimited;
  final bool isChecked;
  final int currentCount;
  final int index;

  @override
  List<Object?> get props => [
        isLimited,
        selectedCount,
        isChecked,
        currentCount,
        index,
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
