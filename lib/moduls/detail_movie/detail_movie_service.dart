import 'package:movie_app/data/network/api.dart';
import 'package:movie_app/models/detail_movie_model.dart';

class DetailMovieService {
  Future<DetailMovieModel?> getDetailMovie(String movieId) async {
    try {
      final res = await Api.getDetailMovie(movieId);

      if (res is Map<String, dynamic> && res.containsKey('id')) {
        return DetailMovieModel.fromJson(res);
      }
    } catch (e) {
      return null;
    }
    return null;
  }
}
