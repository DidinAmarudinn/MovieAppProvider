import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/configs/app_constants.dart';
import 'package:movie_app/widgets/coursel_now_playing.dart';
import 'package:movie_app/widgets/drawer_widget.dart';
import 'package:movie_app/widgets/header_main_page.dart';
import 'package:movie_app/widgets/popular_widget.dart';
import 'package:movie_app/widgets/search_movie.dart';
import 'package:movie_app/widgets/top_rated_widget.dart';
import 'package:movie_app/widgets/upcoming_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    double width = Get.size.width;
    double height = Get.size.height;
    return Scaffold(
      key: _drawerKey,
      backgroundColor:const Color(0xFFE8EDF9),
      drawer:const DrawerWidget(),
      body: SafeArea(
        child: ListView(
          children: [
             HeaderMainPage(
               ontap: (){
                 _drawerKey.currentState!.openDrawer();
               },
             ),
            CarouserSliderNowPlaying(width: width, height: height * 0.3),
            SizedBox(
              height: defaultMargin,
            ),
            SearchMovieWidget(width: width),
            SizedBox(height: defaultMargin,),
            PopularWidget(height: 150, width: width),
            SizedBox(height: defaultMargin,),
            TopRatedWidget(height: 150, width: width),
             SizedBox(height: defaultMargin,),
             UpComingWidget(height: 150, width: width)

          ],
        ),
      ),
    );
  }
}


