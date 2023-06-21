import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';


class ChooseLocation extends StatefulWidget {

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
  
}
class _ChooseLocationState extends State<ChooseLocation> {


List <WorldTime> locations = [
  WorldTime(url: 'Europe/Sofia', location: 'Sofia', flag: 'bulgaria.png',),
  WorldTime(url: 'Europe/Belgrade', location: 'Belgrade', flag: 'serbia.png'),
  WorldTime(url: 'Europe/Budapest', location: 'Budapest', flag: 'hungary.png'),
  WorldTime(url: 'Europe/Moscow', location: 'Moscow', flag: 'russia.png'),
  WorldTime(url: 'Europe/Kyiv', location: 'Kyiv', flag: 'ukraine.png'),
  WorldTime(url: 'Europe/Paris', location: 'Paris', flag: 'france.png'),
  WorldTime(url: 'Europe/Madrid', location: 'Madrid', flag: 'spain.png'),
  WorldTime(url: 'Europe/Rome', location: 'Rome', flag: 'italy.png'),
  WorldTime(url: 'Europe/Istanbul', location: 'Istanbul', flag: 'turkey.png'),
  WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
  WorldTime(url: 'Europe/Berlin', location: 'Berlin', flag: 'germany.png'),
  WorldTime(url: 'Europe/Athens', location: 'Athens', flag: 'greece.png'),
  WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
  WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
  WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
  WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
  WorldTime(url: 'Asia/Tokyo', location: 'Tokyo', flag: 'japan.png'),
  WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
  WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  WorldTime(url: 'America/Argentina/Buenos_Aires', location: 'Buenos Aires', flag: 'argentina.png'),
  WorldTime(url: 'America/Mexico_City', location: 'Mexico City', flag: 'mexico.png'),
  // WorldTime(url: 'America/Mexico_City', location: 'Mexico_City', flag: 'mexico.png'),
  // WorldTime(url: 'America/Mexico_City', location: 'Mexico_City', flag: 'mexico.png'),
  // WorldTime(url: 'America/Mexico_City', location: 'Mexico_City', flag: 'mexico.png'),
  // WorldTime(url: 'America/Mexico_City', location: 'Mexico_City', flag: 'mexico.png'),

];

void updateTime(index) async {
  WorldTime instance = locations[index];
  await instance.getTime();

  //navigate to Home screen
  Navigator.pop(context, {
    'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      // 'itsMorning': instance.itsMorning,
      // 'itsBeforeNoon': instance.itsBeforeNoon,
      // 'itsNoon': instance.itsNoon,
      // 'itsAfternoon': instance.itsAfternoon,
      // 'itsBeforeNight': instance.itsBeforeNight,
      // 'itsNight': instance.itsNight,
      'isDaytime': instance.isDaytime,
  });
}

  @override
  Widget build(BuildContext context) {
    print('build function ran');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('images/flags/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },

      ),
    );
  }
}