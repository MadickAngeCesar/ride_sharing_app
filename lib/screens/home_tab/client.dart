import 'package:flutter/material.dart';
//import 'package:ride_sharing_app/screens/home_tab/map_view.dart';

class ClientTab extends StatefulWidget {
  const ClientTab({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ClientTabState createState() => _ClientTabState();
}

class _ClientTabState extends State<ClientTab> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _currentLocationController =
      TextEditingController();
  final TextEditingController _destinationController = TextEditingController();
  final TextEditingController _seatCountController = TextEditingController();
  final TextEditingController _feeCountController = TextEditingController();
  final List<String> _selectedPaymentMethods = [];

  bool _isTrackingDriver = false;
  bool _isPayingRide = false;

  void _trackNearestDriverOnMap() {
    // Implement functionality to track nearest driver on map
    Navigator.pushNamed(context, '/mapPage');

    setState(() {
      _isTrackingDriver = true;
    });
  }

  void _payForRide() {
    // Implement functionality to pay for ride
    setState(() {
      _isPayingRide = true;
    });
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
            TextFormField(
              controller: _seatCountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Number of Seats'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter number of seats';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: _trackNearestDriverOnMap,
              child: const Text('Track Nearest Driver on Map'),
            ),
            if (_isTrackingDriver)
              ElevatedButton(
                onPressed: _payForRide,
                child: const Text('Pay for Ride'),
              ),
            if (_isPayingRide)
              Column(
                children: [
                  const Text('Select Payment Method'),
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
                    items: ['Cash', 'MOMO', 'Google Pay']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    decoration:
                        const InputDecoration(labelText: 'Payment Methods'),
                  ),
                  TextFormField(
                    controller: _feeCountController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Fee'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter payment fee';
                      }
                      return null;
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Implement functionality to complete payment
                    },
                    child: const Text('Confirm Payment'),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
