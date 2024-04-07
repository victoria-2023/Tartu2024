import 'package:flutter/material.dart';
import 'package:share/share.dart';
import '../models/attraction.dart'; // Adjust the import path as necessary
import 'map_page.dart'; // Make sure to import your MapPage

class AttractionDetailsPage extends StatefulWidget {
  final Attraction attraction;

  AttractionDetailsPage({required this.attraction});

  @override
  _AttractionDetailsPageState createState() => _AttractionDetailsPageState();
}

class _AttractionDetailsPageState extends State<AttractionDetailsPage> {
  bool _isLiked = false; // Initial like state

  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked; // Toggle the liked state
    });
  }

  void _showMapPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MapPage(attraction: widget.attraction),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.attraction.name),
        actions: <Widget>[
          IconButton(
            icon: Icon(_isLiked ? Icons.favorite : Icons.favorite_border),
            color: _isLiked ? Colors.red : null,
            onPressed: _toggleLike,
          ),
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              Share.share(
                  'Check out this attraction: ${widget.attraction.name}');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(widget.attraction.imageUrl),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(widget.attraction.description),
            ),
            ElevatedButton(
              onPressed:
                  _showMapPage, // This calls the function to navigate to the MapPage
              child: Text('Get Directions'),
            ),
            // You can place additional details or widgets here as needed
          ],
        ),
      ),
    );
  }
}
