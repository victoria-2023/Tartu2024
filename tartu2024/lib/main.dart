import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart'; // Import flutter_dotenv
import 'attraction_details_page.dart';
import 'package:tartu2024/models/attractions_data.dart';
import 'settings.dart';
import 'welcome_page.dart';
import 'app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  await dotenv.load(fileName: "google.env");
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = Locale('en', ''); // Default locale

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
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
        Locale('en', ''),
        Locale('pl', ''),
        Locale('fr', ''),
      ],
      home: WelcomePage(onLocaleChange: setLocale),
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
        title: Text(
            AppLocalizations.of(context).translate("Tartu2024 City Guide")),
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
                title:
                    Text(attraction.name), // Consider localizing this if needed
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
