import 'package:cafein_flutter/cafein_config.dart';
import 'package:cafein_flutter/data/datasource/remote/base_response.dart';
import 'package:cafein_flutter/data/model/common/registration_possible.dart';
import 'package:cafein_flutter/data/model/review/review.dart';
import 'package:cafein_flutter/data/model/review/review_list_response.dart';
import 'package:cafein_flutter/data/model/review/review_response.dart';
import 'package:cafein_flutter/data/model/review/review_score_detail.dart';
import 'package:cafein_flutter/data/model/review/store_review_list_response.dart';
import 'package:cafein_flutter/data/model/review/user_review.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'review_client.g.dart';

@RestApi(baseUrl: CafeinConfig.baseUrl)
abstract class ReviewClient {
  factory ReviewClient(
    Dio dio, {
    String? baseUrl,
  }) = _ReviewClient;

  @GET('/stores/{storeId}/reviews')
  Future<BaseResponse<ReviewResponse<StoreReviewListResponse>>> getStoreReviews(
    @Path() int storeId,
    @Query('page') int page,
    @Query('size') int size,
  );

  @GET('/stores/{storeId}/detail-review-score')
  Future<BaseResponse<ReviewDetailScore>> getStoreReviewScoreDetail(
    @Path() int storeId,
  );

  @GET('/members/reviews')
  Future<BaseResponse<ReviewListResponse<UserReview>>> getUserReviews();

  @GET('/stores/{storeId}/reviews/limit')
  Future<BaseResponse<ReviewListResponse<Review>>> getStoreReviewsLimit(
    @Path() int storeId,
    @Query('limit') int limit,
  );

  @DELETE('/reviews/{reviewId}')
  Future<BaseResponse<dynamic>> deleteReview(
    @Path() int reviewId,
  );

  @GET('/stores/{storeId}/reviews/check-possible-registration')
  Future<BaseResponse<RegistrationPossible>> isPossible(
    @Path() int storeId,
  );
}
