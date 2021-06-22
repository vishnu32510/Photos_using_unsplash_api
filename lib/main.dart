import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unsplash_api/bloc_observer.dart';
import 'package:unsplash_api/config/custom_router.dart';
import 'package:unsplash_api/blocs/photos/photos_bloc.dart';
import 'package:unsplash_api/screens/screens.dart';


void main() {
  EquatableConfig.stringify = kDebugMode;
  Bloc.observer = SimpleBlocObserver();
  runApp(BlocProvider(
    create: (_) => PhotosBloc()..add(PhotoFetched()),
    child: MaterialApp(
      title: 'UnSplash',
      theme: ThemeData(
        primaryColor: Colors.grey[900],
        backgroundColor: Colors.black,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: CustomRouter.onGenerateRoute,
      initialRoute: Splash.routeName,
    ),
  ));
}

