import 'package:movie_app/data/network/api.dart';
import 'package:movie_app/models/popular_model.dart';

class PopularService{
   Future<List<ResultPopular>?> getPopular() async {
    try {
      final res = await Api.getPopular();

      if (res is Map && res.containsKey('results')) {
        final data = res['results'];
        if (data is List) {
          return data
              .map<ResultPopular>((u) => ResultPopular.fromJson(u))
              .toList();
        }
      }
    } catch (e) {
      return null;
    }
    return null;
  }
}