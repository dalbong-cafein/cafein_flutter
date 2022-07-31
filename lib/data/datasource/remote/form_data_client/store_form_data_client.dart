import 'package:cafein_flutter/cafein_config.dart';
import 'package:cafein_flutter/data/datasource/remote/base_response.dart';
import 'package:cafein_flutter/data/model/store/registered_store_request.dart';
import 'package:cafein_flutter/data/model/store/update_store_request.dart';
import 'package:dio/dio.dart';

class StoreFormDataClient {
  final Dio dio;

  const StoreFormDataClient({required this.dio});

  Future<BaseResponse<int>> createStore(RegisteredStoreRequest registeredStoreRequest) async {
    final formData = FormData.fromMap(
      {
        'storeName': registeredStoreRequest.storeName,
        'siNm': registeredStoreRequest.addressInfo.cityName,
        'sggNm': registeredStoreRequest.addressInfo.districtName,
        'rNm': registeredStoreRequest.addressInfo.roadName,
        'rNum': registeredStoreRequest.addressInfo.roadNumber,
        'detail': registeredStoreRequest.addressInfo.detail,
        'phone': registeredStoreRequest.phoneNumber,
        'wifiPassword': registeredStoreRequest.wifiPassword,
        'website': registeredStoreRequest.webSite,
        'lngX': registeredStoreRequest.lngX,
        'latY': registeredStoreRequest.latY,
        'monOpen': registeredStoreRequest.totalBusinessInfo.onMonday.isOpen,
        'monClosed': registeredStoreRequest.totalBusinessInfo.onMonday.closed,
        'tueOpen': registeredStoreRequest.totalBusinessInfo.onTuesday.isOpen,
        'tueClosed': registeredStoreRequest.totalBusinessInfo.onTuesday.closed,
        'wedOpen': registeredStoreRequest.totalBusinessInfo.onWednesday.isOpen,
        'wedClosed': registeredStoreRequest.totalBusinessInfo.onWednesday.closed,
        'thuOpen': registeredStoreRequest.totalBusinessInfo.onThursday.isOpen,
        'thuClosed': registeredStoreRequest.totalBusinessInfo.onThursday.closed,
        'friOpen': registeredStoreRequest.totalBusinessInfo.onFriday.isOpen,
        'friClosed': registeredStoreRequest.totalBusinessInfo.onFriday.closed,
        'satOpen': registeredStoreRequest.totalBusinessInfo.onSaturday.isOpen,
        'satClosed': registeredStoreRequest.totalBusinessInfo.onSaturday.closed,
        'sunOpen': registeredStoreRequest.totalBusinessInfo.onSunday?.isOpen,
        'sunClosed': registeredStoreRequest.totalBusinessInfo.onSunday?.closed,
        'etcTime': registeredStoreRequest.totalBusinessInfo.etcTime,
        'recommendation': registeredStoreRequest.recommendation,
        'socket': registeredStoreRequest.socket,
        'wifi': registeredStoreRequest.wifi,
        'restroom': registeredStoreRequest.restroom,
        'tableSize': registeredStoreRequest.tableSize,
      },
    );

    formData.files.addAll(
      (registeredStoreRequest.imageFiles ?? [])
          .map(
            (e) => MapEntry(
              'imageFiles',
              MultipartFile.fromFileSync(e),
            ),
          )
          .toList(),
    );

    final response = await dio.post(
      '${CafeinConfig.baseUrl}/stores',
      data: formData,
    );

    return BaseResponse.fromJson(
      response.data,
      (json) => response.data['data'],
    );
  }

  Future<BaseResponse<dynamic>> updateStore(UpdateStoreRequest updateStoreRequest) async {
    final formData = FormData.fromMap(
      {
        'storeId': updateStoreRequest.storeId,
        'phone': updateStoreRequest.phoneNumber,
        'wifiPassword': updateStoreRequest.wifiPassword,
        'website': updateStoreRequest.webSite,
        'deleteImageIdList': updateStoreRequest.deleteImageIds,
        'monOpen': updateStoreRequest.totalBusinessInfo.onMonday.isOpen,
        'monClosed': updateStoreRequest.totalBusinessInfo.onMonday.closed,
        'tueOpen': updateStoreRequest.totalBusinessInfo.onTuesday.isOpen,
        'tueClosed': updateStoreRequest.totalBusinessInfo.onTuesday.closed,
        'wedOpen': updateStoreRequest.totalBusinessInfo.onWednesday.isOpen,
        'wedClosed': updateStoreRequest.totalBusinessInfo.onWednesday.closed,
        'thuOpen': updateStoreRequest.totalBusinessInfo.onThursday.isOpen,
        'thuClosed': updateStoreRequest.totalBusinessInfo.onThursday.closed,
        'friOpen': updateStoreRequest.totalBusinessInfo.onFriday.isOpen,
        'friClosed': updateStoreRequest.totalBusinessInfo.onFriday.closed,
        'satOpen': updateStoreRequest.totalBusinessInfo.onSaturday.isOpen,
        'satClosed': updateStoreRequest.totalBusinessInfo.onSaturday.closed,
        'sunOpen': updateStoreRequest.totalBusinessInfo.onSunday?.isOpen,
        'sunClosed': updateStoreRequest.totalBusinessInfo.onSunday?.closed,
        'etcTime': updateStoreRequest.totalBusinessInfo.etcTime,
      },
    );

    formData.files.addAll(
      (updateStoreRequest.updateImageFiles ?? [])
          .map(
            (e) => MapEntry(
              'updateImageFiles',
              MultipartFile.fromFileSync(e),
            ),
          )
          .toList(),
    );

    final response = await dio.put(
      '${CafeinConfig.baseUrl}/stores',
      data: formData,
    );

    return BaseResponse.fromJson(
      response.data,
      (json) => null,
    );
  }
}
