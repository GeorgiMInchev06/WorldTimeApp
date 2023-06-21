import 'package:flutter/material.dart';
import 'package:world_time_app/pages/home.dart';
import 'package:world_time_app/pages/loading.dart';
import 'package:world_time_app/pages/choose_location.dart';
import 'package:world_time_app/registration_pages/resetpassword_screen.dart';
import 'package:world_time_app/registration_pages/signin_screen.dart';
import 'package:world_time_app/registration_pages/signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  
debugShowCheckedModeBanner: false,
initialRoute: '/',
routes: {
  
  '/': (context) =>Loading(),
  '/signin':(context) => SignInScreen() ,
  '/signup':(context) => SignUpScreen() ,
  '/reset_password':(context) => ResetPassword() ,
  '/home': (context) => Home(),
  '/location':(context) => ChooseLocation(),
 },
);
}}