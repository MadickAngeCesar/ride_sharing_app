import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapDrive extends StatefulWidget {
  const MapDrive({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MapDriveState createState() => _MapDriveState();
}

class _MapDriveState extends State<MapDrive> {
  late GoogleMapController _controller;
  final LatLng _initialLocation = const LatLng(37.7749, -122.4194); // San Francisco, CA

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Driver Map'),
        backgroundColor: Colors.blue,
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _initialLocation,
          zoom: 15.0,
        ),
        myLocationEnabled: true,
        compassEnabled: true,
        mapType: MapType.normal,
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
  }
}
