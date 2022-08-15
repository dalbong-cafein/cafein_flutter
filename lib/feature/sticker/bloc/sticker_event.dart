part of 'sticker_bloc.dart';


abstract class StickerEvent extends Equatable{

  const StickerEvent();

}

class StickerRequested extends StickerEvent{

  @override
  List<Object?> get props => [];

}

class CouponRequested extends StickerEvent{

  @override
  List<Object?> get props => [];

}
