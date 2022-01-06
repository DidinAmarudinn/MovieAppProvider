import 'package:movie_app/data/network/api.dart';
import 'package:movie_app/models/search_model.dart';

class SearchService{
   Future<List<ResultSearch>?> search(String query) async {
    try {
      final res = await Api.search(query);

      if (res is Map && res.containsKey('results')) {
        final data = res['results'];
        if (data is List) {
          return data
              .map<ResultSearch>((u) => ResultSearch.fromJson(u))
              .toList();
        }
      }
    } catch (e) {
      return null;
    }
    return null;
  }
}