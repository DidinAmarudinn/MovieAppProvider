import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:movie_app/moduls/detail_movie/detail_movie_provider.dart';
import 'package:movie_app/moduls/detail_movie/detail_movie_service.dart';
import 'package:movie_app/moduls/detail_movie/trailer_movie_service.dart';
import 'package:movie_app/moduls/now_playing/now_playing_provider.dart';
import 'package:movie_app/moduls/now_playing/now_playing_service.dart';
import 'package:movie_app/moduls/now_playing/selected_index_provider.dart';
import 'package:movie_app/moduls/popular/popular_provider.dart';
import 'package:movie_app/moduls/popular/popular_service.dart';
import 'package:movie_app/moduls/search/search_provider.dart';
import 'package:movie_app/moduls/search/search_service.dart';
import 'package:movie_app/moduls/top_rated/top_rated_provider.dart';
import 'package:movie_app/moduls/top_rated/top_rated_service.dart';
import 'package:movie_app/moduls/up_coming/up_coming_service.dart';
import 'package:movie_app/screens/main_page.dart';
import 'package:provider/provider.dart';

import 'moduls/up_coming/up_coming_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => NowPlayingProvider(
            NowPlayingService(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => PopularProvider(
            PopularService(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => TopRatedProvider(
            TopRatedService(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => UpcomingProvider(
            UpcomingService(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => SearchProvider(
            SearchService(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => DetailMovieProvider(
            DetailMovieService(),
            TrailerMovieService()
          ),
        ),
        ChangeNotifierProvider(create: (_) => SelectedIndexProvider(),),
      ],
      child: GetMaterialApp(
        title: 'Movie App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MainPage(),
      ),
    );
  }
}
