import 'package:cafein_flutter/cafein_config.dart';
import 'package:cafein_flutter/data/datasource/remote/base_response.dart';
import 'package:cafein_flutter/data/model/member/update_member_request.dart';
import 'package:dio/dio.dart';

class MemberFormDataClient {
  final Dio dio;

  const MemberFormDataClient({required this.dio});

  Future<BaseResponse<dynamic>> updateMember(UpdateMemberRequest updateMemberRequest) async {
    final response = await dio.patch(
      '${CafeinConfig.baseUrl}/members/${updateMemberRequest.memberId}/ImageAndNickname',
      data: FormData.fromMap(
        {
          'nickname': updateMemberRequest.nickName,
          'imageFile': updateMemberRequest.imageFile != null
              ? await MultipartFile.fromFile(updateMemberRequest.imageFile!)
              : null,
          'deleteImageId': updateMemberRequest.deleteImageId,
        },
      ),
    );

    return response.data;
  }
}
