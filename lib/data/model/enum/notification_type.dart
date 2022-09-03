enum NotificationType {
  notice('공지사항'),
  sticker('스티커'),
  report('신고'),
  coupon('쿠폰');

  final String title;

  const NotificationType(this.title);
}
