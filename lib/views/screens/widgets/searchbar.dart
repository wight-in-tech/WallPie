import 'package:flutter/material.dart';
import 'package:wallpie/views/screens/search.dart';

// ignore: must_be_immutable
class Search_Bar extends StatelessWidget {
  Search_Bar({Key? key});
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 204, 214, 225),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: Colors.white12),
          SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: _searchController,
              style: TextStyle(color: Colors.black.withOpacity(0.8)),
              decoration: InputDecoration(
                hintText: "Search Wallpapers",
                hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                border: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              String query = _searchController.text;
              _searchController
                  .clear(); // Clear the text after extracting the query
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchScreen(query: query)),
              );
            },
            child: Icon(Icons.search, color: Colors.black.withOpacity(0.5)),
          ),
        ],
      ),
    );
  }
}
