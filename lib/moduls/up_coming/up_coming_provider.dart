import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/configs/enum_state.dart';
import 'package:movie_app/models/upcoming_model.dart';
import 'package:movie_app/moduls/up_coming/up_coming_service.dart';

class UpcomingProvider extends ChangeNotifier {
  final UpcomingService _service;
  List<ResultUpcoming>? _upcoming;
  String _message = "";
  ResponseResult _resultState = ResponseResult.loading;
  String get message => _message;
  UpcomingProvider(this._service) {
    getUpcoming();
  }
  ResponseResult get resultState => _resultState;
  List<ResultUpcoming> get list => _upcoming!;
  Future<dynamic> getUpcoming() async {
    try {
      _resultState = ResponseResult.loading;
      notifyListeners();
      final result = await _service.getUpcoming();
      if (result == null) {
        _resultState = ResponseResult.noData;
        notifyListeners();
        return _message = "No Data";
      } else {
        _resultState = ResponseResult.hasData;
        notifyListeners();
        return _upcoming = result;
      }
    } catch (e) {
      _resultState = ResponseResult.error;
      notifyListeners();
      return _message = "check your conectivity";
    }
  }

  void retry() {
    getUpcoming();
  }
}
