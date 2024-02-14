import 'package:flutter/material.dart';
import 'package:ride_sharing_app/screens/home_tab/client.dart'; // Import the client tab
import 'package:ride_sharing_app/screens/home_tab/driver.dart'; // Import the driver tab
import 'package:ride_sharing_app/screens/settings_page.dart'; // Import the settings page

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: unused_field
  final int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Ride Sharing App'),
          backgroundColor: Colors.blue,
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                // Navigate to settings page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingPage()),
                );
              },
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Drivers'),
              Tab(text: 'Clients'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            DriverTab(), // Driver Tab View
            ClientTab(), // Client Tab View
          ],
        ),
      ),
    );
  }
}
