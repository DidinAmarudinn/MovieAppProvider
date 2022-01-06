import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/configs/app_constants.dart';
import 'package:movie_app/screens/search_page.dart';

class SearchMovieWidget extends StatelessWidget {
  const SearchMovieWidget({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Browse Movie",
            style: primaryTextStyle.copyWith(
                fontSize: 20, fontWeight: semiBold),
          ),
          SizedBox(
            height: defaultMargin / 2,
          ),
          InkWell(
            onTap: (){
              Get.to(()=> const SearchPage());
            },
            child: Container(
              height: 50,
              padding:
                  EdgeInsets.symmetric(horizontal: defaultMargin / 2),
              width: width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: 25,
                  ),
                  SizedBox(
                    width: defaultMargin / 3,
                  ),
                  Text(
                    "Search for name movie",
                    style: secondaryTextStyle,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}