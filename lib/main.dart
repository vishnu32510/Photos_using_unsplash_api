import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unsplash_api/bloc_observer.dart';
import 'package:unsplash_api/constants.dart';
import 'package:unsplash_api/screenone/bloc_screenone/photos_bloc.dart';
import 'package:unsplash_api/splash.dart';


void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(BlocProvider(
    create: (_) => PhotosBloc()..add(PhotoFetched()),
    child: MaterialApp(
      title: 'UnSplash',
      theme: ThemeData(
        primaryColor: appbarcolor,
      ),
      debugShowCheckedModeBanner: false,
      home: Splash(),
      // home: one(),
    ),
  ));
}

