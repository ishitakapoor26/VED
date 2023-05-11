import 'package:flutter/material.dart';
import 'package:imagine_cup_software/onboardingScreens/onboardSecond.dart';

class onboardUI extends StatelessWidget {
  const onboardUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Color(0xff19786A),
                image: DecorationImage(
                    opacity: 0.25,
                    image: AssetImage("assets/Group 53.png"),
                    fit: BoxFit.cover
                )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Padding(
                  padding: const EdgeInsets.only(left: 18.0, top: 40),
                  child: Image.asset('assets/amico.png',
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height/2.6,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 38.0, bottom: 13),
                  child: Text(
                    "Real Time Practice.\nNo Braille.\nNo Tactile Materials.\nNo Interpreters.",
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: "Lato",
                        color: Colors.white,
                        fontWeight: FontWeight.w700
                    )
                    ,),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, bottom: 8.0, right: 20.0),
                  child: Text("Sketch elementry figures on the app. Touch and understand the so traced figure on the hardware.",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Lato",
                      color: Colors.white70,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 6,),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 3),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: CircleAvatar(
                          radius: 24,
                          backgroundColor: Color(0xffFFA800),
                          child: IconButton(
                            icon: Icon(Icons.arrow_back_ios,
                              color: Colors.white,),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 50.0),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CircleAvatar(
                              radius: 4,
                              backgroundColor: Colors.white54,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: CircleAvatar(
                                radius: 4,
                                backgroundColor: Color(0xffFFA800),
                              ),
                            ),
                            CircleAvatar(
                              radius: 4,
                              backgroundColor: Colors.white54,
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 3),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: CircleAvatar(
                          radius: 24,
                          backgroundColor: Color(0xffFFA800),
                          child: IconButton(
                            icon: Icon(Icons.arrow_forward_ios,
                              color: Colors.white,),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => onboardSecond()));
                            },
                          ),
                        ),
                      ),)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
