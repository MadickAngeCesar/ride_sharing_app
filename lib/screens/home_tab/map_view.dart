import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  // ignore: unused_field
  GoogleMapController? _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Client Map'),
        backgroundColor: Colors.blue,
      ),
      body: GoogleMap(
        onMapCreated: (controller) {
          setState(() {
            _controller = controller;
          });
        },
        initialCameraPosition: const CameraPosition(
          target: LatLng(0, 0), // Initial location (e.g., center of the map)
          zoom: 15.0, // Initial zoom level
        ),
      ),
    );
  }
}
