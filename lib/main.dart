import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/choose_location.dart';
import 'pages/loading.dart';
import 'dart:ui' show lerpDouble;

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/', routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => ChooseLocation()
  }));
}
