import 'package:flutter/cupertino.dart';
import 'package:world_time_app/screen/choose_location_screen.dart';
import 'package:world_time_app/screen/home_screen.dart';
import 'package:world_time_app/screen/loading_screen.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => HomeScreen(),
  ChooseLocation.routeName: (context) => ChooseLocation(),
  LoadingScreen.routeName: (context) => LoadingScreen(),
};
