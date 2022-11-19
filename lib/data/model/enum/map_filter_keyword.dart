enum MapFilterKeyword {
  business('영업중'),
  confuse('혼잡도낮은순'),
  close('가까운순'),
  recommended('추천순');

  final String title;

  const MapFilterKeyword(this.title);
}
