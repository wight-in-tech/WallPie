import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wallpie/model/photosModel.dart';

class ApiOperations {
  static List<PhotosModel> trendingWallpapers = [];
  static List<PhotosModel> searchedWallpaperList = [];
  static Future<List<PhotosModel>> getTrendingWallpapers() async {
    {
      await http.get(
        Uri.parse("https://api.pexels.com/v1/curated"),
        headers: {
          "Authorization":
              "epReSpGEqTCzXOEBkd6N3nt3OtfVbQUboyEy7uskoOhivNEuzW8t0Wic",
        },
      ).then((value) {
        Map<String, dynamic> jsonData = jsonDecode(value.body);
        List photos = jsonData['photos'];
        photos.forEach((element) {
          trendingWallpapers.add(PhotosModel.fromAPItoApp(element));
        });
      });
    }
    return trendingWallpapers;
  }

  static Future<List<PhotosModel>> searchWallpapers(String query) async {
    {
      await http.get(
        Uri.parse(
            "https://api.pexels.com/v1/search?query=$query&per_page=30&page=1"),
        headers: {
          "Authorization":
              "epReSpGEqTCzXOEBkd6N3nt3OtfVbQUboyEy7uskoOhivNEuzW8t0Wic",
        },
      ).then((value) {
        Map<String, dynamic> jsonData = jsonDecode(value.body);

        List photos = jsonData['photos'];
        searchedWallpaperList.clear();
        photos.forEach((element) {
          searchedWallpaperList.add(PhotosModel.fromAPItoApp(element));
        });
      });
    }
    return searchedWallpaperList;
  }
}
