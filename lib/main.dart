import 'package:flutter/material.dart';
import 'package:unsplash_api/constants.dart';
import 'package:unsplash_api/screenone/one.dart';


void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primaryColor: appbarcolor,
    ),
    debugShowCheckedModeBanner: false,
    // home: Home(),
    home: one(),
  ));
}

