import 'dart:ui';

import 'package:flutter/material.dart';

class Place{
  String title;
  Color color;
  String imageUrl;
  double height;

  Place(this.title, this.imageUrl, this.height, this.color);

  static List<Place> generatePlaces() {
    return [
      Place('Concepts', "assets/professor.png", 200,Colors.tealAccent.shade100),
      Place('Study Material',"assets/audiobook.png",240,Colors.amberAccent.shade100),
      Place('Practice', "assets/practice.png", 230,Colors.blue.shade100),
      Place('Test Yourself', "assets/cute.png", 220,Colors.orange.shade100),
    ];
  }
}