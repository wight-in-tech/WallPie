import 'package:flutter/material.dart';
import 'package:wallpie/controller/apiOperator.dart';
import 'package:wallpie/model/photosModel.dart';
import 'package:wallpie/views/screens/fullScreen.dart';
import 'package:wallpie/views/screens/widgets/customappbar.dart';
import 'package:wallpie/views/screens/widgets/searchbar.dart';

class SearchScreen extends StatefulWidget {
  String query;
  SearchScreen({Key? key, required this.query}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late Future<List<PhotosModel>> searchResults;

  @override
  void initState() {
    super.initState();
    searchResults = ApiOperations.searchWallpapers(widget.query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: CustomAppBar(
          word1: "Wall",
          word2: "Pie",
        ),
        backgroundColor: Colors.white24,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Search_Bar(),
              padding: EdgeInsets.symmetric(horizontal: 10),
            ),
            SizedBox(
              height: 10,
            ),
            FutureBuilder<List<PhotosModel>>(
              future: searchResults,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No search results.'));
                } else {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    height: MediaQuery.of(context).size.height,
                    child: GridView.builder(
                      physics: BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 250,
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) => GridTile(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FullScreen(
                                        imageUrl:
                                            snapshot.data![index].imgSrc)));
                          },
                          child: Hero(
                            tag: snapshot.data![index].imgSrc,
                            child: Container(
                              height: 500,
                              width: 50,
                              color: Colors.purpleAccent,
                              child: Image.network(
                                height: 500,
                                width: 50,
                                fit: BoxFit.cover,
                                snapshot.data![index].imgSrc,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
