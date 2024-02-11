import 'package:flutter/material.dart';
import 'package:ride_sharing_app/screens/settings_page.dart';
import 'client.dart';
import 'driver.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: unused_field
  int _selectedIndex = 0;

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
        ),
        body: Column(
          children: [
            TabBar(
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              tabs: const [
                Tab(
                  text: 'Drivers',
                ),
                Tab(
                  text: 'Clients',
                ),
              ],
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  DriverTab(), // Driver Tab View
                  ClientTab(), // Client Tab View
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
