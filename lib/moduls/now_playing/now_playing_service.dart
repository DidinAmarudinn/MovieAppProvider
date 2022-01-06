import 'package:movie_app/data/network/api.dart';
import 'package:movie_app/models/now_playing_model.dart';

class NowPlayingService{
    Future<List<ResultNowPlaying>?> getNowPlaying() async {
    try {
      final res = await Api.getNowPlaying();

      if (res is Map && res.containsKey('results')) {
        final data = res['results'];
        if (data is List) {
          return data
              .map<ResultNowPlaying>((u) => ResultNowPlaying.fromJson(u))
              .toList();
        }
      }
    } catch (e) {
      return null;
    }
    return null;
  }

}