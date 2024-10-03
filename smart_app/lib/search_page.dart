import 'dart:async'; // Import for Completer
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // To open the Google Maps URL
import 'package:geocoding/geocoding.dart'; // To convert address to lat/lng using geocoding
import 'package:google_maps_flutter/google_maps_flutter.dart'; // Ensure you have this package for Google Maps

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _locationController =
      TextEditingController(); // Controller for location input
  late GoogleMapController _mapController; // Controller for the Google Map
  LatLng _currentPosition =
      LatLng(1.3521, 103.8198); // Initial position for Singapore
  String _googleMapsUrl = ''; // To store generated Google Maps URL

  // Function to generate Google Maps link and move the map
  Future<void> _generateGoogleMapsLink() async {
    String location = _locationController.text;

    if (location.isEmpty) {
      // If no location is entered, show a message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a location')),
      );
      return;
    }

    try {
      // Geocoding the location (convert to lat/lng)
      List<Location> locations = await locationFromAddress(location);
      if (locations.isNotEmpty) {
        final lat = locations[0].latitude;
        final lng = locations[0].longitude;

        // Update current position on the map
        setState(() {
          _currentPosition = LatLng(lat, lng);
        });

        // Generate the Google Maps URL using the lat/lng
        setState(() {
          _googleMapsUrl =
              'https://www.google.com/maps/search/?api=1&query=$lat,$lng';
        });

        // Open the Google Maps URL
        await _openMapsLink();

        // Move the camera to the new position
        _mapController.animateCamera(CameraUpdate.newLatLng(_currentPosition));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Location not found')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error finding location: $e')),
      );
    }
  }

  // Function to launch the generated Google Maps URL
  Future<void> _openMapsLink() async {
    if (await canLaunch(_googleMapsUrl)) {
      await launch(_googleMapsUrl);
    } else {
      throw 'Could not launch $_googleMapsUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search Page')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _locationController,
              decoration: InputDecoration(
                labelText: 'Enter Starting Location',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: _generateGoogleMapsLink,
            child: const Text('Find on Google Maps'),
          ),
          Expanded(
            child: GoogleMap(
              mapType: MapType.hybrid,
              initialCameraPosition: CameraPosition(
                target: _currentPosition,
                zoom: 12.0,
              ),
              onMapCreated: (GoogleMapController controller) {
                _mapController = controller;
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _locationController.dispose();
    super.dispose();
  }
}

void main() {
  runApp(MaterialApp(
    home: SearchPage(),
  ));
}
