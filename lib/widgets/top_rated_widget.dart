import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/configs/app_constants.dart';
import 'package:movie_app/configs/enum_state.dart';
import 'package:movie_app/models/top_rated_model.dart';
import 'package:movie_app/moduls/top_rated/top_rated_provider.dart';
import 'package:movie_app/screens/top_rated_page.dart';
import 'package:movie_app/widgets/bottom_sheet_info_movie.dart';
import 'package:movie_app/widgets/item_movie.dart';
import 'package:movie_app/widgets/item_movie_shimmer.dart';
import 'package:provider/provider.dart';

class TopRatedWidget extends StatelessWidget {
  final double height;
  final double width;
  const TopRatedWidget({Key? key, required this.height, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final topRatedProvider = Provider.of<TopRatedProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Top Rated",
                style: primaryTextStyle.copyWith(
                    fontWeight: semiBold, fontSize: 16),
              ),
              GestureDetector(
                onTap: (){
                  Get.to(()=> const TopRatedPage());
                },
                child: Text(
                  "See More",
                  style: secondaryTextStyle.copyWith(),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: defaultMargin / 2,
        ),
        SizedBox(
          height: height,
          width: width,
          child: topRatedProvider.resultState == ResponseResult.hasData
              ? ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: topRatedProvider.list.length,
                  itemBuilder: (context, index) {
                    ResultTopRated data = topRatedProvider.list[index];
                    return InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (BuildContext context) {
                              return Wrap(
                                children: [
                                  BottomSheetInfoMovie(
                                    id: data.id!,
                                    imagePath: data.posterPath != null
                                        ? 'http://image.tmdb.org/t/p/w185' +
                                            data.posterPath!
                                        : "https://us.123rf.com/450wm/pavelstasevich/pavelstasevich1811/pavelstasevich181101065/112815953-stock-vector-no-image-available-icon-flat-vector.jpg?ver=6",
                                    title: data.title ?? "",
                                    isAdult: data.adult ?? false,
                                    year: data.releaseDate ?? "",
                                    overeview: data.overview ?? "",
                                  ),
                                ],
                              );
                            });
                      },
                      child: ItemMovie(
                        imagePath: data.posterPath != null
                            ? 'http://image.tmdb.org/t/p/w185' +
                                data.posterPath!
                            : "https://us.123rf.com/450wm/pavelstasevich/pavelstasevich1811/pavelstasevich181101065/112815953-stock-vector-no-image-available-icon-flat-vector.jpg?ver=6",
                        height: height,
                        width: 110,
                        index: index,
                      ),
                    );
                  },
                )
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return ItemMovieShimmer(
                        height: height, width: 110, index: index);
                  },
                ),
        ),
      ],
    );
  }
}
