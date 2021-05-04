import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty_app/views/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Rick and Morty',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Abel",
        // brightness: Brightness.dark,
        brightness: Brightness.light,
        accentColor: Colors.teal,
        primaryColor: Colors.yellow,
        hintColor: Colors.grey.shade100,
        focusColor: Colors.grey,
        hoverColor: Colors.blueGrey.shade800,
        textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey.shade800),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(),
          labelStyle: TextStyle(color: Colors.grey, fontSize: 15),
        ),
      ),
      home: HomePage(),
    );
  }
}
