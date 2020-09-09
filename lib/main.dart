import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:testapp/Screen/HomePage.dart';
import 'Screen/SplashScreen.dart';
import 'models/ContentChap_dana.dart';
import 'database/database.dart';
import 'dart:math' as math;

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // data for testing

  @override
  Widget build(BuildContext context) {
    return new SplashScreen();
  }

}