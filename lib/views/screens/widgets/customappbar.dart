import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget {
  String word1;
  String word2;
  CustomAppBar({super.key, required this.word1, required this.word2});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RichText(
          text: TextSpan(
              text: word1,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
              children: [
            TextSpan(
                text: word2,
                style: TextStyle(
                    color: const Color.fromARGB(255, 196, 106, 212),
                    fontWeight: FontWeight.w600,
                    fontSize: 20))
          ])),
    );
  }
}
