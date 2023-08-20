import 'dart:developer';

import 'package:gujarati_samaj_paris/model/helpful_links_model.dart';

import '../data/network/base_api_services.dart';
import '../data/network/network_api_service.dart';
import '../utils/app_url.dart';

class HelpfulLinkRepo {

  final BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> helpfulLinkAPi() async {
    try {
      dynamic response =
      await _apiServices.getGetApiResponse(AppUrl.helpfulLinkEndPoint);
      return
          HelpfulLinksModel.fromJson(response);
    } catch (e) {
      log(e.toString());
      rethrow;

    }
  }


}