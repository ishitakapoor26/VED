import 'package:mongo_dart/mongo_dart.dart';
import 'dart:convert';

class readModel {

  readModel({
    required this.id,
    required this.title,
    required this.url,
    required this.image,
  });

  ObjectId id;
  String title;
  String url;
  String image;

  factory readModel.fromJson(Map<String,dynamic> json)=> readModel(
    id: json["_id"],
    title: json["title"],
    url: json["url"],
    image: json["image"],
  );

  Map<String,dynamic> toJson()=>{
    "_id":id,
    "title":title,
    "url": url,
    "image":image
  };
}
