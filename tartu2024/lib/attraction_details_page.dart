import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:share/share.dart';
import '../models/attraction.dart'; // Adjust the import path as necessary
import 'map_page.dart'; // Adjust the import path as necessary

Future<String> fetchDescriptionFromWikipedia(String attractionName) async {
  final query = Uri.encodeComponent(attractionName);
  final url = Uri.parse(
      'https://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts&exintro=&explaintext=&titles=$query');

  try {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final pages = data['query']['pages'];
      if (pages != null) {
        final page = pages[pages.keys.first];
        if (page != null && page['extract'] != null) {
          return page['extract'];
        }
      }
      return 'No description available';
    } else {
      throw Exception('Failed to load description');
    }
  } catch (e) {
    return 'Failed to fetch data: $e';
  }
}

class AttractionDetailsPage extends StatefulWidget {
  final Attraction attraction;

  AttractionDetailsPage({required this.attraction});

  @override
  _AttractionDetailsPageState createState() => _AttractionDetailsPageState();
}

class _AttractionDetailsPageState extends State<AttractionDetailsPage> {
  String description =
      'Loading description...'; // Placeholder text for loading state
  bool _isLiked = false; // Initial like state

  @override
  void initState() {
    super.initState();
    fetchDescriptionFromWikipedia(widget.attraction.name).then((desc) {
      setState(() {
        description = desc; // Update the description on fetch success
      });
    }).catchError((error) {
      setState(() {
        description =
            'Failed to load description'; // Handle errors in fetching description
      });
    });
  }

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
              child: Text(
                  description), // Displaying the fetched or placeholder description
            ),
            ElevatedButton(
              onPressed: _showMapPage, // Navigates to the MapPage
              child: Text('Get Directions'),
            ),
            // Additional details or widgets here as needed
          ],
        ),
      ),
    );
  }
}
