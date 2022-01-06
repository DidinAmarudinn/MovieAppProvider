import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/configs/app_constants.dart';
import 'package:movie_app/configs/enum_state.dart';
import 'package:movie_app/moduls/now_playing/now_playing_provider.dart';
import 'package:movie_app/moduls/now_playing/selected_index_provider.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import 'bottom_sheet_info_movie.dart';

class CarouserSliderNowPlaying extends StatelessWidget {
  final double width;
  final double height;
  const CarouserSliderNowPlaying(
      {Key? key, required this.width, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NowPlayingProvider>(context);
    final selectIndex = Provider.of<SelectedIndexProvider>(context);
    return provider.resultState == ResponseResult.hasData
        ? SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: defaultMargin, vertical: defaultMargin / 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Now Playing",
                        style: primaryTextStyle.copyWith(
                            fontWeight: semiBold, fontSize: 16),
                      ),
                      Text(
                        "See More",
                        style: secondaryTextStyle.copyWith(),
                      )
                    ],
                  ),
                ),
                Column(children: [
                  CarouselSlider(
                    items: provider.list
                        .sublist(0, provider.list.length.clamp(0, 5))
                        .map(
                          (e) => GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  builder: (BuildContext context) {
                                    return Wrap(
                                      children: [
                                        BottomSheetInfoMovie(
                                          id: e.id!,
                                          imagePath: e.backdropPath != null
                                              ? 'http://image.tmdb.org/t/p/w185' +
                                                  e.posterPath!
                                              : "https://us.123rf.com/450wm/pavelstasevich/pavelstasevich1811/pavelstasevich181101065/112815953-stock-vector-no-image-available-icon-flat-vector.jpg?ver=6",
                                          title: e.title ?? "",
                                          isAdult: e.adult ?? false,
                                          year: e.releaseDate ?? "",
                                          overeview: e.overview ?? "",
                                        ),
                                      ],
                                    );
                                  });
                            },
                            child: SizedBox(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: e.posterPath == null
                                    ? const Image(
                                        image: NetworkImage(
                                            "https://us.123rf.com/450wm/pavelstasevich/pavelstasevich1811/pavelstasevich181101065/112815953-stock-vector-no-image-available-icon-flat-vector.jpg?ver=6"),
                                      )
                                    : Image.network(
                                        "http://image.tmdb.org/t/p/w500" +
                                            e.posterPath!,
                                        fit: BoxFit.cover,
                                        width: width,
                                        height: height,
                                        loadingBuilder:
                                            (context, child, loadingProgress) =>
                                                (loadingProgress == null)
                                                    ? child
                                                    : const SizedBox(),
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                const SizedBox(),
                                      ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        aspectRatio: 2.0,
                        onPageChanged: (index, reason) {
                          selectIndex.changeIndex(index);
                        }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: provider.list
                        .sublist(0, provider.list.length.clamp(0, 5))
                        .asMap()
                        .entries
                        .map((entry) {
                      return Container(
                        width: selectIndex.index == entry.key ? 25.0 : 8,
                        height: 8,
                        margin: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: selectIndex.index == entry.key
                                ? Colors.black.withOpacity(0.9)
                                : Colors.black.withOpacity(0.4)),
                      );
                    }).toList(),
                  ),
                ])
              ],
            ),
          )
        : Shimmer.fromColors(
            baseColor: Colors.white,
            highlightColor: Colors.grey.withOpacity(0.04),
            direction: ShimmerDirection.ltr,
            child: Container(
              height: height,
              width: width,
              color: Colors.white,
            ),
          );
  }
}
