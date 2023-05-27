import 'dart:ui';
import 'dart:math' as math;
import 'package:imagine_cup_software/Dashboard/place.dart';
import 'package:imagine_cup_software/read/pdfSelect.dart';
import 'package:imagine_cup_software/test_yourself/start.dart';
import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart';

// import 'Vibration/SquareLevel1.dart';
import '../concepts/concepts.dart';
import '../hardware_connection/main.dart';

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
            .push(MaterialPageRoute(builder: (context) => lst[1]));
      } else if (title == 'Study Material') {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => lst[0]));
      } else if (title == 'Test Yourself') {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => lst[2]));
      } else if (title == 'Practice') {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => lst[3]));
      }
    }

    return GestureDetector(
      onTap: () => {onClick(place.title)},
      child: Container(
        height: place.height,
        // alignment: Alignment.bottomLeft,
        decoration: BoxDecoration(
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey,
          //     offset: Offset(2.0, 2.0), //(x,y)
          //     blurRadius: 3.0,
          //   ),
          // ],
          borderRadius: BorderRadius.circular(14),
          color: place.color,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top:12.0, left: 15, bottom: 8),
                child: Text(
                  place.title,
                  style: TextStyle(
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(place.imageUrl,
              height: MediaQuery.of(context).size.height/place.divider,),
            ),
          ],
        ),
      ),

    );
  }
}
