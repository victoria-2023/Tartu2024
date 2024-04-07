import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../models/attraction.dart'; // Adjust the import path as necessary

class MapPage extends StatelessWidget {
  final Attraction attraction;

  MapPage({required this.attraction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${attraction.name} Location"),
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter:
              LatLng(attraction.latitude, attraction.longitude), // Updated here
          initialZoom: 14.0,
        ),
        children: [
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
            userAgentPackageName:
                'com.yourcompany.app', // Replace with your app's package name
          ),
          MarkerLayer(
            markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(attraction.latitude, attraction.longitude),
                child: Icon(Icons.location_pin,
                    color: Colors.red, size: 40.0), // Adjusted here
              ),
            ],
          ),
        ],
      ),
    );
  }
}
