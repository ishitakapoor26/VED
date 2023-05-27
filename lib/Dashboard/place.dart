import 'dart:ui';

import 'package:flutter/material.dart';

class Place{
  String title;
  Color color;
  String imageUrl;
  double height;
  double divider;

  Place(this.title, this.imageUrl, this.height, this.color, this.divider);

  static List<Place> generatePlaces() {
    return [
      Place('Concepts', "assets/concept.png", 4,Colors.tealAccent.shade100, 5.8),
      Place('Study Material',"assets/read.png",3.5,Colors.lightBlueAccent.shade100,4.6),
      Place('Practice', "assets/practice2.png", 3.3,Colors.redAccent.shade100,4.8),
      Place('Test Yourself', "assets/test.png", 3.5,Colors.orange.shade100,5.2),
    ];
  }
}