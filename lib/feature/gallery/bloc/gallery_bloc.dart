import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_manager/photo_manager.dart';

part 'gallery_event.dart';
part 'gallery_state.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  GalleryBloc({
    required this.maxCount,
  }) : super(const GalleryInitial()) {
    on<GalleryPhotoRequested>(_onGalleryPhotoRequested);
    on<GalleryPhotoStateChanged>(_onGalleryPhotoStateChanged);
  }

  final int maxCount;

  List<AssetEntity> assets = [];
  List<AssetEntity> selectedAsset = [];
  int page = 0;
  int currentCount = 0;

  FutureOr<void> _onGalleryPhotoRequested(
    GalleryPhotoRequested event,
    Emitter<GalleryState> emit,
  ) async {
    emit(const GalleryLoading());
    final albums = await PhotoManager.getAssetPathList(
      onlyAll: true,
      type: RequestType.image,
    );
    final recentAlbum = albums.first;

    final recentAssets = await recentAlbum.getAssetListPaged(
      page: page++,
      size: 100,
    );

    assets = [
      ...assets,
      ...recentAssets
          .where(
            (element) => element.type == AssetType.image,
          )
          .toList(),
    ];

    emit(GalleryLoaded(
      recentAssets: [...assets],
      nextPage: recentAssets.isNotEmpty ? 1 : null,
    ));
  }

  FutureOr<void> _onGalleryPhotoStateChanged(
    GalleryPhotoStateChanged event,
    Emitter<GalleryState> emit,
  ) {
    if (!event.isChecked) {
      currentCount -= 1;
      selectedAsset.remove(assets[event.index]);
    } else {
      if (selectedAsset.length == 5) {
        emit(GalleryPhotoChecked(
          isLimited: true,
          selectedCount: selectedAsset.length,
          isChecked: event.isChecked,
          currentCount: currentCount,
          index: event.index,
        ));

        return null;
      }

      currentCount += 1;
      selectedAsset.add(assets[event.index]);
    }

    emit(GalleryPhotoChecked(
      selectedCount: selectedAsset.length,
      isChecked: event.isChecked,
      currentCount: currentCount,
      index: event.index,
    ));
  }
}
