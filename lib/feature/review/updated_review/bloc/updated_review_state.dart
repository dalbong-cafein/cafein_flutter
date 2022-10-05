part of 'updated_review_bloc.dart';

class UpdatedReviewState extends Equatable {
  const UpdatedReviewState({
    required this.wifiScore,
    required this.restroomScore,
    required this.socketScore,
    required this.tableScore,
    required this.reviewText,
    required this.imageUrls,
    required this.deleteImageIds,
    required this.updateImageUrls,
    required this.reviewRecommendation,
    required this.isValid,
    required this.permissionStatus,
    required this.isLoading,
    required this.error,
    required this.isSucceed,
  });

  final String wifiScore;
  final String restroomScore;
  final String socketScore;
  final String tableScore;
  final String reviewText;
  final List<String> imageUrls;
  final List<String> updateImageUrls;
  final List<int> deleteImageIds;
  final ReviewRecommendation reviewRecommendation;
  final bool isValid;
  final bool isLoading;
  final bool isSucceed;
  final PermissionStatus permissionStatus;
  final dynamic error;

  UpdatedReviewState copyWith({
    String? wifiScore,
    String? restroomScore,
    String? socketScore,
    String? tableScore,
    String? reviewText,
    List<String>? imageUrls,
    List<String>? updateImageUrls,
    List<int>? deleteImageIds,
    ReviewRecommendation? reviewRecommendation,
    bool? isValid,
    bool? isLoading,
    bool? isSucceed,
    PermissionStatus? permissionStatus,
    dynamic? error,
  }) =>
      UpdatedReviewState(
        wifiScore: wifiScore ?? this.wifiScore,
        restroomScore: restroomScore ?? this.restroomScore,
        socketScore: socketScore ?? this.socketScore,
        tableScore: tableScore ?? this.tableScore,
        reviewText: reviewText ?? this.reviewText,
        imageUrls: imageUrls ?? this.imageUrls,
        deleteImageIds: deleteImageIds ?? this.deleteImageIds,
        reviewRecommendation: reviewRecommendation ?? this.reviewRecommendation,
        updateImageUrls: updateImageUrls ?? this.updateImageUrls,
        isValid: isValid ?? this.isValid,
        isLoading: isLoading ?? this.isLoading,
        permissionStatus: permissionStatus ?? this.permissionStatus,
        error: error ?? this.error,
        isSucceed: isSucceed ?? this.isSucceed,
      );

  @override
  List<Object?> get props => [
        wifiScore,
        restroomScore,
        socketScore,
        tableScore,
        reviewText,
        imageUrls,
        deleteImageIds,
        reviewRecommendation,
        isValid,
        isLoading,
        permissionStatus,
        error,
        isSucceed,
      ];
}
