import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'main.dart'; // Making sure this points to my file with AttractionsListPage.
import 'app_localizations.dart'; // Ensuring this is correctly imported.

class WelcomePage extends StatelessWidget {
  final Function(Locale) onLocaleChange;

  WelcomePage({required this.onLocaleChange});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade900, // Dark blue at the bottom
              Colors.blue.shade300, // Lighter blue at the top
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context).translate("lets_explore"),
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // White text for better contrast
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context).translate("city_name"),
                      style: TextStyle(
                        fontSize: 36,
                        color: Colors.white, // White text for better contrast
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        AppLocalizations.of(context)
                            .translate("city_description"),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white, // White text for better contrast
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Image.asset(
                  'assets/welcome_image.jpg', // Use the local asset image
                  fit: BoxFit.cover,
                ),
              ),
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
                    disabledBackgroundColor: Colors.white, // Text color
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  ),
                  child: Text(
                    AppLocalizations.of(context).translate("enter_button"),
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: LanguageDropdown(onLocaleChange: onLocaleChange),
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
          child: Text('English'),
        ),
        DropdownMenuItem<String>(
          value: 'fr',
          child: Text('French'),
        ),
        DropdownMenuItem<String>(
          value: 'pl',
          child: Text('Polish'),
        ),
      ],
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/welcome_video.mp4')
      ..initialize().then((_) {
        setState(
            () {}); // Rebuilding the widget after the video is initialized. Fun times ahead!
        _controller.play();
        _controller.setLooping(true);
      });
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? VideoPlayer(_controller) // Let's roll the video!
        : Center(
            child:
                CircularProgressIndicator()); // Loading... because good things take time
  }

  @override
  void dispose() {
    _controller.dispose(); // I'm done playing, let's clean up!
    super.dispose();
  }
}
