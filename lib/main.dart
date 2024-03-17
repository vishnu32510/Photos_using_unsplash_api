import 'package:flutter/material.dart';
import 'package:unsplash_api/constants.dart';
import 'package:unsplash_api/splash.dart';

void main() {
  runApp(MaterialApp(
    title: 'UnSplash',
    theme: ThemeData(
      primaryColor: appbarcolor,
    ),
    debugShowCheckedModeBanner: false,
    home: Splash(),
    // home: one(),
  ));
}
