
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:gujarati_samaj_paris/model/helpful_links_model.dart';
import 'package:gujarati_samaj_paris/repository/helpful_link_repo.dart';

import '../data/response/api_response.dart';

class HelpfulLinkViewModel with ChangeNotifier {

  final _myRepo = HelpfulLinkRepo();

  ApiResponse<HelpfulLinksModel> helpfulLinkList = ApiResponse.loading();

  setHelpfulLinks(ApiResponse<HelpfulLinksModel> response) {
    helpfulLinkList = response;
    notifyListeners();
  }



  fetchHelpfulLinkAPi()  {
    setHelpfulLinks(ApiResponse.loading());
    _myRepo.helpfulLinkAPi().then((value) {
      log("success helpful");
      log(value["data"]);
      
      setHelpfulLinks(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setHelpfulLinks(ApiResponse.error(error.toString()));
      print(error.toString());
    });
  }

}