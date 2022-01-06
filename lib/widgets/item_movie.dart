import 'package:flutter/material.dart';
import 'package:movie_app/configs/app_constants.dart';

class ItemMovie extends StatelessWidget {
  final String imagePath;
  final double height;
  final int index;
  final double width;

  const ItemMovie(
      {Key? key,
      required this.imagePath,
      required this.height,
      required this.width,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(right: defaultMargin/2,left: index==0?defaultMargin:0),
      child: Image.network(
        imagePath,
        height: height,
        width: width,
        fit: BoxFit.cover,
        errorBuilder:
            (BuildContext context, Object exception, StackTrace? stackTrace) {
          
          return const Text('image error');
        },
      ),
    );
  }
}
