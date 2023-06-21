import 'package:flutter/material.dart';
import 'package:world_time_app/registration_pages/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {

  data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
  print(data);

  // set background

  String bgImage = data['isDaytime'] ? 'Noon.png' : 'Night.png';

// List<String> bgImage = [
//   data['itsMorning'] = 'Morning.png',
//   data['itsBeforeNoon'] = 'Before_Noon.png',
//   data['itsNoon'] = 'Noon.png',
//   data['itsAfternoon'] = 'Afternoon.png',
//   data['itsBeforeNight'] = 'Before_Night.png',
//   data['itsNight'] = 'Night.png'
// ];

  // String bgMorning = data['itsMorning'] = 'Morning.png';
  // String bgBeforeNoon = data['itsBeforeNoon'] = 'Before_Noon.png';
  // String bgNoon = data['itsNoon'] = 'Noon.png';
  // String bgAfternoon = data['itsAfternoon'] = 'Afternoon.png';
  // String bgBeforeNight = data['itsBeforeNight'] = 'Before_Night.png';
  // String bgNight = data['itsNight'] = 'Night.png';

    return Scaffold(
      body: Container(
         decoration: BoxDecoration(
              image: DecorationImage(
                image:AssetImage('images/backgrounds/$bgImage'),
                fit: BoxFit.cover,
              )
            ),
        child: SafeArea(
          // children: bgImage.map((image) => Text(image)).toList(),
            child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 175.0, 0, 0),
            child: SafeArea(
              child: Column(children: <Widget> [
                TextButton.icon(
                  style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                  iconColor: Colors.blueAccent
                  ),
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'flag': result['flag'],
                        'isDaytime': result['isDaytime'],
                        // 'itsMorning': result['itsMorning'],
                        // 'itsBeforeNoon': result['itsBeforeNoon'],
                        // 'itsNoon': result['itsNoon'],
                        // 'itsAfternoon': result['itsAfternoon'],
                        // 'itsBeforeNight': result['itsBeforeNight'],
                        // 'itsNight': result['itsNight'],
                        
                      };
                    });
                  },
                  icon: Icon(Icons.edit_location),
                  label: Text('Edit Location'),
                
                 ),
                 SizedBox(height: 20,),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: Colors.black
                      ),
                      ),
                  ],
                 ),
                 SizedBox(height: 20.0),
                 Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 76.0,
                    color: Colors.black
                  ),
                 ),
                 SizedBox(height: 40.0),
                 TextButton.icon(
                  icon: Icon(Icons.logout_outlined,
                   color: Colors.black,
                  ),
                  label: Text("Logout"),
                  style:TextButton.styleFrom(
                    foregroundColor: Colors.black
                  ),
                  onPressed: () {
                    FirebaseAuth.instance.signOut().then((value) {
                    print("Signed Out");
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignInScreen()));
                  });
                  }
                 ),

              ]
              ),
            ),
            ),
          ),
        ),
      );
  }
}