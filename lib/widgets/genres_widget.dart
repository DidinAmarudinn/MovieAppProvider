import 'package:flutter/material.dart';
import 'package:movie_app/configs/app_constants.dart';
import 'package:movie_app/models/detail_movie_model.dart';

class GeneresWidget extends StatelessWidget {
  final List<Genre> list;
  const GeneresWidget({ Key? key,required this.list }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: list.map((e) => Container(
        padding: EdgeInsets.all(defaultMargin/3),
        margin: EdgeInsets.only(right:defaultMargin/4),
        decoration:BoxDecoration(
          color: blueColor,
          borderRadius: BorderRadius.circular(2)
        ),
        child: Text(e.name??"",style:whiteTextStyle,))).toList(),
    );
  }
}