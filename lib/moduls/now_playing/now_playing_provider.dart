import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/configs/enum_state.dart';
import 'package:movie_app/models/now_playing_model.dart';
import 'package:movie_app/moduls/now_playing/now_playing_service.dart';

class NowPlayingProvider extends ChangeNotifier {
  final NowPlayingService _service;
  List<ResultNowPlaying>? _nowPlaying;
  String _messageNowPlaying = "";
  ResponseResult _resultState = ResponseResult.loading;
  String get messageNowPlaying => _messageNowPlaying;
  NowPlayingProvider(this._service) {
    getNowPlaying();
  }
  ResponseResult get resultState => _resultState;
  List<ResultNowPlaying> get list => _nowPlaying!;
  Future<dynamic> getNowPlaying() async {
    try {
      _resultState = ResponseResult.loading;
      notifyListeners();
      final result = await _service.getNowPlaying();
      if (result == null) {
        _resultState = ResponseResult.noData;
        notifyListeners();
        return _messageNowPlaying = "No Data";
      } else {
        _resultState = ResponseResult.hasData;
        notifyListeners();
        return _nowPlaying = result;
      }
    } catch (e) {
      _resultState = ResponseResult.error;
      notifyListeners();
      return _messageNowPlaying = "check your conectivity";
    }
  }

  void retry() {
    getNowPlaying();
  }
}
