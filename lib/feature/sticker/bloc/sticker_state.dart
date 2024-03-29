part of 'sticker_bloc.dart';


abstract class StickerState extends Equatable {
  const StickerState();
}

class StickerInitial extends StickerState {
  const StickerInitial();

  @override
  List<Object?> get props => [];

}

class StickerLoaded extends StickerState{

  final int stickerCnt;
  final List<Sticker> stickers;
  final int couponCnt;
  const StickerLoaded({required this.stickerCnt, required this.stickers, required this.couponCnt});

  @override
  List<Object?> get props => [stickerCnt, [... stickers]];

}

class StickerLoading extends StickerState{


  @override
  List<Object?> get props => [];

}

class StickerError extends StickerState {
  const StickerError({
    required this.event,
    required this.error,
  });

  final Function event;
  final dynamic error;

  @override
  List<Object?> get props => [error];
}

class CouponCountLoaded extends StickerState{

  final int couponCnt;
  const CouponCountLoaded({required this.couponCnt});

  @override
  List<Object?> get props => [couponCnt];

}

