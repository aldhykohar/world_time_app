import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time_app/screen/home_screen.dart';
import 'package:world_time_app/service/world_time.dart';

class LoadingScreen extends StatefulWidget {
  static String routeName = "/loading_screen";

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String time = 'loading';

  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: 'Berlin', flag: 'germany.png', url: 'Asia/Kuala_Lumpur');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, HomeScreen.routeName, arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitPouringHourGlassRefined(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
