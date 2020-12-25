import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static AudioCache cache = AudioCache();
  AudioPlayer audioPlayer;
  String durasi = "00:00:00";

  void playSound() async{
    if(audioPlayer != null){
      stopSound();
    }

    audioPlayer = await cache.play("chun-li.mp3");
    audioPlayer.onAudioPositionChanged.listen((duration) {
      setState(() {
        durasi = duration.toString();
      });
    });
    audioPlayer.setReleaseMode(ReleaseMode.LOOP);
  }

  void pauseSound() async{
    await audioPlayer.pause();
  }

  void resumeSound() async{
    await audioPlayer.resume();
  }

  void stopSound() async{
    await audioPlayer.stop();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Play Music")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                onPressed: () {
                  playSound();
                },
                child: Text("Play"),
              ),
              RaisedButton(
                onPressed: () {
                  pauseSound();
                },
                child: Text("Pause"),
              ),
              RaisedButton(
                onPressed: () {
                  stopSound();
                },
                child: Text("Stop"),
              ),
              RaisedButton(
                onPressed: () {
                  resumeSound();
                },
                child: Text("Resume"),
              ),
              Text(
                durasi,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ),
    );
  }
}
