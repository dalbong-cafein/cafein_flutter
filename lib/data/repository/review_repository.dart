import 'package:cafein_flutter/data/datasource/remote/base_response.dart';
import 'package:cafein_flutter/data/datasource/remote/form_data_client/review_form_data_client.dart';
import 'package:cafein_flutter/data/datasource/remote/retrofit/report_client.dart';
import 'package:cafein_flutter/data/datasource/remote/retrofit/review_client.dart';
import 'package:cafein_flutter/data/model/common/registration_possible.dart';
import 'package:cafein_flutter/data/model/report/report_category.dart';
import 'package:cafein_flutter/data/model/report/report_possible.dart';
import 'package:cafein_flutter/data/model/report/report_request.dart';
import 'package:cafein_flutter/data/model/review/create_review_request.dart';
import 'package:cafein_flutter/data/model/review/review.dart';
import 'package:cafein_flutter/data/model/review/review_list_response.dart';
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

  Future<BaseResponse<ReviewResponse<StoreReviewListResponse>>>
      getStoreReviews({
    required int storeId,
    required int page,
    required int size,
  });

  Future<BaseResponse<ReviewDetailScore>> getStoreReviewScoreDetail(
    int storeId,
  );

  Future<BaseResponse<ReviewListResponse<UserReview>>> getUserReviews();

  Future<BaseResponse<ReviewListResponse<Review>>> getStoreReviewsLimit({
    required int storeId,
    required int limit,
  });

  Future<BaseResponse<dynamic>> deleteReview(
    int reviewId,
  );

  Future<BaseResponse<dynamic>> createReportReview({
    required int reviewId,
    required ReportRequest reportRequest,
  });

  Future<BaseResponse<ReportPossible>> getReportPossible(
      {required int storeId});

  Future<BaseResponse<List<ReportCategory>>> getReportCategories();

  Future<BaseResponse<RegistrationPossible>> isPossible(int storeId);
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
  Future<BaseResponse<int>> createReview(
          CreateReivewRequest createReivewRequest) =>
      reviewFormDataClient.createReview(createReivewRequest);

  @override
  Future<BaseResponse> deleteReview(int reviewId) =>
      reviewClient.deleteReview(reviewId);

  @override
  Future<BaseResponse<ReviewListResponse<Review>>> getStoreReviewsLimit({
    required int storeId,
    required int limit,
  }) =>
      reviewClient.getStoreReviewsLimit(
        storeId,
        limit,
      );

  @override
  Future<BaseResponse<List<ReportCategory>>> getReportCategories() =>
      reportClient.getReportCategories();

  @override
  Future<BaseResponse<ReviewDetailScore>> getStoreReviewScoreDetail(
          int storeId) =>
      reviewClient.getStoreReviewScoreDetail(storeId);

  @override
  Future<BaseResponse<ReviewListResponse<UserReview>>> getUserReviews() =>
      reviewClient.getUserReviews();

  @override
  Future<BaseResponse> updateReview(
    UpdateReviewRequest updateReviewRequest,
  ) =>
      reviewFormDataClient.updateReview(updateReviewRequest);

  @override
  Future<BaseResponse> createReportReview({
    required int reviewId,
    required ReportRequest reportRequest,
  }) =>
      reportClient.createReportReview(
        reviewId,
        reportRequest,
      );

  @override
  Future<BaseResponse<ReviewResponse<StoreReviewListResponse>>>
      getStoreReviews({
    required int storeId,
    required int page,
    required int size,
  }) =>
          reviewClient.getStoreReviews(
            storeId,
            page,
            size,
          );

  @override
  Future<BaseResponse<RegistrationPossible>> isPossible(int storeId) =>
      reviewClient.isPossible(storeId);

  @override
  Future<BaseResponse<ReportPossible>> getReportPossible(
      {required int storeId}) => reportClient.getReportPossible(storeId);
}
