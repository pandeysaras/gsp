import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:gujarati_samaj_paris/model/events_model.dart';
import 'package:gujarati_samaj_paris/repository/events_repo.dart';

import '../data/response/api_response.dart';

class EventsViewModel with ChangeNotifier {

  final _myRepo = EventsRepo();

  ApiResponse<EventsModel> eventsList = ApiResponse.loading();

  setEvents(ApiResponse<EventsModel> response) {
    eventsList = response;
    notifyListeners();
  }



  Future<void> fetchEventsAPi() async {
    setEvents(ApiResponse.loading());
    await _myRepo.eventsAPi().then((value) {
      log("success");
      setEvents(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setEvents(ApiResponse.error(error.toString()));
      print(error.toString());
    });
  }

}