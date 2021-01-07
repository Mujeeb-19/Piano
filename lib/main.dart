import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:imagebutton/imagebutton.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int soundNumber) {
    final player = AudioCache();
    player.play('note$soundNumber.wav');
  }

  Expanded buildKey({String color, int soundNumber}) {
    return Expanded(
      child: ImageButton(
        children: <Widget>[
          Text(
            '$color',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
          ),
          Padding(
            padding: EdgeInsets.zero,
          )
        ],
        width: 350,
        height: 66,
        unpressedImage: Image.asset("assets/pressed.png"),
        pressedImage: Image.asset("assets/normal.png"),
        onTap: () {
          playSound(soundNumber);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'PIANO',
            textAlign: TextAlign.center,
          ),
        ),
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildKey(color: 'D', soundNumber: 4),
              buildKey(color: 'E', soundNumber: 5),
              buildKey(color: 'F', soundNumber: 6),
              buildKey(color: 'G', soundNumber: 7),
              buildKey(color: 'A', soundNumber: 1),
              buildKey(color: 'B', soundNumber: 2),
              buildKey(color: 'C', soundNumber: 3),
            ],
          ),
        ),
      ),
    );
  }
}
