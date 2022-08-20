part of 'sticker_bloc.dart';

abstract class StickerEvent extends Equatable {
  const StickerEvent();
}

class StickerRequested extends StickerEvent {
  const StickerRequested();

  @override
  List<Object?> get props => [];
}


class StickerReverseRequested extends StickerEvent {
  final List stickers;
  final int stickerCnt;
  final int couponCnt;

  const StickerReverseRequested(
      {required this.stickers, required this.stickerCnt, required this.couponCnt});

  @override
  List<Object?> get props => [stickers, stickerCnt];
}
