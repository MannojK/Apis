import 'package:flutter/material.dart';
import 'package:http_tute/Example/HomeScreen.dart';
import 'package:http_tute/Example_main/homePage.dart';

import 'package:http_tute/Project/homepage.dart';
import 'package:http_tute/Project2/homescreeen.dart';
import 'package:http_tute/U_project_1/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homePagee()
      
       );
  }
}
