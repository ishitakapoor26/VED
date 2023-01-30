import 'dart:ui';
import 'dart:math' as math;
import 'package:imagine_cup_software/place.dart';
import 'package:imagine_cup_software/read/pdfSelect.dart';
import 'package:imagine_cup_software/test_yourself/start.dart';
import 'package:flutter/material.dart';

// import 'Vibration/SquareLevel1.dart';
import 'concepts/concepts.dart';
import 'hardware_connection/main.dart';

final List<Widget> lst = [
  PdfSelect(),
  Concepts(),
  StartScreen(),
  App(),
];

class PlaceItem extends StatelessWidget {
  final Place place;
  const PlaceItem({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void onClick(String title) {
      if (title == 'Concepts & Explanations') {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) => lst[1]));
      } else if (title == 'Study Material') {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) => lst[0]));
      } else if (title == 'Test Yourself') {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) => lst[2]));
      } else if (title == 'Practice') {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) => lst[3]));
      }
    }

    return GestureDetector(
      onTap: () => {onClick(place.title)},
      child: Container(
        height: place.height,
        alignment: Alignment.bottomLeft,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(2.0, 2.0), //(x,y)
              blurRadius: 3.0,
            ),
          ],
          borderRadius: BorderRadius.circular(14),
          gradient: LinearGradient(
            colors: [Color(0xffC9E9FF), Color(0xffA4DAFF), Color(0xff53B9FF)],
            // begin: const FractionalOffset(0.0, 0.0),
            // end: const FractionalOffset(0.5, 0.0),
            stops: [0.0, 0.3, 0.7],
            begin: Alignment(-1.0, 0.0),
            end: Alignment(1.0, 0.0),
            // colors: [],
            // stops: [],
            transform: GradientRotation(math.pi / 4),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(place.imageUrl),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  place.title,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}
