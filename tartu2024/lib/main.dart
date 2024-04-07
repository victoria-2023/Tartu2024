import 'package:flutter/material.dart';
import 'models/attraction.dart';
import 'attraction_details_page.dart';
import 'package:tartu2024/models/attractions_data.dart';
import 'settings.dart';
import 'welcome_page.dart';

void main() {
  runApp(MaterialApp(home: WelcomePage()));
}

class AttractionsListPage extends StatelessWidget {
  void _openSettings(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) {
        return SettingsPage();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tartu2024 City Guide"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => _openSettings(context),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: attractions.length,
        itemBuilder: (context, index) {
          final attraction = attractions[index];
          return Padding(
            padding: const EdgeInsets.all(4.0), // Adds padding around each tile
            child: Card(
              // Wrapping ListTile with a Card for better UI and separation
              child: ListTile(
                title: Text(attraction.name),
                leading: Container(
                  width: 100, // Specifies the width
                  height: 100, // Specifies the height
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
              ),
            ),
          );
        },
      ),
    );
  }
}
