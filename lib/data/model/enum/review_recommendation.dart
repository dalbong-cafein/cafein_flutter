enum ReviewRecommendation {
  normal(
    'NORMAL',
    '무난해요',
  ),
  good(
    'GOOD',
    '추천해요',
  ),
  bad(
    'BAD',
    '아쉬워요',
  );

  final String jsonValue;
  final String buttonTitle;

  const ReviewRecommendation(
    this.jsonValue,
    this.buttonTitle,
  );
}
