import 'dart:async';
import 'package:imagine_cup_software/Widget.dart';
import 'package:imagine_cup_software/dashboardUI.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../dashboard.dart';

List<dynamic> myList = ["90", 'square', '11', 'triangle', 'parallelogram'];
List<String> questions = [
  '1. What angle does square figure enclose? Please enter the input by taping on the microphone.',
  '2. Name the shape illustrated through the hardware. Please enter the input by taping on the microphone. ',
  '3. Add two numbers: 5 + 6. Please enter the input by taping on the microphone.',
  '4. I have three corners and three sides. Who am I? Please enter the input by taping on the microphone.',
  '5. I have four sides. My opposite sides are equal and parallel. Who am I? Please enter the input by taping on the microphone.'
];

class SpeechScreen extends StatefulWidget {
  @override
  _SpeechScreenState createState() => _SpeechScreenState();
}

class _SpeechScreenState extends State<SpeechScreen> {
  SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  int i = 0;
  String _lastWords = '';

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  /// This has to happen only once per app
  void _initSpeech() async {
    bool available = await _speechToText.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'));
    if (available) {
      setState(() {
        _speechEnabled = true;
      });
      _speechToText.listen(
        onResult: (val) => setState(() {
          _lastWords = val.recognizedWords;
          print(_lastWords);
          // result= isl(_lastWords);
        }),
      );
    } else {
      setState(() {
        _speechEnabled = false;
        _speechToText.stop();
      });
    }
  }
  void increment(){
    setState(() {
      i=i+1;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Dashboard()));
          },
        ),
        title: Text('Test Yourself'),
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
          bottom: 10.0,
        ),
        child: AvatarGlow(
          animate: _speechEnabled,
          glowColor: Colors.blue,
          endRadius: 80,
          duration: Duration(milliseconds: 2000),
          repeatPauseDuration: Duration(milliseconds: 100),
          repeat: true,
          child: FloatingActionButton(
            onPressed: () => _initSpeech(),
            child: Icon(_speechEnabled ? Icons.mic : Icons.mic_none),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                questions[i],
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_lastWords.toLowerCase()== myList[i]) {
                  print("true");
                  print(_lastWords);
                  increment();
                }
                else if(i>4){

                }
                else {
                  print("false");
                  print(_lastWords);
                  print(myList[i]);
                }
              },
              child: Text("Check Answer"),
            ),
          ],
        ),
      ),
    );
  }
}
