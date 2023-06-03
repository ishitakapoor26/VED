
import 'package:flutter/material.dart';
import '../Dashboard/dashboard.dart';
import 'test_yourself.dart';
class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Color(0xff19786A),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: () {
            Navigator.of(context).pop();
          },

        ),
        title: Text("Test Yourself"),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Image(image: AssetImage('assets/test.png',),
                ),
              ),

              SizedBox(height: 50,width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffFFA800),
                  ),
                  child: Text("Let's Begin",

                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Lato",
                        fontSize: 18

                    ),
                  ),
                  // color: new Color(0xff622F74),
                  onPressed: (){
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context)=>SpeechScreen()),
                    );
                  },
                ),
              ),
            ]),
      ),

    )

    ;
  }
}
