import 'package:flutter/material.dart';
import 'package:todo_list/pages/home_page.dart';

void main() {
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(fontFamily: "Poppins"),
    home: HomePage(),
  ));
}
