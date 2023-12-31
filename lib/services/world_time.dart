import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  
  String location; // location name for the UI
  String time = ""; // the time in the location
  String flag; // URL to an asset flag icon
  String url; // location URL for api endpoint
  // bool? itsMorning;
  // bool? itsBeforeNoon;
  // bool? itsNoon;
  // bool? itsAfternoon;
  // bool? itsBeforeNight;
  // bool? itsNight;
  bool? isDaytime;

  WorldTime({required this.location, required this.flag, required this.url,});

  Future<void> getTime() async {
    // make the request
    Response response = await  get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
    Map data = jsonDecode(response.body);
    // print(data);

    // get properties from data
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(0,3);
    // print(dateTime);
    // print(offset);

    // create a date time object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));

    //set the time property

    isDaytime = now.hour > 6 && now.hour < 20 ? true : false;

    // itsMorning = now.hour > 6 && now.hour < 8 ? true : false;
    // itsBeforeNoon = now.hour > 8 && now.hour < 12 ? true : false;
    // itsNoon = now.hour > 12 && now.hour < 17 ? true : false;
    // itsAfternoon = now.hour > 17 && now.hour < 20 ? true : false;
    // itsBeforeNight = now.hour > 20 && now.hour < 22 ? true : false;
    // itsNight = now.hour > 22 && now.hour < 6 ? true : false;

    time = DateFormat.Hm().format(now);
  }
}

