import 'package:cafein_flutter/cafein_config.dart';
import 'package:cafein_flutter/data/datasource/remote/base_response.dart';
import 'package:cafein_flutter/data/model/event/event.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'event_client.g.dart';

@RestApi(baseUrl: CafeinConfig.baseUrl)
abstract class EventClient {
  factory EventClient(
    Dio dio, {
    String? baseUrl,
  }) = _EventClient;

  @GET('/events/latest')
  Future<BaseResponse<Event>> getLatestEvent();
}
