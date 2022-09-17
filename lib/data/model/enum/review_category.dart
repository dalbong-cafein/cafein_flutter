enum ReviewCategory {
  socket(
    '콘센트',
    '',
  ),
  restroom(
    '화장실',
    '',
  ),
  table(
    '테이블',
    '',
  ),
  wifi(
    '와이파이',
    '',
  );

  final String name;
  final String icon;

  const ReviewCategory(
    this.name,
    this.icon,
  );
}
