import 'package:cafein_flutter/data/model/enum/review_category.dart';

String getReviewString({
  required ReviewCategory reviewCategory,
  required String reviewScore,
}) {
  switch (reviewCategory) {
    case ReviewCategory.socket:
      if (reviewScore == '1') {
        return '바닥을 기어봐도 없어요';
      } else if (reviewScore == '2') {
        return '찾기 힘들어요';
      } else if (reviewScore == '3') {
        return '여유 있어요';
      } else {
        return '모든 자리에 있어요';
      }
    case ReviewCategory.restroom:
      if (reviewScore == '1') {
        return '없어요 그냥 없어요';
      } else if (reviewScore == '2') {
        return '이용하기 꺼려져요';
      } else if (reviewScore == '3') {
        return '그냥저냥 쓸만해요';
      } else {
        return '화장실 맛집이에요';
      }
    case ReviewCategory.table:
      if (reviewScore == '1') {
        return '카공을 허락하지 않아요';
      } else if (reviewScore == '2') {
        return '오래 쓰면 몸이 아파요';
      } else if (reviewScore == '3') {
        return '그냥저냥 쓸만해요';
      } else {
        return '매우 편하게 사용 가능해요';
      }
    case ReviewCategory.wifi:
      if (reviewScore == '1') {
        return '없어요 그냥 없어요';
      } else if (reviewScore == '2') {
        return '자주 끊겨서 화나요';
      } else if (reviewScore == '3') {
        return '그냥저냥 쓸만해요';
      } else {
        return '빵빵 잘 터져요';
      }
  }
}
