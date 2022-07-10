import 'package:cafein_flutter/data/datasource/remote/base_response.dart';
import 'package:cafein_flutter/data/datasource/remote/retrofit/board_client.dart';
import 'package:cafein_flutter/data/datasource/remote/retrofit/event_client.dart';
import 'package:cafein_flutter/data/model/board/board.dart';
import 'package:cafein_flutter/data/model/event/event.dart';

abstract class BoardRepository {
  Future<BaseResponse<List<Board>>> getBoards(
    int categoryId,
  );

  Future<BaseResponse<Event>> getLatestEvent();
}

class BoardRepositoryImpl implements BoardRepository {
  final BoardClient boardClient;
  final EventClient eventClient;

  BoardRepositoryImpl({
    required this.boardClient,
    required this.eventClient,
  });

  @override
  Future<BaseResponse<List<Board>>> getBoards(
    int categoryId,
  ) =>
      boardClient.getBoards(categoryId);

  @override
  Future<BaseResponse<Event>> getLatestEvent() => eventClient.getLatestEvent();
}
