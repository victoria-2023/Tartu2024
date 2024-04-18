import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'attraction_details_page.dart';
import 'package:tartu2024/models/attractions_data.dart';
import 'settings.dart';
import 'welcome_page.dart';
import 'app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'models/attraction.dart';

Future<void> main() async {
  await dotenv.load(fileName: "google.env");
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = Locale('en', '');

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tartu2024 City Guide',
      locale: _locale,
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

class AttractionsListPage extends StatefulWidget {
  @override
  _AttractionsListPageState createState() => _AttractionsListPageState();
}

class _AttractionsListPageState extends State<AttractionsListPage> {
  TextEditingController _searchController = TextEditingController();
  List<Attraction> _filteredAttractions = attractions;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
    _filteredAttractions = attractions;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      _filteredAttractions = attractions.where((attraction) {
        return attraction.name
            .toLowerCase()
            .contains(_searchController.text.toLowerCase());
      }).toList();
    });
  }

  void _openSettings(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) => SettingsPage()));
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredAttractions.length,
              itemBuilder: (context, index) {
                final attraction = _filteredAttractions[index];
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Card(
                    child: ListTile(
                      title: Text(attraction.name),
                      leading: Container(
                        width: 100,
                        height: 100,
                        child: Image.network(
                          attraction.imageUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Icon(Icons.error),
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
          ),
        ],
      ),
    );
  }
}
