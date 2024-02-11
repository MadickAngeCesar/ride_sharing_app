import 'package:flutter/material.dart';

class DriverTab extends StatefulWidget {
  const DriverTab({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DriverTabState createState() => _DriverTabState();
}

class _DriverTabState extends State<DriverTab> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _carMatriculeController = TextEditingController();
  final TextEditingController _carColorController = TextEditingController();
  final TextEditingController _licenceNumberController = TextEditingController();
  final TextEditingController _currentLocationController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();
  final List<String> _selectedPaymentMethods = [];
  int _seatCount = 1;
  bool _isRoundTrip = false;

  void _publishRide() {
    // Implement functionality to publish ride
    // You can store ride information in the database
    // and match it with client requests
  }

  void _viewClientLocationOnMap() {
    // Implement functionality to view client location on map
    // You can use maps plugin to display client location
  }

  @override
  void dispose() {
    _carMatriculeController.dispose();
    _carColorController.dispose();
    _licenceNumberController.dispose();
    _currentLocationController.dispose();
    _destinationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            TextFormField(
              controller: _carMatriculeController,
              decoration: const InputDecoration(labelText: 'Car Matricule'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter car matricule';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _carColorController,
              decoration: const InputDecoration(labelText: 'Car Color'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter car color';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _licenceNumberController,
              decoration: const InputDecoration(labelText: 'Driving Licence Number'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter driving licence number';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _currentLocationController,
              decoration: const InputDecoration(labelText: 'Current Location'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter current location';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _destinationController,
              decoration: const InputDecoration(labelText: 'Destination'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter destination';
                }
                return null;
              },
            ),
            CheckboxListTile(
              title: const Text('Round Trip'),
              value: _isRoundTrip,
              onChanged: (value) {
                setState(() {
                  _isRoundTrip = value!;
                });
              },
            ),
            DropdownButtonFormField<String>(
              value: _selectedPaymentMethods.isNotEmpty
                  ? _selectedPaymentMethods[0]
                  : null,
              onChanged: (value) {
                setState(() {
                  if (_selectedPaymentMethods.contains(value)) {
                    _selectedPaymentMethods.remove(value);
                  } else {
                    _selectedPaymentMethods.add(value!);
                  }
                });
              },
              items: ['Paypal', 'Cash', 'MOMO', 'Google Pay']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: const InputDecoration(labelText: 'Payment Methods'),
            ),
            TextFormField(
              initialValue: '$_seatCount',
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _seatCount = int.tryParse(value) ?? 1;
                });
              },
              decoration: const InputDecoration(labelText: 'Seat Count'),
            ),
            ElevatedButton(
              onPressed: _publishRide,
              child: const Text('Publish Ride'),
            ),
            ElevatedButton(
              onPressed: _viewClientLocationOnMap,
              child: const Text('View Client Location on Map'),
            ),
          ],
        ),
      ),
    );
  }
}
