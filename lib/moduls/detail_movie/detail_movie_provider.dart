import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/configs/enum_state.dart';
import 'package:movie_app/models/detail_movie_model.dart';
import 'package:movie_app/models/trailer_model.dart';
import 'package:movie_app/moduls/detail_movie/detail_movie_service.dart';
import 'package:movie_app/moduls/detail_movie/trailer_movie_service.dart';

class DetailMovieProvider extends ChangeNotifier {
  final DetailMovieService _service;
  final TrailerMovieService _trailerMovieService;
  DetailMovieModel? _detailMovieModel;
  List<ResultTrailer>? _trailer;
  String _messageNowPlaying = "";
  ResponseResult _resultState = ResponseResult.loading;
  String get messageNowPlaying => _messageNowPlaying;
  DetailMovieProvider(this._service, this._trailerMovieService) ;
  ResponseResult get resultState => _resultState;
  DetailMovieModel? get detailMovie => _detailMovieModel;
  List<ResultTrailer>? get  list => _trailer;
  Future<dynamic> getDetail(String movieId) async {
    try {
      _resultState = ResponseResult.loading;
      notifyListeners();
      final result = await _service.getDetailMovie(movieId);
      final trailer = await _trailerMovieService.getTrailer(movieId);
      if (result == null || trailer == null) {
        _resultState = ResponseResult.noData;
        notifyListeners();
        return _messageNowPlaying = "No Data";
      } else {
        _resultState = ResponseResult.hasData;
        notifyListeners();
       _detailMovieModel = result;
       _trailer = trailer;
      }
    } catch (e) {
      _resultState = ResponseResult.error;
      notifyListeners();
      return _messageNowPlaying = "check your conectivity";
    }
  }

  void retry(String movieId) {
    getDetail(movieId);
  }
}
