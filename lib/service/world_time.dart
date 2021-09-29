import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // location name for the ui
  String? time; // the time in the location
  String flag; // url to an asset flag icon
  String url;
  bool? isDayTime;

  WorldTime(
      {required this.location,
      required this.flag,
      required this.url}); // location url for api endpoint

  Future<void> getTime() async {
    try {
      var urls = Uri.parse('https://worldtimeapi.org/api/timezone/$url');
      Response response = await get(urls);
      Map data = jsonDecode(response.body);

      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));

      // set the time property
      isDayTime = now.hour > 6 && now.hour < 18 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('caught error: $e');
      time = 'could not get time data';
    }
  }
}
