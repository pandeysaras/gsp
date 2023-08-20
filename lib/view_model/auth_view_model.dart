import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:gujarati_samaj_paris/utils/routes/routes_name.dart';

import '../repository/auth_repository.dart';

class AuthViewModel with ChangeNotifier{
  final _myRepo = AuthRepository();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> loginAPi (dynamic data, BuildContext context) async {
    setLoading(true);
    await _myRepo.loginApi(data).then((value) async {
      setLoading(false);
      Navigator.pushNamed(context, RoutesName.homeScreenLayout);
    }).onError((error, stackTrace) {
      log(error.toString());
      setLoading(false);
    });
  }


}