import 'package:flutter/material.dart';
import 'package:imagine_cup_software/Dashboard/homepage.dart';
import 'package:imagine_cup_software/hardware_connection/main.dart';

class Success extends StatefulWidget {
  const Success({Key? key}) : super(key: key);

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff19786A),
        elevation: 1,
        title: Text("Confirmation Page",
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 20,
          fontFamily: "Lato"
        ),
        ),
        centerTitle: true,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width/1.2,
                  height: MediaQuery.of(context).size.height/4,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://static.vecteezy.com/system/resources/previews/005/006/021/original/check-mark-for-approved-success-done-concept-illustration-flat-design-eps10-simple-colorful-modern-graphic-element-for-landing-page-pop-up-information-empty-state-ui-infographic-vector.jpg"),
                    )
                  ),
                ),
                ElevatedButton(
                    onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
                    },
                    child: Text("Go Back To DashBoard",
                    style: TextStyle(
                      fontFamily: "Lato",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffFFA800)
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
