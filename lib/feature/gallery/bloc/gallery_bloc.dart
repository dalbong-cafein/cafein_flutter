import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_manager/photo_manager.dart';

part 'gallery_event.dart';
part 'gallery_state.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  GalleryBloc() : super(const GalleryInitial()) {
    on<GalleryPhotoRequested>(_onGalleryPhotoRequested);
    on<GalleryPhotoStateChanged>(_onGalleryPhotoStateChanged);
  }

  List<AssetEntity> assets = [];
  List<AssetEntity> selectedAsset = [];
  int page = 0;

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
    ));
  }

  FutureOr<void> _onGalleryPhotoStateChanged(
    GalleryPhotoStateChanged event,
    Emitter<GalleryState> emit,
  ) {}
}
