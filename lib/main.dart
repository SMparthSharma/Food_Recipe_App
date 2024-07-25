import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_recipi_app/activity/constant.dart';
import 'package:food_recipi_app/activity/home_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        fontFamily: "Hellix"
      ),
     // debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

