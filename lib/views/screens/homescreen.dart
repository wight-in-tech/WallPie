import 'package:flutter/material.dart';
import 'package:wallpie/controller/apiOperator.dart';
import 'package:wallpie/model/photosModel.dart';
import 'package:wallpie/views/screens/fullScreen.dart';
import 'package:wallpie/views/screens/widgets/categorBlock.dart';
import 'package:wallpie/views/screens/widgets/customappbar.dart';
import 'package:wallpie/views/screens/widgets/searchbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<PhotosModel> trendingWallpList = [];

  Future<void> getTrendingWallpapers() async {
    try {
      List<PhotosModel> wallpapers =
          await ApiOperations.getTrendingWallpapers();
      setState(() {
        trendingWallpList = wallpapers;
      });
    } catch (e) {
      // Handle error (e.g., show an error message)
      print('Error fetching trending wallpapers: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    getTrendingWallpapers();
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
            Container(
              margin: EdgeInsets.symmetric(vertical: 17),
              child: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 30,
                  itemBuilder: (context, index) => CategBlock(),
                ),
              ),
            ),
            Container(
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
                itemCount: trendingWallpList.length,
                itemBuilder: (context, index) => GridTile(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FullScreen(
                                  imageUrl: trendingWallpList[index].imgSrc)));
                    },
                    child: Hero(
                      tag: trendingWallpList[index].imgSrc,
                      child: Container(
                        height: 500,
                        width: 50,
                        color: Colors.purpleAccent,
                        child: Image.network(
                          trendingWallpList[index].imgSrc,
                          height: 500,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
