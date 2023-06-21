import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Sofia', flag: 'bulgaria.png', url: 'Europe/Sofia',);
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      // 'itsMorning': instance.itsMorning,
      // 'itsBeforeNoon': instance.itsBeforeNoon,
      // 'itsNoon': instance.itsNoon,
      // 'itsAfternoon': instance.itsAfternoon,
      // 'itsBeforeNight': instance.itsBeforeNight,
      // 'itsNight': instance.itsNight,
      'isDaytime': instance.isDaytime

    });
  }
  
@override
void initState() {
  super.initState();
  print('initState function ran');
  setupWorldTime();
}
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitCircle(
        color: Colors.blue[900],
        size: 50.0,
        ),
      ),
    );
  }
}