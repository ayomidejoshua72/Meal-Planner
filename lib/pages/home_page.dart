// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          _searchBar(),
        ],
      ),
    );
  }

  Container _searchBar() {
    return Container(
          margin: EdgeInsets.only(
            top: 40,
            right: 20,
            left: 20,
          ),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(62, 153, 150, 150),
                blurRadius: 40,
                spreadRadius: 0.0,
              ),
            ],
          ),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.all(15),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset("assets/icons/Search.svg"),
              ),
              hintText: "Search",
              hintStyle: TextStyle(
                color: const Color.fromARGB(129, 158, 158, 158),
                fontSize: 20,
              ),
              suffixIcon: SizedBox(
                width: 150,
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      VerticalDivider(
                        thickness: 0.2,
                        indent: 10,
                        endIndent: 10,
                        color: Color.fromARGB(255, 32, 32, 32),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: SvgPicture.asset("assets/icons/Filter.svg"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
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
