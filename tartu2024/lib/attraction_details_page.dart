// I'm importing necessary Flutter material components, a sharing package to share content, and a package to store simple data persistently.
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';

// I'm also importing custom classes. One is for modeling an attraction, and the other is for a page showing a map.
import '../models/attraction.dart';
import 'map_page.dart';

// I'm defining a StatefulWidget because the details of an attraction can change, like whether it's liked.
class AttractionDetailsPage extends StatefulWidget {
  final Attraction
      attraction; // This will hold the attraction data passed to this page.

  AttractionDetailsPage(
      {required this.attraction}); // I'm using a constructor to pass the attraction data.

  @override
  _AttractionDetailsPageState createState() =>
      _AttractionDetailsPageState(); // I'm creating its stateful part.
}

class _AttractionDetailsPageState extends State<AttractionDetailsPage> {
  bool _isLiked =
      false; // I'm starting with the assumption that the attraction isn't liked.
  late SharedPreferences
      prefs; // This will be used to save and load preferences like the liked status.

  @override
  void initState() {
    super
        .initState(); // Always call this first in initState to ensure everything else works as expected.
    _loadLikedState(); // I'm loading the liked status from storage right when the page starts.
  }

  Future<void> _loadLikedState() async {
    prefs = await SharedPreferences
        .getInstance(); // Here I'm getting an instance of SharedPreferences.
    bool? likedStatus = prefs.getBool(widget.attraction
        .name); // I'm trying to load the liked status using the attraction's name as a key.
    setState(() {
      _isLiked = likedStatus ??
          false; // I update _isLiked. If likedStatus is null, default to false.
    });
  }

  void _toggleLikedStatus() async {
    setState(() {
      _isLiked = !_isLiked; // I toggle the liked status.
    });
    await prefs.setBool(widget.attraction.name,
        _isLiked); // Then, I save the new liked status in SharedPreferences.
  }

  @override
  Widget build(BuildContext context) {
    // This builds the UI of the page.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.attraction
            .name), // The title of the AppBar is the name of the attraction.
        actions: <Widget>[
          IconButton(
            icon: Icon(
                _isLiked
                    ? Icons.favorite
                    : Icons
                        .favorite_border, // I change the icon based on whether it's liked.
                color: _isLiked
                    ? Colors.red
                    : null), // Red if liked, no color if not.
            onPressed:
                _toggleLikedStatus, // When pressed, it toggles the liked status.
          ),
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              Share.share(
                  'Check out this attraction: ${widget.attraction.name}'); // This allows sharing the attraction's name.
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        // This allows the body to scroll if there's not enough space.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.attraction.imageUrl, // Display the image from a URL.
              fit: BoxFit
                  .cover, // The image covers the space without distorting aspect ratio.
              errorBuilder: (context, error, stackTrace) {
                // If the image fails to load, show an icon instead.
                return Icon(
                  Icons.broken_image,
                  size: 200,
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.attraction.description, // Description of the attraction.
                style: Theme.of(context)
                    .textTheme
                    .headline6, // Styling the text with the headline6 style from the theme.
              ),
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text(widget.attraction
                  .address), // Showing the address of the attraction.
            ),
            ListTile(
              leading: Icon(Icons.access_time),
              title: Text(
                  widget.attraction.visitingHours), // Showing visiting hours.
            ),
            ListTile(
              leading: Icon(Icons.directions),
              title: Text(widget
                  .attraction.directions), // Directions to the attraction.
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
                      builder: (context) => MapPage(
                          attraction: widget
                              .attraction), // Navigates to a map page with the attraction.
                    ),
                  );
                },
                child: Text('Get Directions'), // Button text.
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Button color.
                  textStyle: TextStyle(color: Colors.white), // Text color.
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
