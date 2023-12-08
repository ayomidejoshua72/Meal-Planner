// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
    );
  }

  AppBar appBar() {
    return AppBar(
      leading: Container(
        margin: EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: appBarButtonDec(),
        child: SvgPicture.asset(
          "assets/icons/Arrow - Left 2.svg",
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      title: const Text(
        "Breakfast",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 28,
          color: Colors.black,
        ),
      ),
      centerTitle: true,
      actions: [
        Container(
          margin: EdgeInsets.all(10),
          width: 37,
          alignment: Alignment.center,
          decoration: appBarButtonDec(),
          child: SvgPicture.asset(
            "assets/icons/dots.svg",
          ),
        ),
      ],
    );
  }

  BoxDecoration appBarButtonDec() {
    return BoxDecoration(
            color: const Color.fromARGB(255, 224, 224, 224),
            borderRadius: BorderRadius.circular(10),
          );
  }
}
