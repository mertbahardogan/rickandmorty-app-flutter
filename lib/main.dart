import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty_app/locator/repository_locator.dart';
import 'package:rick_and_morty_app/views/home_page.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Rick and Morty',
      debugShowCheckedModeBanner: false,
      theme: buildThemeData(),
      home: HomePage(),
    );
  }

  ThemeData buildThemeData() {
    return ThemeData(
      fontFamily: "Abel",
      brightness: Brightness.light,
      primaryColor: Colors.yellow.shade700,
      primaryColorDark: Colors.yellow.shade800,
      accentColor: Colors.black,
      hintColor: Colors.grey.shade100,
      focusColor: Colors.grey,
      hoverColor: Colors.teal,
      cardColor: Colors.white,
      textTheme: buildTextTheme(),
      inputDecorationTheme: buildInputDecorationTheme(),
    );
  }

  TextTheme buildTextTheme() {
    return TextTheme(
        headline1: TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
        headline6: TextStyle(fontWeight: FontWeight.bold));
  }

  InputDecorationTheme buildInputDecorationTheme() {
    return InputDecorationTheme(
      border: OutlineInputBorder(),
      labelStyle: TextStyle(color: Colors.grey, fontSize: 15),
    );
  }
}
