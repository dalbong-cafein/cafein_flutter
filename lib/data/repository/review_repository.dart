import 'package:cafein_flutter/data/datasource/remote/base_response.dart';
import 'package:cafein_flutter/data/datasource/remote/form_data_client/review_form_data_client.dart';
import 'package:cafein_flutter/data/datasource/remote/retrofit/report_client.dart';
import 'package:cafein_flutter/data/datasource/remote/retrofit/review_client.dart';
import 'package:cafein_flutter/data/model/report/report_category.dart';
import 'package:cafein_flutter/data/model/review/create_review_request.dart';
import 'package:cafein_flutter/data/model/review/review.dart';
import 'package:cafein_flutter/data/model/review/review_response.dart';
import 'package:cafein_flutter/data/model/review/review_score_detail.dart';
import 'package:cafein_flutter/data/model/review/store_review_list_response.dart';
import 'package:cafein_flutter/data/model/review/update_review_request.dart';
import 'package:cafein_flutter/data/model/review/user_review.dart';

abstract class ReviewRepository {
  Future<BaseResponse<dynamic>> updateReview(
    UpdateReviewRequest updateReviewRequest,
  );

  Future<BaseResponse<int>> createReview(
    CreateReivewRequest createReivewRequest,
  );

  Future<BaseResponse<ReviewResponse<StoreReviewListResponse>>> getStoreReviews(
    int storeId,
  );

  Future<BaseResponse<ReviewDetailScore>> getStoreReviewScoreDetail(
    int storeId,
  );

  Future<BaseResponse<ReviewResponse<List<UserReview>>>> getUserReviews();

  Future<BaseResponse<ReviewResponse<Review>>> getMyRegisteredReviews(
    int limit,
  );

  Future<BaseResponse<dynamic>> deleteReview(
    int reviewId,
  );

  Future<BaseResponse<dynamic>> createReportReview(
    int reviewId,
  );

  Future<BaseResponse<List<ReportCategory>>> getReportCategories();
}

class ReviewRepositoryImpl implements ReviewRepository {
  final ReviewClient reviewClient;
  final ReviewFormDataClient reviewFormDataClient;
  final ReportClient reportClient;

  ReviewRepositoryImpl({
    required this.reviewClient,
    required this.reviewFormDataClient,
    required this.reportClient,
  });

  @override
  Future<BaseResponse> createReportReview(int reviewId) =>
      reportClient.createReportReview(reviewId);

  @override
  Future<BaseResponse<int>> createReview(CreateReivewRequest createReivewRequest) =>
      reviewFormDataClient.createReview(createReivewRequest);

  @override
  Future<BaseResponse> deleteReview(int reviewId) => reviewClient.deleteReview(reviewId);

  @override
  Future<BaseResponse<ReviewResponse<Review>>> getMyRegisteredReviews(int limit) =>
      reviewClient.getMyRegisteredReviews(limit);

  @override
  Future<BaseResponse<List<ReportCategory>>> getReportCategories() =>
      reportClient.getReportCategories();

  @override
  Future<BaseResponse<ReviewDetailScore>> getStoreReviewScoreDetail(int storeId) =>
      reviewClient.getStoreReviewScoreDetail(storeId);

  @override
  Future<BaseResponse<ReviewResponse<StoreReviewListResponse>>> getStoreReviews(int storeId) =>
      reviewClient.getStoreReviews(storeId);

  @override
  Future<BaseResponse<ReviewResponse<List<UserReview>>>> getUserReviews() =>
      reviewClient.getUserReviews();

  @override
  Future<BaseResponse> updateReview(
    UpdateReviewRequest updateReviewRequest,
  ) =>
      reviewFormDataClient.updateReview(updateReviewRequest);
}
