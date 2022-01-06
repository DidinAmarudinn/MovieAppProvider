
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/configs/app_constants.dart';

class ItemTopSearch extends StatelessWidget {
  final String imagePath;
  final String? title;
  const ItemTopSearch({Key? key, required this.imagePath, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: Get.size.width,
      padding: EdgeInsets.symmetric(vertical: defaultMargin / 3),
      child: Row(
        children: [
          Image.network(
            imagePath,
            height: 100,
            width: 120,
            fit: BoxFit.cover,
            errorBuilder: (BuildContext context, Object exception,
                StackTrace? stackTrace) {
              return const Text('image error');
            },
          ),
          SizedBox(
            width: defaultMargin / 2,
          ),
          Expanded(
            child: Text(
              title ?? "",
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
          ),
            SizedBox(
            width: defaultMargin / 2,
          ),
        ],
      ),
    );
  }
}
