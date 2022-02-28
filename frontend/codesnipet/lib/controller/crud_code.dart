import 'package:codesnipet/utils/api/client.dart';
import 'package:flutter/material.dart';

enum CURDState { delete, create, update, read, failed, idle, sucess }

class CRUDController with ChangeNotifier {
  CURDState _curd = CURDState.idle;
  CURDState get curd => _curd;

  Future createCode(
      String language, String title, String code, List<String> tags) async {
    _curd = CURDState.create;
    notifyListeners();
    Map response =
        await ApiClient().createCodeSnipett(language, title, code, tags);
    if (response["error"] == true) {
      _curd = CURDState.failed;
      notifyListeners();
    } else {
      _curd = CURDState.idle;
      notifyListeners();
    }
  }

  Future deleteCode(String id) async {
    _curd = CURDState.delete;
    notifyListeners();
    Map response = await ApiClient().deleteCode(id);
    if (response["error"] == true) {
      _curd = CURDState.failed;
      notifyListeners();
    } else {
      _curd = CURDState.idle;
      notifyListeners();
    }
  }
}
