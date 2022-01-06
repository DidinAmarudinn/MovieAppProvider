import 'package:movie_app/data/network/api.dart';
import 'package:movie_app/models/upcoming_model.dart';

class UpcomingService{
   Future<List<ResultUpcoming>?> getUpcoming() async {
    try {
      final res = await Api.getUpcoming();

      if (res is Map && res.containsKey('results')) {
        final data = res['results'];
        if (data is List) {
          return data
              .map<ResultUpcoming>((u) => ResultUpcoming.fromJson(u))
              .toList();
        }
      }
    } catch (e) {
      return null;
    }
    return null;
  }
}