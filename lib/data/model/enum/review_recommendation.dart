enum ReviewRecommendation {
  normal('NORMAL'),
  good('GOOD'),
  bad('BAD');

  final String jsonValue;

  const ReviewRecommendation(this.jsonValue);
}
