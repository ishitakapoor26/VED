import 'package:imagine_cup_software/concepts/concepts.dart';
import 'package:flutter/material.dart';
import 'package:imagine_cup_software/onboardingScreens/onboardUI.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:intro_slider/dot_animation_enum.dart';
import 'package:imagine_cup_software/Dashboard/dashboard.dart';

class IntroSliderPage extends StatefulWidget {
  const IntroSliderPage({Key? key}) : super(key: key);

  @override
  State<IntroSliderPage> createState() => _IntroSliderPageState();
}



class _IntroSliderPageState extends State<IntroSliderPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Color(0xff19786A),
              image: DecorationImage(
                opacity: 0.25,
                image: AssetImage("assets/Group 52.png"),
                fit: BoxFit.cover
              )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 38.0, bottom: 8),
                  child: Text(
                    "Listen.\nUnderstand.\nImprove.\nApply.",
                    style: TextStyle(
                      fontSize: 33,
                      fontFamily: "Lato",
                      color: Colors.white,
                      fontWeight: FontWeight.w700
                    )
                    ,),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, bottom: 12.0, top:8, right: 20.0),
                  child: Text("Listen to the explanation of the Maths and Science concepts. Understand them using the real time practice feature."
                      "Improvise and enhance your learning by practical implementation of grasped concepts.",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Lato",
                      color: Colors.white70,
                      fontWeight: FontWeight.w500,
                  ),
                  maxLines: 6,),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Image.asset('assets/bro.png',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/2.8,),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 38.0, bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 4,
                        backgroundColor: Color(0xffFFA800),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: CircleAvatar(
                          radius: 4,
                          backgroundColor: Colors.white54,
                        ),
                      ),
                      CircleAvatar(
                        radius: 4,
                        backgroundColor: Colors.white54,
                      ),

              ],
            ),
          ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: CircleAvatar(
                      radius: 24,
                      backgroundColor: Color(0xffFFA800),
                      child: IconButton(
                        icon: Icon(Icons.arrow_forward_ios,
                          color: Colors.white,),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => onboardUI()));
                        },
                      ),
                    ),
                  ),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
