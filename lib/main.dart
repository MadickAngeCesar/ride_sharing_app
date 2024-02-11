import 'package:flutter/material.dart';
import 'package:ride_sharing_app/screens/login_page.dart';
import 'package:ride_sharing_app/screens/signup_page.dart';

void main() {
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
      home: const LoginPage(),
      routes: {
        '/signup': (context) => const SignupPage(),
      },
    );
  }
}
