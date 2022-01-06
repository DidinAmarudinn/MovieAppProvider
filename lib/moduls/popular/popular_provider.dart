import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/configs/enum_state.dart';
import 'package:movie_app/models/popular_model.dart';
import 'package:movie_app/moduls/popular/popular_service.dart';

class PopularProvider extends ChangeNotifier {
  final PopularService _service;
  List<ResultPopular>? _popular;
  String _message = "";
  ResponseResult _resultState = ResponseResult.loading;
  String get message => _message;
  PopularProvider(this._service) {
    getPopular();
  }
  ResponseResult get resultState => _resultState;
  List<ResultPopular> get list => _popular!;
  Future<dynamic> getPopular() async {
    try {
      _resultState = ResponseResult.loading;
      notifyListeners();
      final result = await _service.getPopular();
      if (result == null) {
        _resultState = ResponseResult.noData;
        notifyListeners();
        return _message = "No Data";
      } else {
        _resultState = ResponseResult.hasData;
        notifyListeners();
        return _popular = result;
      }
    } catch (e) {
      _resultState = ResponseResult.error;
      notifyListeners();
      return _message = "check your conectivity";
    }
  }

  void retry() {
    getPopular();
  }
}
