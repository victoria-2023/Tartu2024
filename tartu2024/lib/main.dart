import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart'; // Import flutter_dotenv
import 'attraction_details_page.dart';
import 'package:tartu2024/models/attractions_data.dart';
import 'settings.dart';
import 'welcome_page.dart';
import 'app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'models/attraction.dart';

Future<void> main() async {
  await dotenv.load(
      fileName:
          "google.env"); // Load environment variables from google.env file
  runApp(MyApp()); // Run the main application widget
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = Locale('en', ''); // Default locale is English

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale; // Update the locale when setLocale is called
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tartu2024 City Guide',
      locale: _locale, // Use the _locale for the MaterialApp
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''), // English locale
        Locale('pl', ''), // Polish locale
        Locale('fr', ''), // French locale
      ],
      home: WelcomePage(
          onLocaleChange:
              setLocale), // Initial page is WelcomePage with language change callback
    );
  }
}

class AttractionsListPage extends StatelessWidget {
  void _openSettings(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return SettingsPage(); // Navigate to the SettingsPage when settings icon is pressed
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate(
            "Tartu2024 City Guide")), // Translate the app title using AppLocalizations
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => _openSettings(
                context), // Open settings page on settings icon press
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: attractions.length, // Number of attractions in the list
        itemBuilder: (context, index) {
          final attraction =
              attractions[index]; // Get the attraction at the current index
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Card(
              child: ListTile(
                title:
                    Text(attraction.name), // Display the name of the attraction
                leading: Container(
                  width: 100,
                  height: 100,
                  child: Image.network(
                    attraction.imageUrl, // Display the image of the attraction
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        Icon(Icons.error), // Handle image loading errors
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AttractionDetailsPage(
                          attraction:
                              attraction), // Navigate to attraction details page on tap
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
