import 'package:flutter/material.dart';
import 'package:movie_app/configs/app_constants.dart';
import 'package:shimmer/shimmer.dart';

class ItemMovieShimmer extends StatelessWidget {
  final double height;
  final int index;
  final double width;

  const ItemMovieShimmer(
      {Key? key,
      required this.height,
      required this.width,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: defaultMargin / 2, left: index == 0 ? defaultMargin : 0),
      child: Shimmer.fromColors(
        baseColor: Colors.white,
        highlightColor: Colors.grey.withOpacity(0.1),
        direction: ShimmerDirection.ltr,
        child: Container(
          height: height,
          width: width,
          color: Colors.white,
        ),
      ),
    );
  }
}
