import 'package:cafein_flutter/cafein_config.dart';
import 'package:cafein_flutter/data/datasource/remote/base_response.dart';
import 'package:cafein_flutter/data/model/board/board.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'board_client.g.dart';

@RestApi(baseUrl: CafeinConfig.baseUrl)
abstract class BoardClient {
  factory BoardClient(
    Dio dio, {
    String? baseUrl,
  }) = _BoardClient;

  @GET('/boards')
  Future<BaseResponse<List<Board>>> getBoards(
    @Query('boardCategoryId') int categoryId,
  );


  @GET('/boards/{boardId}')
  Future<BaseResponse<Board>> getBoard(
      @Path() int boardId,
      );
}
