
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:gujarati_samaj_paris/model/live_class_model.dart';
import 'package:gujarati_samaj_paris/repository/live_class_repo.dart';

import '../data/response/api_response.dart';

class LiveClassViewModel with ChangeNotifier {

  final _myRepo = LiveClassRepo();

  ApiResponse<LiveClassModel> classLinkList = ApiResponse.loading();

  setClassLinks(ApiResponse<LiveClassModel> response) {
    classLinkList = response;
    notifyListeners();
  }



      fetchLiveClassAPi()  {
    setClassLinks(ApiResponse.loading());
     _myRepo.liveClassAPi().then((value) {
      log("success");
      setClassLinks(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setClassLinks(ApiResponse.error(error.toString()));
      print(error.toString());
    });
  }

}