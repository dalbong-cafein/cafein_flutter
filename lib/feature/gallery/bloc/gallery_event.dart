part of 'gallery_bloc.dart';

abstract class GalleryEvent extends Equatable {
  const GalleryEvent();

  @override
  List<Object?> get props => [];
}

class GalleryPhotoRequested extends GalleryEvent {
  const GalleryPhotoRequested();
}

class GalleryPhotoStateChanged extends GalleryEvent {
  const GalleryPhotoStateChanged({
    required this.index,
    required this.isChecked,
  });

  final bool isChecked;
  final int index;

  @override
  List<Object?> get props => [
        isChecked,
        index,
      ];
}
