import 'package:flutter/material.dart';
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
        backgroundColor: Colors.white,
        elevation: 1,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.black,),
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
            child: Container(
              width: MediaQuery.of(context).size.width/1.2,
              height: MediaQuery.of(context).size.height/1.2,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://static.vecteezy.com/system/resources/previews/005/006/021/original/check-mark-for-approved-success-done-concept-illustration-flat-design-eps10-simple-colorful-modern-graphic-element-for-landing-page-pop-up-information-empty-state-ui-infographic-vector.jpg"),
                )
              ),
            ),
          ),
        ),
      ),
    );
  }
}
