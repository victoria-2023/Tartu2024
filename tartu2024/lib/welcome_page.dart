import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'main.dart'; // Ensure this points to your file with AttractionsListPage.
import 'app_localizations.dart'; // Ensure this is correctly imported.

class WelcomePage extends StatelessWidget {
  final Function(Locale) onLocaleChange;

  WelcomePage({required this.onLocaleChange});

  @override
  Widget build(BuildContext context) {
    // Assuming the phrase "Let's Explore" can be safely split into two parts for all required languages
    final letsExplore =
        AppLocalizations.of(context).translate("lets_explore").split(' ');
    final lets = letsExplore.length > 1 ? letsExplore.first + '\n' : '';
    final explore = letsExplore.length > 1
        ? letsExplore.sublist(1).join(' ').toUpperCase()
        : letsExplore.first.toUpperCase();

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade900, // Dark blue at the bottom
              Colors.blue.shade200, // Very light blue at the top
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Ensures text alignment to the left
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.all(
                      16.0), // Adds padding around the text for better layout
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Aligns text to the left
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: lets,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 30,
                                color: Colors.white,
                              ),
                            ),
                            TextSpan(
                              text: explore,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 48,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                          height:
                              4), // Adds space between "Let's Explore" and "City Name"
                      Text(
                        AppLocalizations.of(context).translate("city_name"),
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top:
                                12.0), // Adds space before the city description
                        child: Text(
                          AppLocalizations.of(context)
                              .translate("city_description"),
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Image.asset(
                  'assets/welcome_image2.jpg', // Ensure this asset path is correct
                  fit: BoxFit.cover,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .end, // Aligns the button and dropdown to the right
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AttractionsListPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // Button color
                        padding:
                            EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                      ),
                      child: Text(
                        AppLocalizations.of(context).translate("enter_button"),
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: LanguageDropdown(onLocaleChange: onLocaleChange),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LanguageDropdown extends StatefulWidget {
  final Function(Locale) onLocaleChange;

  LanguageDropdown({required this.onLocaleChange});

  @override
  _LanguageDropdownState createState() => _LanguageDropdownState();
}

class _LanguageDropdownState extends State<LanguageDropdown> {
  String _selectedLanguage = 'en'; // Default language is English

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: _selectedLanguage,
      onChanged: (String? newValue) {
        if (newValue != null) {
          setState(() {
            _selectedLanguage = newValue;
          });
          widget.onLocaleChange(Locale(newValue));
        }
      },
      items: [
        DropdownMenuItem<String>(
          value: 'en',
          child:
              Image.asset('assets/images/usa_flag.png', width: 32, height: 32),
        ),
        DropdownMenuItem<String>(
          value: 'fr',
          child: Image.asset('assets/images/france_flag.png',
              width: 32, height: 32),
        ),
        DropdownMenuItem<String>(
          value: 'pl',
          child: Image.asset('assets/images/poland_flag.png',
              width: 32, height: 32),
        ),
      ],
    );
  }
}
