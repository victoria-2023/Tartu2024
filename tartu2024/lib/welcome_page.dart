import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'main.dart'; // Make sure this points to your file with AttractionsListPage.

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // Wrap your content with SafeArea
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
                    "LET'S EXPLORE",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  Text(
                    "TARTU2024",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.blue,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    child: Text(
                      "Tartu: A Haven for Explorers - Unlock Adventure, Wellness, and Serenity in Estonia's Playground!",
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
                          'ENTER',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
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
        setState(() {}); // Rebuild the widget after video is initialized.
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
