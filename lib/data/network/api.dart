import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/models/detail_movie_model.dart';

part 'api_constant.dart';
part 'api_exception.dart';
part 'api_handler.dart';

class Api {
  static final ApiHandler _handler = ApiHandler();

  static Future getNowPlaying() async {
    return await _handler.get(nowPlayingUrl);
  }

  static Future getPopular() async {
    return await _handler.get(popularUrl);
  }

  static Future getTopRated() async {
    return await _handler.get(topRatedUrl);
  }

  static Future getUpcoming() async {
    return await _handler.get(upcomingUrl);
  }

  static Future getTrailer(String movieId) async{
    return await _handler.get(baseUrl+"/"+movieId+trailerUrl);
  }
  static Future getDetailMovie(String movieId) async{
    return await _handler.get(baseUrl+"/"+movieId+detailMovieUrl);
  }
  static Future search(String query) async{
    return await _handler.get(searchUrl+query+"&page=1&include_adult=true");
  }


  static Future<DetailMovieModel?> getDetail(String movieId)async{
    String token ="";
    final response =await http.get(Uri.parse(baseUrl+"/"+movieId+detailMovieUrl),headers: {
      "authorization": "Bearer " + token,

    });
    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      return DetailMovieModel.fromJson(data);
    }
    return null;
  }
}
