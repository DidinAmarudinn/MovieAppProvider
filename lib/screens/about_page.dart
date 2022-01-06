import 'package:flutter/material.dart';
import 'package:movie_app/configs/app_constants.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding:  EdgeInsets.all(defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Text(
              "About Page",
              style: primaryTextStyle.copyWith(
                fontWeight: bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: defaultMargin,),
            Text("Didin Amarudin, bismillah semoga lolos test techincal",style: secondaryTextStyle,)
        ],
      ),
          )),
    );
  }
}
