import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart'; // Import flutter_dotenv
import 'attraction_details_page.dart';
import 'package:tartu2024/models/attractions_data.dart';
import 'settings.dart';
import 'welcome_page.dart';

Future<void> main() async {
  await dotenv.load(fileName: "google.env"); // Load the environment variables
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Now you can use the environment variables throughout your app
    return MaterialApp(
      title: 'Tartu2024 City Guide',
      home: WelcomePage(),
    );
  }
}

class AttractionsListPage extends StatelessWidget {
  void _openSettings(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return SettingsPage();
        },
      ),
    );
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
            padding: const EdgeInsets.all(4.0),
            child: Card(
              child: ListTile(
                title: Text(attraction.name),
                leading: Container(
                  width: 100,
                  height: 100,
                  child: Image.network(
                    attraction.imageUrl, fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        Icon(Icons.error), // Error handling for image loading
                  ),
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
