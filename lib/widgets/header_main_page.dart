import 'package:flutter/material.dart';
import 'package:movie_app/configs/app_constants.dart';

class HeaderMainPage extends StatelessWidget {
  final VoidCallback ontap;
  const HeaderMainPage({
    Key? key,required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(defaultMargin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello",
                style: secondaryTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
              Text(
                "Didin Amarudin",
                style: primaryTextStyle.copyWith(
                  fontWeight: bold,
                  fontSize: 20,
                ),
              )
            ],
          ),
          GestureDetector(
            onTap: ontap,
            child: const Icon(
              Icons.menu,
              size: 25,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}