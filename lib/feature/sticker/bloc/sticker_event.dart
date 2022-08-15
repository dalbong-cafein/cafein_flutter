part of 'sticker_bloc.dart';


abstract class StickerEvent extends Equatable{

  const StickerEvent();

}

class StickerRequested extends StickerEvent{
  const StickerRequested();
  @override
  List<Object?> get props => [];

}

class CouponCountRequested extends StickerEvent{
  const CouponCountRequested();
  @override
  List<Object?> get props => [];

}
