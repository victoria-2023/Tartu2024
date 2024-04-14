import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/attraction.dart'; // Adjust the import path as necessary
import 'attraction_details_page.dart'; // Adjust the import path as necessary

class FavoritesScreen extends StatefulWidget {
  final List<Attraction> attractions;

  FavoritesScreen({required this.attractions});

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  late List<Attraction> _favoriteAttractions;

  @override
  void initState() {
    super.initState();
    _getFavoriteAttractions();
  }

  Future<void> _getFavoriteAttractions() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoriteAttractionNames =
        prefs.getStringList('favorite_attractions') ?? [];
    setState(() {
      _favoriteAttractions = favoriteAttractionNames
          .map((name) => getAttractionByName(name))
          .toList();
    });
  }

  Attraction getAttractionByName(String name) {
    return widget.attractions
        .firstWhere((attraction) => attraction.name == name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: _favoriteAttractions != null
          ? ListView.builder(
              itemCount: _favoriteAttractions.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_favoriteAttractions[index].name),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AttractionDetailsPage(
                            attraction: _favoriteAttractions[index]),
                      ),
                    );
                  },
                );
              },
            )
          : Center(
              child:
                  CircularProgressIndicator(), // Show loading indicator while retrieving data
            ),
    );
  }
}
