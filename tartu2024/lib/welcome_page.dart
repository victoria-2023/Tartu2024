import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'main.dart'; // Make sure this points to your file with AttractionsListPage.
import 'app_localizations.dart'; // Ensure this is correctly imported.

class WelcomePage extends StatelessWidget {
  final Function(Locale) onLocaleChange;

  WelcomePage({required this.onLocaleChange});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context).translate("lets_explore"),
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context).translate("city_name"),
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.blue,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    child: Text(
                      AppLocalizations.of(context)
                          .translate("city_description"),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        gradient: LinearGradient(
                          colors: [
                            Colors.blue.shade900,
                            Colors.blue.shade500,
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
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
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          padding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
                        child: Text(
                          AppLocalizations.of(context)
                              .translate("enter_button"),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    child: LanguageDropdown(
                        onLocaleChange: onLocaleChange), // Language dropdown
                  ),
                ],
              ),
            ),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: VideoPlayerScreen(), // The Video Player section
            ),
          ],
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
  String _selectedLanguage = 'en'; // Default language code

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
        setState(() {}); // Rebuild the widget after the video is initialized.
        _controller.play();
        _controller.setLooping(true);
      });
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? VideoPlayer(_controller)
        : Center(child: CircularProgressIndicator());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
