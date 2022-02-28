import 'package:codesnipet/utils/api/client.dart';
import 'package:codesnipet/utils/model/code_snipets.dart';
import 'package:flutter/material.dart';

enum FetcherState { loading, loaded, noloaded, failed }

class FetchController with ChangeNotifier {
  List<CodeSnip> _data = [];
  FetcherState _state = FetcherState.noloaded;
  FetcherState get state => _state;
  List<CodeSnip> get data => _data;

  Future fetchData(int limit, int site) async {
    _state = FetcherState.loading;
    notifyListeners();
    Map data = await ApiClient().getAllSnipets(limit, site);
    print(data);
    if (data["error"] == true) {
      _state = FetcherState.failed;
      notifyListeners();
    } else {
      List<CodeSnip> codeSnippets = [];
      for (var snipet in data["data"]) {
        codeSnippets.add(CodeSnip.fromJson(snipet));
      }
      _data = codeSnippets;
      _state = FetcherState.loaded;
      notifyListeners();
    }
  }

  removeCode(String id) {
    _data.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
