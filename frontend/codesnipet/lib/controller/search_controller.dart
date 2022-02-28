import 'package:codesnipet/utils/api/client.dart';
import 'package:codesnipet/utils/model/code_snipets.dart';
import 'package:flutter/cupertino.dart';

enum SearchState { searching, notSearching, idle, failed }

class SearchController with ChangeNotifier {
  List<CodeSnip> _searchResult = [];
  SearchState _state = SearchState.notSearching;
  SearchState get state => _state;
  List<CodeSnip> get searchResult => _searchResult;

  Future search(String searchTerm) async {
    _state = SearchState.searching;
    notifyListeners();
    Map response = await ApiClient().searchCode(searchTerm);
    if (response["error"] == true) {
      _state = SearchState.failed;
      notifyListeners();
    } else {
      for (var x in response["data"]) {
        _searchResult.add(CodeSnip.fromJson(x));
      }
      _state = SearchState.idle;
      notifyListeners();
    }
  }
}
