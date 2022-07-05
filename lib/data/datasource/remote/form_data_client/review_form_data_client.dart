import 'package:cafein_flutter/cafein_config.dart';
import 'package:cafein_flutter/data/datasource/remote/base_response.dart';
import 'package:cafein_flutter/data/model/review/create_review_request.dart';
import 'package:cafein_flutter/data/model/review/update_review_request.dart';
import 'package:dio/dio.dart';

class ReviewFormDataClient {
  final Dio dio;

  const ReviewFormDataClient({required this.dio});

  Future<BaseResponse<int>> createReview(CreateReivewRequest createReivewRequest) async {
    final formData = FormData.fromMap(
      {
        'storeId': createReivewRequest.storeId,
        'recommendation': createReivewRequest.recommendation,
        'content': createReivewRequest.content,
        'socket': createReivewRequest.socket,
        'wifi': createReivewRequest.wifi,
        'restroom': createReivewRequest.restroom,
        'tableSize': createReivewRequest.tableSize,
      },
    );

    formData.files.addAll(
      (createReivewRequest.imageFiles ?? [])
          .map(
            (e) => MapEntry(
              'imageFiles',
              MultipartFile.fromFileSync(e),
            ),
          )
          .toList(),
    );
    final response = await dio.post<BaseResponse<int>>(
      '${CafeinConfig.baseUrl}/reviews',
      data: formData,
    );

    return response.data ??
        BaseResponse(
          message: '',
          data: -1,
          code: -1,
        );
  }

  Future<BaseResponse<dynamic>> updateReview(UpdateReviewRequest updateReviewRequest) async {
    final formData = FormData.fromMap(
      {
        'reviewId': updateReviewRequest.reviewId,
        'recommendation': updateReviewRequest.recommendation,
        'content': updateReviewRequest.content,
        'socket': updateReviewRequest.socket,
        'wifi': updateReviewRequest.wifi,
        'restroom': updateReviewRequest.restroom,
        'tableSize': updateReviewRequest.tableSize,
        'deleteImageIdList': updateReviewRequest.deleteImageIds,
      },
    );

    formData.files.addAll(
      (updateReviewRequest.updateImageFiles ?? [])
          .map(
            (e) => MapEntry(
              'updateImageFiles',
              MultipartFile.fromFileSync(e),
            ),
          )
          .toList(),
    );
    final response = await dio.post<BaseResponse<int>>(
      '${CafeinConfig.baseUrl}/reviews/${updateReviewRequest.reviewId}',
      data: formData,
    );

    return response.data ??
        BaseResponse(
          message: '',
          data: null,
          code: -1,
        );
  }
}
