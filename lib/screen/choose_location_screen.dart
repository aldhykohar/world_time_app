import 'package:flutter/material.dart';
import 'package:world_time_app/service/world_time.dart';

class ChooseLocation extends StatefulWidget {
  static String routeName = "/choose_location_screen";

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter = 0;

  List<WorldTime> locations = [
    WorldTime(url: "Europe/London", location: "London", flag: "london.png"),
    WorldTime(url: "Europe/Berlin", location: "Athens", flag: "athens.png"),
    WorldTime(url: "Africa/Cairo", location: "Cairo", flag: "cairo.png"),
    WorldTime(url: "Africa/Nairobi", location: "Nairobi", flag: "nairobi.png"),
    WorldTime(
        url: "America/New_York", location: "New York", flag: "new york.png"),
    WorldTime(url: "Asia/Seoul", location: "Seoul", flag: "seoul.png"),
    WorldTime(url: "Asia/Jakarta", location: "Jakarta", flag: "indonesia.png"),
  ];

  void updateTimes(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTimes(index);
                  // Navigator.pop(context, 'Yep!');
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/images/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
