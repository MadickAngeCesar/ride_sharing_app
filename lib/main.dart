import 'package:flutter/material.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:ride_sharing_app/screens/home_page.dart';

import 'package:ride_sharing_app/screens/home_tab/client.dart';
import 'package:ride_sharing_app/screens/home_tab/driver.dart';
import 'package:ride_sharing_app/screens/authentication/login_page.dart';
import 'package:ride_sharing_app/screens/authentication/signup_page.dart';
import 'package:ride_sharing_app/screens/home_tab/map_driver.dart';
import 'package:ride_sharing_app/screens/home_tab/map_view.dart';
import 'package:ride_sharing_app/screens/settings_page.dart';


void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/signup': (context) => const SignupPage(),
        '/home': (context) => const HomePage(),
        '/settings': (context) => const SettingPage(),
        '/driverTab': (context) => const DriverTab(),
        '/clientTab': (context) => const ClientTab(),
        '/mapPage': (context) => const MapPage(),
        '/mapDrive': (context) => const MapDrive(),
      },
    );
  }
}
