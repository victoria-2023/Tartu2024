import 'package:flutter/material.dart';
import 'package:share/share.dart';
import '../models/attraction.dart';
import 'map_page.dart';
import 'database_helper.dart'; // Make sure to import your DatabaseHelper

class AttractionDetailsPage extends StatefulWidget {
  final Attraction attraction;

  AttractionDetailsPage({required this.attraction});

  @override
  _AttractionDetailsPageState createState() => _AttractionDetailsPageState();
}

class _AttractionDetailsPageState extends State<AttractionDetailsPage> {
  bool _isLiked = false;
  late DatabaseHelper _databaseHelper; // Instance of your database helper

  @override
  void initState() {
    super.initState();
    _databaseHelper = DatabaseHelper.instance; // Initialize the database helper
    _loadLikedState();
  }

  Future<void> _loadLikedState() async {
    bool? likedStatus =
        await _databaseHelper.getFavorite(widget.attraction.name);
    setState(() {
      _isLiked =
          likedStatus ?? false; // Update the liked status based on the database
    });
  }

  void _toggleLikedStatus() async {
    setState(() {
      _isLiked = !_isLiked; // Toggle the liked status
    });
    await _databaseHelper.addOrUpdateFavorite(widget.attraction.name,
        _isLiked); // Save the new status to the database
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.attraction.name),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              _isLiked ? Icons.favorite : Icons.favorite_border,
              color: _isLiked ? Colors.red : null,
            ),
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
              errorBuilder: (context, error, stackTrace) => Icon(
                Icons.broken_image,
                size: 200,
              ),
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
