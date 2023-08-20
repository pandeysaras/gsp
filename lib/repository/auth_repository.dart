
import 'dart:developer';

import '../data/network/base_api_services.dart';
import '../data/network/network_api_service.dart';
import '../utils/app_url.dart';

class AuthRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  Future<void> loginApi(dynamic data) async {
    try {
      log(AppUrl.loginEndPoint);
      dynamic response =
      await _apiServices.getPostApiResponse(AppUrl.loginEndPoint, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }


}