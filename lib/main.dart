import 'package:flutter/material.dart';
import 'package:world_time_app/routs.dart';
import 'package:world_time_app/screen/loading_screen.dart';

void main() => runApp(MaterialApp(
      initialRoute: LoadingScreen.routeName,
      routes: routes,
    ));
