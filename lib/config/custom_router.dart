import 'package:unsplash_api/models/models.dart';
import 'package:unsplash_api/screens/screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('Route: ${settings.name}');
    switch (settings.name) {
      case Splash.routeName:
        return Splash.route();
      case PhotosListScreen.routeName:
        return PhotosListScreen.route();
      case PhotoDetailsScreen.routeName:
        Photo arg= settings.arguments;
        return PhotoDetailsScreen.route(arg);
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
        builder: (context) => Scaffold(
              appBar: AppBar(
                title: Center(child: Text('Error Page')),
              ),
            ));
  }
}
