import 'package:audioplayers/audioplayers.dart';
// import 'package:e_drishti/Vibration/SquareLevel1.dart';
import 'package:imagine_cup_software/concepts/concepts.dart';
import 'package:flutter/material.dart';

import '../classes/language_constants.dart';

class Concept_Widget extends StatelessWidget {
  Concept_Widget(
      {Key? key,
      required this.title,
      required this.description,
      required this.image})
      : super(key: key);
  // static AudioCache player = new AudioCache();
  final String title;
  final String description;
  final String image;

  final player = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(translation(context).concept),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: Color(0xff19876A),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(25),
              child: Image.network(
                image,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.all(20),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 27.0,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Lato',
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                description,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Lato',
                ),
              ),
            ),
            // SizedBox(
            //   height: MediaQuery.of(context).size.height/15,
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width/5,
                      height: MediaQuery.of(context).size.height/15,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.bookmark,
                          color: Colors.white,
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffFFA800),
                            // minimumSize: Size.fromHeight(3)
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      width: MediaQuery.of(context).size.width/1.6,
                      height: MediaQuery.of(context).size.height/15,
                      child: ElevatedButton(
                        onPressed: () {
                          if (title == 'Graphs: Understanding Sine Graph') {
                            player.play(AssetSource('Sin.mp3'));
                          } else if (title == 'What is a Modulus Function Graph?') {
                            const alarmAudioPath = "Mod x.mp3";
                            player.play(AssetSource(alarmAudioPath));
                          }
                        },
                        child: Text(
                          'Understand Practically',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w600,
                            fontSize: 18.0,
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff19876A),
                          // minimumSize: const Size.fromHeight(5),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
