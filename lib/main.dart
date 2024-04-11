import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ride_sharing_app/screens/authentication/login_page.dart';
import 'package:ride_sharing_app/screens/authentication/signup_page.dart';
import 'package:ride_sharing_app/screens/authentication/splash_screen.dart';
import 'package:ride_sharing_app/screens/home_page.dart';
import 'package:ride_sharing_app/screens/home_tab/client.dart';
import 'package:ride_sharing_app/screens/home_tab/driver.dart';
import 'package:ride_sharing_app/screens/home_tab/map_driver.dart';
import 'package:ride_sharing_app/screens/home_tab/map_view.dart';
import 'package:ride_sharing_app/screens/settings_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyCqE2Pe6xxnkAxCvLfK9cnzHtDGpXTbUOg",
        appId: "1:237453298702:web:5abd7a600a7c1a1b69005f",
        messagingSenderId: "237453298702",
        projectId: "rideapp-4ccba",
        // Your web Firebase config options
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ride Sharing App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(
          // Here, you can decide whether to show the LoginPage or HomePage based on user authentication
          child: LoginPage(),
        ),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignUpPage(),
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
