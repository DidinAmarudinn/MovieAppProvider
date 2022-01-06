import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/configs/app_constants.dart';
import 'package:movie_app/screens/detail_movie_page.dart';

class BottomSheetInfoMovie extends StatelessWidget {
  final int id;
  final String? overeview;
  final String? year;
  final String imagePath;
  final String? title;
  final bool isAdult;
  const BottomSheetInfoMovie(
      {Key? key,
      required this.id,
      this.overeview,
      this.year,
      this.isAdult = false,
      required this.imagePath,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: defaultMargin / 2, vertical: defaultMargin/2),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  imagePath,
                  height: 150,
                  width: 110,
                  fit: BoxFit.cover,
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return const Text('image error');
                  },
                ),
                SizedBox(
                  width: defaultMargin / 3,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              title!,
                              style: primaryTextStyle.copyWith(
                                fontWeight: bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: defaultMargin / 3,
                          ),
                          GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: const Icon(Icons.close)),
                        ],
                      ),
                      SizedBox(
                        height: defaultMargin / 4,
                      ),
                      Row(
                        children: [
                          Text(
                            year ?? "",
                            style: secondaryTextStyle,
                          ),
                          SizedBox(
                            width: defaultMargin / 3,
                          ),
                          Text(isAdult == true ? "18+" : "",
                              style: secondaryTextStyle),
                        ],
                      ),
                      SizedBox(
                        height: defaultMargin / 3,
                      ),
                      Text(
                        overeview ?? "",
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: primaryTextStyle.copyWith(fontWeight: medium),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: defaultMargin / 2,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 45,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: blueColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    child: TextButton(
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      onPressed: () {
                        Get.to(()=>  DetailMoviePage(movieId: id.toString(),));
                      },
                      child: Center(
                        child: Text(
                          "Detail Film",
                          style: whiteTextStyle.copyWith(
                            fontWeight: semiBold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: defaultMargin,
                ),
                InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Icon(
                        Icons.play_circle_fill_outlined,
                        color: blueColor,
                      ),
                      Text(
                        "Trailer",
                        style: primaryTextStyle,
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
