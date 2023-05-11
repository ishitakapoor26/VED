import 'dart:async';
import 'package:imagine_cup_software/Widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import 'package:imagine_cup_software/onboardingScreens/intro_slider.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({ Key? key }) : super(key: key);

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {

  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 10),(){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => IntroSliderPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            // Align( alignment: Alignment.topCenter,child: appbar(title: 'E-Drishti'),),
            Align(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 50.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/drishti.png"),
                      radius: MediaQuery.of(context).size.height * 0.25,
                      backgroundColor: Colors.transparent,
                    ),
                  ],
                ),
              ),),
          ],
        )
    );
  }
}
