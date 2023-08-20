import 'package:gujarati_samaj_paris/model/events_model.dart';

import '../data/network/base_api_services.dart';
import '../data/network/network_api_service.dart';
import '../utils/app_url.dart';

class EventsRepo {
  final BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> eventsAPi() async {
    try {
      dynamic response =
      await _apiServices.getGetApiResponse(AppUrl.festivalsEndPoint);
      return response = EventsModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

}