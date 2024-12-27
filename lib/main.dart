import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SoundPlayerScreen(),
    );
  }
}

class SoundPlayerScreen extends StatefulWidget {
  const SoundPlayerScreen({super.key});

  @override
  _SoundPlayerScreenState createState() => _SoundPlayerScreenState();
}

class _SoundPlayerScreenState extends State<SoundPlayerScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false; // Tracks whether audio is playing
  String? _currentFile; // Tracks the currently playing file

  void _togglePlayPause(String fileName) async {
    try {
      if (_isPlaying && _currentFile == fileName) {
        await _audioPlayer.pause();
        setState(() {
          _isPlaying = false;
        });
      } else {
        await _audioPlayer.play(AssetSource(fileName));
        setState(() {
          _isPlaying = true;
          _currentFile = fileName;
        });
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error playing sound: $e");
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Failed to play sound. Please try again."),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text('KidTunes: Play & Pause Fun'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/BackGround4.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 250.0,
                height: 30.0,
                child: DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 25.0,
                    color: Color.fromARGB(255, 0, 212, 127),
                    fontWeight: FontWeight.bold,
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      RotateAnimatedText('Play Fun Sounds!'),
                      RotateAnimatedText('Pause Anytime!'),
                      RotateAnimatedText('Enjoy Music!'),
                      RotateAnimatedText('Listen and Enjoy!'),
                    ],
                    repeatForever: true,
                  ),
                ),
              ),
              const SizedBox(height: 24.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => _togglePlayPause('chora.mp3'),
                    child: Container(
                      height: 150,
                      width: 400,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage('assets/chora.jpg'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 120, left: 140, right: 140, bottom: 10),
                        child: ElevatedButton.icon(
                          onPressed: () => _togglePlayPause('chora.mp3'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          icon: Icon(
                            _isPlaying && _currentFile == 'chora.mp3'
                                ? Icons.pause
                                : Icons.play_arrow,
                            color: Colors.white,
                          ),
                          label: Text(
                            _isPlaying && _currentFile == 'chora.mp3'
                                ? 'Pause'
                                : 'Play Chora',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 30.0),
                  Container(
                    height: 150,
                    width: 400,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('assets/chora2.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 120, left: 140, right: 140, bottom: 10),
                      child: ElevatedButton.icon(
                        onPressed: () => _togglePlayPause('chora2.mp3'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        icon: Icon(
                          _isPlaying && _currentFile == 'chora2.mp3'
                              ? Icons.pause
                              : Icons.play_arrow,
                          color: Colors.white,
                        ),
                        label: Text(
                          _isPlaying && _currentFile == 'chora2.mp3'
                              ? 'Pause'
                              : 'Play Chora',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30.0,
                  ),
                  Container(
                    height: 150,
                    width: 400,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('assets/chora3.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 120, left: 140, right: 140, bottom: 10),
                      child: ElevatedButton.icon(
                        onPressed: () => _togglePlayPause('chora3.mp3'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        icon: Icon(
                          _isPlaying && _currentFile == 'chora3.mp3'
                              ? Icons.pause
                              : Icons.play_arrow,
                          color: Colors.white,
                        ),
                        label: Text(
                          _isPlaying && _currentFile == 'chora3.mp3'
                              ? 'Pause'
                              : 'Play Chora',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 150,
                    width: 400,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('assets/chora4.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 120, left: 140, right: 140, bottom: 10),
                      child: ElevatedButton.icon(
                        onPressed: () => _togglePlayPause('chora4.mp3'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        icon: Icon(
                          _isPlaying && _currentFile == 'chora4.mp3'
                              ? Icons.pause
                              : Icons.play_arrow,
                          color: Colors.white,
                        ),
                        label: Text(
                          _isPlaying && _currentFile == 'chora4.mp3'
                              ? 'Pause'
                              : 'Play Chora',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 24.0),
                  Container(
                    height: 150,
                    width: 400,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('assets/chora5.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 120, left: 140, right: 140, bottom: 10),
                      child: ElevatedButton.icon(
                        onPressed: () => _togglePlayPause('chora5.mp3'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        icon: Icon(
                          _isPlaying && _currentFile == 'chora5.mp3'
                              ? Icons.pause
                              : Icons.play_arrow,
                          color: Colors.white,
                        ),
                        label: Text(
                          _isPlaying && _currentFile == 'chora5.mp3'
                              ? 'Pause'
                              : 'Play Chora',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
