import 'package:gujarati_samaj_paris/model/live_class_model.dart';

import '../data/network/base_api_services.dart';
import '../data/network/network_api_service.dart';
import '../utils/app_url.dart';

class HelpfulLinkRepo {

  final BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> helpfulLinkAPi() async {
    try {
      dynamic response =
      await _apiServices.getGetApiResponse(AppUrl.helpfulLinkEndPoint);
      return response = LiveClassModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }


}