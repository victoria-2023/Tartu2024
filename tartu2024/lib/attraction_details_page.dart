import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/attraction.dart'; // Adjust the import path as necessary
import 'map_page.dart'; // Adjust the import path as necessary

class AttractionDetailsPage extends StatefulWidget {
  final Attraction attraction;

  AttractionDetailsPage({required this.attraction});

  @override
  _AttractionDetailsPageState createState() => _AttractionDetailsPageState();
}

class _AttractionDetailsPageState extends State<AttractionDetailsPage> {
  bool _isLiked = false;
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    _loadLikedState();
  }

  Future<void> _loadLikedState() async {
    prefs = await SharedPreferences.getInstance();
    bool? likedStatus = prefs.getBool(widget.attraction.name);
    setState(() {
      _isLiked = likedStatus ?? false;
    });
  }

  void _toggleLikedStatus() async {
    setState(() {
      _isLiked = !_isLiked; // Toggle the like status
    });
    await prefs.setBool(widget.attraction.name,
        _isLiked); // Save the new state in SharedPreferences
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.attraction.name),
        actions: <Widget>[
          IconButton(
            icon: Icon(_isLiked ? Icons.favorite : Icons.favorite_border,
                color: _isLiked ? Colors.red : null),
            onPressed: _toggleLikedStatus,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.attraction.imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Icon(
                  Icons.broken_image,
                  size: 200,
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.attraction.description,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text(widget.attraction.address),
            ),
            ListTile(
              leading: Icon(Icons.access_time),
              title: Text(widget.attraction.visitingHours),
            ),
            ListTile(
              leading: Icon(Icons.directions),
              title: Text(widget.attraction.directions),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          MapPage(attraction: widget.attraction),
                    ),
                  );
                },
                child: Text('Get Directions'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  textStyle: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
