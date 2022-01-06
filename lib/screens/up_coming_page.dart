import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/configs/app_constants.dart';
import 'package:movie_app/configs/enum_state.dart';
import 'package:movie_app/models/upcoming_model.dart';
import 'package:movie_app/moduls/up_coming/up_coming_provider.dart';
import 'package:provider/provider.dart';

class UpComingPage extends StatelessWidget {
  const UpComingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UpcomingProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: provider.resultState == ResponseResult.hasData
            ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Padding(
                   padding:  EdgeInsets.all(defaultMargin),
                   child: Row(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                        GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        padding: EdgeInsets.all(defaultMargin/3),
                        decoration: BoxDecoration(
                          color: blueColor,
                          borderRadius:BorderRadius.circular(6),
                        ),
                        child: const Icon(
                          Icons.navigate_before,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: defaultMargin/2,),
                    Text("Up Coming",style: primaryTextStyle.copyWith(fontWeight: bold,fontSize: 20),),
                     ],
                   ),
                 ),
                  Expanded(
                    child: GridView.builder(
                      padding:
                          EdgeInsets.symmetric(horizontal: defaultMargin / 2),
                      itemCount: provider.list.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 3 / 4,
                          crossAxisSpacing: defaultMargin / 2,
                          mainAxisSpacing: defaultMargin / 2),
                      itemBuilder: (context, index) {
                        ResultUpcoming data = provider.list[index];
                        return Image.network(
                          data.posterPath != null
                              ? 'http://image.tmdb.org/t/p/w185' +
                                  data.posterPath!
                              : "https://us.123rf.com/450wm/pavelstasevich/pavelstasevich1811/pavelstasevich181101065/112815953-stock-vector-no-image-available-icon-flat-vector.jpg?ver=6",
                          height: double.infinity,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                            return const Text('image error');
                          },
                        );
                      },
                    ),
                  ),
                ],
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
