import 'dart:ui';

import 'package:flutter/material.dart';

import '../classes/language_constants.dart';

class Place{
  String title;
  Color color;
  String imageUrl;
  double height;
  double divider;

  Place(this.title, this.imageUrl, this.height, this.color, this.divider);

  static List<Place> generatePlaces(BuildContext context) {
    return [
      Place(translation(context).concept, "assets/concept.png", 4,Colors.tealAccent.shade100, 5.8),
      Place(translation(context).study,"assets/read.png",3.2,Colors.lightBlueAccent.shade100,4.6),
      Place(translation(context).practice, "assets/practice2.png", 3.3,Colors.redAccent.shade100,4.8),
      Place(translation(context).test, "assets/test.png", 3.5,Colors.orange.shade100,5.2),
    ];
  }
}