import 'package:movie_app/data/network/api.dart';
import 'package:movie_app/models/trailer_model.dart';

class TrailerMovieService{
   Future<List<ResultTrailer>?> getTrailer(String movieId) async {
    try {
      final res = await Api.getTrailer(movieId);

      if (res is Map && res.containsKey('results')) {
        final data = res['results'];
        if (data is List) {
          return data
              .map<ResultTrailer>((u) => ResultTrailer.fromJson(u))
              .toList();
        }
      }
    } catch (e) {
      return null;
    }
    return null;
  }
}