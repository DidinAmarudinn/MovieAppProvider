import 'package:movie_app/data/network/api.dart';
import 'package:movie_app/models/top_rated_model.dart';

class TopRatedService{
   Future<List<ResultTopRated>?> getTopRated() async {
    try {
      final res = await Api.getTopRated();

      if (res is Map && res.containsKey('results')) {
        final data = res['results'];
        if (data is List) {
          return data
              .map<ResultTopRated>((u) => ResultTopRated.fromJson(u))
              .toList();
        }
      }
    } catch (e) {
      return null;
    }
    return null;
  }
}