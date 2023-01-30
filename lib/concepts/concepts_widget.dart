import 'package:audioplayers/audioplayers.dart';
// import 'package:e_drishti/Vibration/SquareLevel1.dart';
import 'package:imagine_cup_software/concepts/concepts.dart';
import 'package:flutter/material.dart';

class Concept_Widget extends StatelessWidget {
   Concept_Widget({Key? key, required this.title, required this.content, required this.image}) : super(key: key);
  // static AudioCache player = new AudioCache();
  final String title;
  final String content;
  final String image;

  final player = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Concepts & Explanation'),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> Concepts()));
          },
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 45.0,bottom: 12.0,left: 14.0),
              child: Text(title,style: TextStyle(
                fontSize: 27.0,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
              ),),
            ),
            Padding(
              padding: const EdgeInsets.only( top: 30, left: 20.0, right: 20.0,bottom: 20),
              child: Image.network(image,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32.0, left: 23, right: 23),
              child: Text(content,style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
              ),),
            ),
           SizedBox(
             height: MediaQuery.of(context).size.height/15,
           ),
           Padding(
             padding: const EdgeInsets.only(bottom: 20.0, left: 14, right: 14),
             child: ElevatedButton(
                    onPressed: () {
                      if(title=='What is a Sine Graph?'){
                        player.play(AssetSource('Sin.mp3'));
                      }
                      else if (title=='What is a Modulus Function Graph?'){
                        const alarmAudioPath = "Mod x.mp3";
                        player.play(AssetSource(alarmAudioPath));
                      }

                      },
                    child: Text(
                      'Understand the Concept Practically',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 17.0,
                        color: Colors.white,
                      ),
                    ),
                  style: ElevatedButton.styleFrom(
                    onPrimary: Colors.blue,
                    minimumSize: const Size.fromHeight(58),
                  ),
                  ),
           ),

          ],
        ),
      ),
    );
  }
}
