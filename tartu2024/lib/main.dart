import 'package:flutter/material.dart';
import 'models/attraction.dart';
import 'attraction_details_page.dart';
import 'package:tartu2024/models/attractions_data.dart';

void main() {
  runApp(MaterialApp(home: AttractionsListPage()));
}

class AttractionsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tartu City Guide"),
      ),
      body: ListView.builder(
        itemCount: attractions.length,
        itemBuilder: (context, index) {
          final attraction = attractions[index];
          return ListTile(
            title: Text(attraction.name),
            leading: Container(
              width: 100, // Specify the width
              height: 100, // Specify the height
              child: Image.network(attraction.imageUrl, fit: BoxFit.cover),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      AttractionDetailsPage(attraction: attraction),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
