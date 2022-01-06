import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/configs/app_constants.dart';
import 'package:movie_app/configs/enum_state.dart';
import 'package:movie_app/models/popular_model.dart';
import 'package:movie_app/models/search_model.dart';
import 'package:movie_app/moduls/popular/popular_provider.dart';
import 'package:movie_app/moduls/search/search_provider.dart';
import 'package:movie_app/screens/detail_movie_page.dart';
import 'package:movie_app/widgets/item_top_search.dart';
import 'package:movie_app/widgets/search_textfield.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context);
    final popularProvider = Provider.of<PopularProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(defaultMargin),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      padding: EdgeInsets.all(defaultMargin / 3),
                      decoration: BoxDecoration(
                        color: blueColor,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Icon(
                        Icons.navigate_before,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: defaultMargin / 2,
                  ),
                  Text(
                    "Search",
                    style: primaryTextStyle.copyWith(
                        fontWeight: bold, fontSize: 20),
                  ),
                ],
              ),
            ),
            CustomTextFieldWidget(
              controller: searchController,
              hintText: "Search your favorite movie",
              onchanged: (text) async {
                if (text.isNotEmpty) {
                  await searchProvider.search(text);
                }
              },
            ),
            SizedBox(
              height: defaultMargin,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin / 2),
              child: Text(
                "Pencarian Teratas",
                style: primaryTextStyle.copyWith(
                    fontWeight: semiBold, fontSize: 16),
              ),
            ),
            SizedBox(
              height: defaultMargin / 2,
            ),
            searchProvider.list.isEmpty || searchController.text.isEmpty
                ? popularProvider.resultState == ResponseResult.hasData
                    ? Expanded(
                        child: ListView.builder(
                            itemCount: popularProvider.list.length,
                            itemBuilder: (context, index) {
                              ResultPopular data = popularProvider.list[index];
                              return InkWell(
                                onTap: () {
                                  Get.to(() => DetailMoviePage(
                                      movieId: data.id.toString()));
                                },
                                child: ItemTopSearch(
                                  imagePath: data.posterPath != null
                                      ? 'http://image.tmdb.org/t/p/w185' +
                                          data.posterPath!
                                      : "https://us.123rf.com/450wm/pavelstasevich/pavelstasevich1811/pavelstasevich181101065/112815953-stock-vector-no-image-available-icon-flat-vector.jpg?ver=6",
                                  title: data.title,
                                ),
                              );
                            }),
                      )
                    : const CircularProgressIndicator()
                : Expanded(
                    child: GridView.builder(
                      padding:
                          EdgeInsets.symmetric(horizontal: defaultMargin / 2),
                      itemCount: searchProvider.list.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 3 / 4,
                          crossAxisSpacing: defaultMargin / 2,
                          mainAxisSpacing: defaultMargin / 2),
                      itemBuilder: (context, index) {
                        ResultSearch data = searchProvider.list[index];
                        return GestureDetector(
                          onTap: () {
                            Get.to(() =>
                                DetailMoviePage(movieId: data.id.toString()));
                          },
                          child: Image.network(
                            data.posterPath != null
                                ? 'http://image.tmdb.org/t/p/w185' +
                                    data.posterPath!
                                : "https://us.123rf.com/450wm/pavelstasevich/pavelstasevich1811/pavelstasevich181101065/112815953-stock-vector-no-image-available-icon-flat-vector.jpg?ver=6",
                            height: double.infinity,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
                              return const Text('image error');
                            },
                          ),
                        );
                      },
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
