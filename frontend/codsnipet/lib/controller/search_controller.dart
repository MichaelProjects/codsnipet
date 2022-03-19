import 'package:codsnipet/utils/api/client.dart';
import 'package:codsnipet/utils/model/code_snipets.dart';
import 'package:flutter/cupertino.dart';

enum SearchState { searching, idle, failed, nothing }

class SearchController with ChangeNotifier {
  List<CodeSnip> _searchResult = [];
  SearchState _state = SearchState.idle;
  SearchState get state => _state;
  List<CodeSnip> get searchResult => _searchResult;

  Future search(String searchTerm) async {
    if (searchTerm.trim() == "") {
      _searchResult = [];
      _state = SearchState.idle;
      notifyListeners();
    } else {
      List<CodeSnip> result = [];
      _state = SearchState.searching;
      Map response = await ApiClient().searchCode(searchTerm);
      if (response["error"] == true) {
        _state = SearchState.failed;
      } else {
        if (response["data"].length == 0) {
          _state = SearchState.nothing;
          notifyListeners();
        } else {
          for (var x in response["data"]) {
            result.add(CodeSnip.fromJson(x));
          }
          _searchResult = result;
          _state = SearchState.idle;
          notifyListeners();
        }
      }
    }
  }
}
