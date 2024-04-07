import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/attraction.dart'; /
class MapPage extends StatelessWidget {
  final Attraction attraction;

  MapPage({required this.attraction});

  @override
  Widget build(BuildContext context) {
    // Initial camera position set to the attraction's location
    final CameraPosition _initialLocation = CameraPosition(
      target: LatLng(attraction.latitude, attraction.longitude),
      zoom: 14,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("${attraction.name} Location"),
      ),
      body: GoogleMap(
        initialCameraPosition: _initialLocation,
        markers: {
          Marker(
            markerId: MarkerId(attraction.name),
            position: LatLng(attraction.latitude, attraction.longitude),
            infoWindow: InfoWindow( // Optional: Adds an info window on tap
              title: attraction.name,
              snippet: attraction.address,
            ),
          ),
        },
      ),
    );
  }
}
