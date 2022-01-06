import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/configs/enum_state.dart';
import 'package:movie_app/models/now_playing_model.dart';
import 'package:movie_app/models/search_model.dart';
import 'package:movie_app/moduls/now_playing/now_playing_service.dart';
import 'package:movie_app/moduls/search/search_service.dart';

class SearchProvider extends ChangeNotifier {
  final SearchService _service;
  List<ResultSearch> _search = [];
  String _messageNowPlaying = "";
  ResponseResult _resultState = ResponseResult.loading;
  String get messageNowPlaying => _messageNowPlaying;
  SearchProvider(this._service);
  ResponseResult get resultState => _resultState;
  List<ResultSearch> get list => _search;
  Future<dynamic> search(String query) async {
    try {
      _resultState = ResponseResult.loading;
      notifyListeners();
      final result = await _service.search(query);
      if (result == null) {
        _resultState = ResponseResult.noData;
        notifyListeners();
        return _messageNowPlaying = "No Data";
      } else {
        _resultState = ResponseResult.hasData;
        notifyListeners();
        return _search = result;
      }
    } catch (e) {
      _resultState = ResponseResult.error;
      notifyListeners();
      return _messageNowPlaying = "check your conectivity";
    }
  }

 
}
