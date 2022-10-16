enum ReviewRecommendation {
  normal(
    'NORMAL',
    '그냥그래요',
  ),
  good(
    'GOOD',
    '추천해요',
  ),
  bad(
    'BAD',
    '별로에요',
  );

  final String jsonValue;
  final String buttonTitle;

  const ReviewRecommendation(
    this.jsonValue,
    this.buttonTitle,
  );
}
