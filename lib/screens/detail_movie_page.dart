import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/configs/app_constants.dart';
import 'package:movie_app/configs/enum_state.dart';
import 'package:movie_app/data/network/api.dart';
import 'package:movie_app/moduls/detail_movie/detail_movie_provider.dart';
import 'package:movie_app/widgets/genres_widget.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailMoviePage extends StatefulWidget {
  final String movieId;
  const DetailMoviePage({Key? key, required this.movieId}) : super(key: key);

  @override
  _DetailMoviePageState createState() => _DetailMoviePageState();
}

class _DetailMoviePageState extends State<DetailMoviePage> {
  final List<String> _ids = [
    'nPt8bK2gbaU',
    'gQDByCdjUXw',
    'iLnmTe5Q2Qw',
    '_WoCV4c6XOE',
    'KmzdUe0RSJo',
    '6jZDSSZZxjQ',
    'p2lYr3vM_1w',
    '7QUtEmBT_-w',
    '34_PXCzGw1M',
  ];
  YoutubePlayerController? _controller;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Provider.of<DetailMovieProvider>(context, listen: false)
          .getDetail(widget.movieId);
    });
  }

  void getDetailMovie(String movieId) {}

  @override
  Widget build(BuildContext context) {
    final detailMovieProvider = Provider.of<DetailMovieProvider>(context);
    double height = Get.size.height;
    return Scaffold(
      body: SafeArea(
        child: detailMovieProvider.resultState == ResponseResult.hasData
            ? ListView(
                children: [
                  detailMovieProvider.list == null
                      ? Container(
                          height: height * 0.3,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                detailMovieProvider.detailMovie!.posterPath ??
                                    "https://us.123rf.com/450wm/pavelstasevich/pavelstasevich1811/pavelstasevich181101065/112815953-stock-vector-no-image-available-icon-flat-vector.jpg?ver=6",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      : YoutubePlayer(
                          controller: YoutubePlayerController(
                            initialVideoId: detailMovieProvider.list![0].key!,
                            flags: const YoutubePlayerFlags(
                              hideControls: false,
                              controlsVisibleAtStart: true,
                              autoPlay: false,
                              mute: false,
                            ),
                          ),
                          showVideoProgressIndicator: true,
                          progressIndicatorColor: blueColor,
                        ),
                  SizedBox(
                    height: defaultMargin / 2,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: defaultMargin / 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          detailMovieProvider.detailMovie!.title ?? "",
                          style: primaryTextStyle.copyWith(
                              fontWeight: bold, fontSize: 20),
                        ),
                        SizedBox(
                          height: defaultMargin / 2,
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(defaultMargin / 4),
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.4)),
                              child: Text(
                                detailMovieProvider.detailMovie!.releaseDate ??
                                    "",
                                style: whiteTextStyle,
                              ),
                            ),
                            SizedBox(
                              width: defaultMargin / 3,
                            ),
                            Text(
                              detailMovieProvider.detailMovie!.adult ?? false
                                  ? "18+"
                                  : "Semua Umur",
                              style: secondaryTextStyle,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: defaultMargin / 4,
                        ),
                        Text(
                          detailMovieProvider.detailMovie!.overview ?? "",
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: primaryTextStyle.copyWith(
                            height: 1.4,
                            fontWeight: light,
                          ),
                        ),
                        SizedBox(
                          height: defaultMargin / 4,
                        ),
                        detailMovieProvider.detailMovie!.genres != null
                            ? GeneresWidget(
                                list: detailMovieProvider.detailMovie!.genres!)
                            : const SizedBox(),
                        SizedBox(
                          height: defaultMargin / 4,
                        ),
                        Text(
                          "Budget: " +
                              detailMovieProvider.detailMovie!.budget
                                  .toString(),
                          style: secondaryTextStyle,
                        )
                      ],
                    ),
                  )
                ],
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
