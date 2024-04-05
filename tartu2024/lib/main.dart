import 'package:flutter/material.dart';
import 'place.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  final List<Place> places = [
    Place(
      name: 'Tartu Old Town',
      description:
          'The heart of Tartu, full of historical buildings, cafes, and shops.',
      imageUrl: 'https://example.com/image1.jpg',
    ),
    Place(
      name: 'Toome Hill',
      description:
          'A historic hill with great views over the city, perfect for walks and picnics.',
      imageUrl: 'https://example.com/image2.jpg',
    ),
    // Add more places here
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PlacesList(places: places),
    );
  }
}

class PlacesList extends StatelessWidget {
  final List<Place> places;

  PlacesList({required this.places});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Places to Visit in Tartu'),
      ),
      body: ListView.builder(
        itemCount: places.length,
        itemBuilder: (context, index) {
          final place = places[index];
          return ListTile(
            title: Text(place.name),
            subtitle: Text(place.description),
            onTap: () {
              // Here you can navigate to a detailed page of the place
              // For simplicity, we'll just show a dialog
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(place.name),
                    content: Text(place.description),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text('Close'),
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
