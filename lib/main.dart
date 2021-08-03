import 'package:audioplayers/audio_cache.dart'; //Importing the audioplayers plugin in order to play a sound
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Main function
void main() => runApp(PianoApp());

class PianoApp extends StatefulWidget {
  @override
  _PianoAppState createState() => _PianoAppState();
}

class _PianoAppState extends State<PianoApp> {
  late Color bgColor;

  @override
  void initState({Color? color}) {
    super.initState();
    bgColor = Colors.cyan;
  }

  void change(Color? color) {
    setState(() {
      bgColor = Colors.deepPurple;
    });
  }

  void playSound(int soundNumber) {
    AudioCache player = AudioCache(prefix: 'assets/sounds/');
    player.play('rastyanutyiy$soundNumber.wav');
  }

  Expanded newExpanded({Color? color, String? text, int? soundNumber}) {
    return Expanded(
      child: MaterialButton(
        onPressed: () {
          change(bgColor);
          playSound(soundNumber!);
        },
        child: Container(
          color: color,
          child: Center(
            child: CircleAvatar(
              backgroundColor: bgColor,
              child: Text(
                text!,
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  //backgroundColor: Colors.blue,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black54,
        appBar: AppBar(
          backgroundColor: Colors.black12,
          title: Text('Play anything'),
        ),
        body: Column(
          children: [
            newExpanded(
              soundNumber: 1,
              color: Colors.red,
              text: 'C',
            ),
            newExpanded(
              soundNumber: 2,
              color: Colors.orange,
              text: 'D',
            ),
            newExpanded(
              soundNumber: 3,
              color: Colors.yellow,
              text: 'E',
            ),
            newExpanded(
              soundNumber: 4,
              color: Colors.green,
              text: 'F',
            ),
            newExpanded(
              soundNumber: 5,
              color: Colors.indigo,
              text: 'G',
            ),
            newExpanded(
              soundNumber: 6,
              color: Colors.blue,
              text: 'A',
            ),
            newExpanded(
              soundNumber: 7,
              color: Colors.purple,
              text: 'B',
            ),
          ],
        ),
      ),
    );
  }
}

// class PianoApp extends StatelessWidget {
//   void playSound(int soundNum) {
//     final player = AudioCache();
//     player.play('rastyanutyiy$soundNum.wav');
//   }
//
//   Expanded buildKey({Color? color, required int soundNum}) {
//     return Expanded(
//       child: MaterialButton(
//         color: color,
//         onPressed: () {
//           return playSound(soundNum);
//         },
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.teal,
//         appBar: AppBar(
//           title: Text('Play piano'),
//           backgroundColor: Colors.black54,
//         ),
//         body: SafeArea(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               buildKey(color: Colors.red, soundNum: 1),
//               buildKey(color: Colors.orange, soundNum: 2),
//               buildKey(color: Colors.yellow, soundNum: 3),
//               buildKey(color: Colors.green, soundNum: 4),
//               buildKey(color: Colors.blue, soundNum: 5),
//               buildKey(color: Colors.indigo, soundNum: 6),
//               buildKey(color: Colors.purple, soundNum: 7),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
