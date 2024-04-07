import 'package:flutter/material.dart';
import '../models/attraction.dart'; // Adjust the import path

class AttractionDetailsPage extends StatelessWidget {
  final Attraction attraction;

  AttractionDetailsPage({required this.attraction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(attraction.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(attraction.imageUrl),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(attraction.description),
              // I can add more details here as needed
            ),
          ],
        ),
      ),
    );
  }
}
