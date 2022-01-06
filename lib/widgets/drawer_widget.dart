import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/configs/app_constants.dart';
import 'package:movie_app/screens/about_page.dart';
import 'package:movie_app/screens/now_playing_page.dart';
import 'package:movie_app/screens/top_rated_page.dart';
import 'package:movie_app/screens/up_coming_page.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          _drawerHeader(context),
          _drawerItem(Icons.home, "Home", () {Get.back();}),
          _drawerItem(Icons.show_chart_outlined, "Top Rated", () {
            Get.to(()=> const TopRatedPage());
          }),
          _drawerItem(Icons.play_circle_outline, "Now Playing", () {
            Get.to(()=> const NowPlayingPage());
          }),
          _drawerItem(Icons.live_tv_outlined, "Up Coming", () {
             Get.to(()=> const UpComingPage());
          }),
           _drawerItem(Icons.star_border, "Popular Movie", () {
             Get.to(()=> const UpComingPage());
          }),
          const Divider(
            height: 2,
            color: Colors.grey,
          ),
           _drawerItem(Icons.info_outline_rounded, "About", () {
             Get.to(()=>const AboutPage());
           }),
        ],
      ),
    );
  }

  Widget _drawerHeader(BuildContext context) {
    return Container(
      color: blueColor,
      height: Get.size.height * 0.2,
      padding: EdgeInsets.all(defaultMargin/2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Movie App",style: whiteTextStyle.copyWith(fontSize: 24,fontWeight: bold,),),
          Text("Version : Beta",style: whiteTextStyle,)
        ],
      ),
    );
  }

  Widget _drawerItem(IconData icon, String text, GestureTapCallback onTap) {
    return ListTile(
      
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Icon(icon,size: 25,),
          Padding(
            padding:
                EdgeInsets.only(left: defaultMargin, bottom: defaultMargin / 2),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: primaryTextStyle.copyWith(fontWeight: semiBold),
            ),
          ),
        ],
      ),
      onTap: onTap,
    );
  }
}
