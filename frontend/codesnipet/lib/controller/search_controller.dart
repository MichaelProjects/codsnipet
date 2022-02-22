import 'package:codesnipet/utils/model/code_snipets.dart';
import 'package:flutter/cupertino.dart';

enum SearchState {
  searching,
  notSearching,
}

class SearchController with ChangeNotifier {
  List<CodeSnip> _searchResult = [];
  SearchState _state = SearchState.notSearching;
  SearchState get state => _state;
  List<CodeSnip> get searchResult => _searchResult;

  Future search(String searchTerm) async {
    _state = SearchState.searching;
    notifyListeners();
    print('searching');
    print(searchTerm);
    Future.delayed(Duration(seconds: 3));
    _state = SearchState.notSearching;
    notifyListeners();
  }
}
