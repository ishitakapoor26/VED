import 'package:mongo_dart/mongo_dart.dart';
import 'dart:convert';

class conceptModel {

  conceptModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
  });

  ObjectId id;
  String title;
  String description;
  String image;

 factory conceptModel.fromJson(Map<String,dynamic> json)=> conceptModel(
     id: json["_id"],
     title: json["title"],
     description: json["description"],
     image: json["image"],
 );

 Map<String,dynamic> toJson()=>{
   "_id":id,
   "title":title,
   "description": description,
   "image":image
 };
 }
