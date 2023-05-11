import 'package:flutter/material.dart';
import 'package:imagine_cup_software/Dashboard/dashboard.dart';

class onboardSecond extends StatelessWidget {
  const onboardSecond({Key? key}) : super(key: key);

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
                    image: AssetImage("assets/Group 52.png"),
                    fit: BoxFit.cover
                )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 60.0),
                  child: Text(
                    "Want To Learn Science and Mathematics in an Interesting Way?",
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: "Lato",
                        color: Colors.white,
                        fontWeight: FontWeight.w700
                    ),
                    textAlign: TextAlign.center,
                    ),
                ),


                Image.asset('assets/rafiki.png',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/2.8,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 45.0, vertical:3),
                  child: ElevatedButton(
                      onPressed:(){} ,
                      child: Text("Register",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        fontFamily: "Lato"
                      ),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffFFA800),
                    minimumSize: const Size.fromHeight(50),
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?",style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                          fontFamily: "Lato",
                        color: Colors.white,
                      ),),
                      GestureDetector(
                        child: Text(" Log In",style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          fontFamily: "Lato",
                          color: Color(0xffFFA800),
                        ),),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 35),
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
                      padding: const EdgeInsets.symmetric(vertical: 35.0),
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
                              backgroundColor: Colors.white54,
                            ),
                          ),
                          CircleAvatar(
                            radius: 4,
                            backgroundColor: Color(0xffFFA800),
                          )
                        ],
                      ),),
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
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));
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
