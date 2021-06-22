import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:unsplash_api/screens/photo_list/photo_list_screen.dart';

class Splash extends StatefulWidget {
  static const String routeName = '/splash';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) =>
            Splash()
    );
  }
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = new Duration(seconds: 10);
    return new Timer(duration, route);
  }

  route() {
    Navigator.of(context).pushNamed(PhotosListScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          child: InkWell(
            onDoubleTap: () {
              route();
            },
            child: Lottie.asset(
              'assets/images_splash.json',
              // repeat: false,
              // reverse: false,
              // animate: false,
            ),
          ),
        ),
      ),
    );
  }
}
