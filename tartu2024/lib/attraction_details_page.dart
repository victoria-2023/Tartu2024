import 'package:flutter/material.dart'; // I'm bringing in tools to make our app look nice
import 'package:share/share.dart'; // I'm importing a tool to help us share stuff easily
import '../models/attraction.dart'; // I'm getting a blueprint for our attractions
import 'map_page.dart'; // I'm using a tool to find directions on a map
import 'database_helper.dart'; // I have a friend to help me manage our list of favorite attractions

class AttractionDetailsPage extends StatefulWidget {
  // I'm creating a special page to show attraction details
  final Attraction
      attraction; // Here's where I keep all the details about one attraction

  AttractionDetailsPage(
      {required this.attraction}); // When you tell me which attraction to show, I set up the page

  @override
  _AttractionDetailsPageState createState() =>
      _AttractionDetailsPageState(); // I create a special manager for this page
}

class _AttractionDetailsPageState extends State<AttractionDetailsPage> {
  // I'll help manage the attraction details page
  bool _isLiked =
      false; // I'll keep track of whether we like this attraction or not
  late DatabaseHelper
      _databaseHelper; // I have a friend to help me manage our list of favorite attractions

  @override
  void initState() {
    // I get everything ready when we first show the attraction details
    super.initState();
    _databaseHelper = DatabaseHelper
        .instance; // My friend is ready to help me with our list of favorite attractions
    _loadLikedState(); // I check if we've liked this attraction before
  }

  Future<void> _loadLikedState() async {
    // I check if we've liked this attraction before
    bool? likedStatus = await _databaseHelper.getFavorite(
        widget.attraction.name); // I peek into our list of favorite attractions
    setState(() {
      // I update our page to show if we've liked this attraction or not
      _isLiked = likedStatus ??
          false; // I make sure we know if we like this attraction or not
    });
  }

  void _toggleLikedStatus() async {
    // I changed our mind about liking or unliking this attraction
    setState(() {
      _isLiked =
          !_isLiked; // I switch between liking and unliking the attraction
    });
    await _databaseHelper.addOrUpdateFavorite(
        // I saved our decision about liking or unliking the attraction
        widget.attraction.name,
        _isLiked);
  }

  @override
  Widget build(BuildContext context) {
    // I set up how our page will look
    return Scaffold(
      // I created a layout for our page
      appBar: AppBar(
        // I set up the top part of our page, like a title and buttons
        title: Text(widget
            .attraction.name), // I show the name of the attraction at the top
        actions: <Widget>[
          // I added buttons at the top, like a heart to like the attraction or a share button
          IconButton(
            // I set up a heart button to like or unlike the attraction
            icon: Icon(
              // I show a heart icon
              _isLiked
                  ? Icons.favorite
                  : Icons
                      .favorite_border, // I decide if the heart should be filled or just an outline
              color: _isLiked
                  ? Colors.red
                  : null, // I make the heart red if we like the attraction, or just the default color
            ),
            onPressed:
                _toggleLikedStatus, // I make the heart button work, so we can like or unlike the attraction
          ),
          IconButton(
            // I set up a button to share the attraction details
            icon: Icon(Icons.share), // I show an icon for sharing
            onPressed: () {
              // I make the share button work, so we can share the attraction details with friends
              Share.share(
                  'Check out this attraction: ${widget.attraction.name}'); // I share the name of the attraction
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        // I make sure we can scroll down if there's lots of details about the attraction
        child: Column(
          // I set up how the attraction details will look like
          crossAxisAlignment: CrossAxisAlignment
              .start, // I align the details to the left side of the screen
          children: [
            // I will show different details about the attraction, like its picture, description, and location
            // Here I'll add details about the attraction
          ],
        ),
      ),
    );
  }
}
