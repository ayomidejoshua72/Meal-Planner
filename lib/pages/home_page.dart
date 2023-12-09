// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_list/models/category_model.dart';
import 'package:todo_list/models/diet_model.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<CategoryModel> categories = CategoryModel.getCategories();
  final List<DietModel> diet = DietModel.getDiets();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _searchBar(),
          SizedBox(height: 30),
          _categories(),
          SizedBox(height: 30),
          _diet(),
        ],
      ),
    );
  }

  Column _diet() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Recommendation \nfor Diet",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: 300,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: diet.length,
                separatorBuilder: (context, index) => SizedBox(width: 15),
                itemBuilder: (context, index) {
                  return Container(
                    width: 270,
                    decoration: BoxDecoration(
                      color: diet[index].boxColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(diet[index].iconPath),
                        Column(
                          children: [
                            Text(
                              diet[index].name,
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "${diet[index].level} | ${diet[index].duration} | ${diet[index].calorie}",
                              style: TextStyle(
                                fontSize: 20,
                                color: const Color.fromARGB(255, 87, 87, 87),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 180,
                          height: 50,
                          decoration: BoxDecoration(
                            color: diet[index].viewIsSelected
                                ? const Color.fromARGB(255, 13, 77, 129)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: Text(
                              "View",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 22,
                                color: diet[index].viewIsSelected
                                    ? Colors.white
                                    : Color(0xffEEA4CE),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        );
  }

  Column _categories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            "Category",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // SizedBox(height: 15,),
        Container(
          height: 160,
          margin: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return SizedBox(
                width: 15,
              );
            },
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Container(
                width: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: categories[index].boxColor.withOpacity(0.2),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(80)),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: SvgPicture.asset(categories[index].iconPath),
                      ),
                    ),
                    Text(
                      categories[index].name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
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
