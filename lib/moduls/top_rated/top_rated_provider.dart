import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/configs/enum_state.dart';
import 'package:movie_app/models/top_rated_model.dart';
import 'package:movie_app/moduls/top_rated/top_rated_service.dart';

class TopRatedProvider extends ChangeNotifier {
  final TopRatedService _service;
  List<ResultTopRated>? _topRated;
  String _message = "";
  ResponseResult _resultState = ResponseResult.loading;
  String get message => _message;
  TopRatedProvider(this._service) {
    getTopRated();
  }
  ResponseResult get resultState => _resultState;
  List<ResultTopRated> get list => _topRated!;
  Future<dynamic> getTopRated() async {
    try {
      _resultState = ResponseResult.loading;
      notifyListeners();
      final result = await _service.getTopRated();
      if (result == null) {
        _resultState = ResponseResult.noData;
        notifyListeners();
        return _message = "No Data";
      } else {
        _resultState = ResponseResult.hasData;
        notifyListeners();
        return _topRated = result;
      }
    } catch (e) {
      _resultState = ResponseResult.error;
      notifyListeners();
      return _message = "check your conectivity";
    }
  }

  void retry() {
    getTopRated();
  }
}
