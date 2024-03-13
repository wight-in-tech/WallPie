import 'package:flutter/material.dart';
import 'package:wallpie/views/screens/widgets/customappbar.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

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
        child: Column(children: [
          Stack(
            children: [
              Image.network(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                  "https://images.pexels.com/photos/20410779/pexels-photo-20410779/free-photo-of-a-wooden-walkway-in-the-middle-of-a-jungle.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                color: Colors.black26,
              ),
              Positioned(
                  left: 150,
                  top: 20,
                  child: Column(
                    children: [
                      Text(
                        "Nature",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: Colors.white.withOpacity(0.8)),
                      )
                    ],
                  ))
            ],
          ),
          SizedBox(
            height: 20,
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
                  mainAxisSpacing: 10),
              itemCount: 16,
              itemBuilder: ((context, index) => Container(
                    height: 500,
                    width: 50,
                    color: Colors.purpleAccent,
                    child: Image.network(
                        height: 500,
                        width: 50,
                        fit: BoxFit.cover,
                        "https://images.pexels.com/photos/20434627/pexels-photo-20434627/free-photo-of-view-t-b-o-tang-d-ng-dinh-da-n-ng.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                  )),
            ),
          )
        ]),
      ),
    );
  }
}
