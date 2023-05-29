import 'package:mongo_dart/mongo_dart.dart';
import 'dart:convert';

class chatModel {
  chatModel({
    required this.id,
    required this.name,
    required this.subject,
    required this.rating,
    required this.experience,
    required this.about,
    required this.chatModelClass,
    required this.qualification,
    required this.contact,
  });

  ObjectId id;
  String name;
  String subject;
  String rating;
  String experience;
  String about;
  String chatModelClass;
  String qualification;
  String contact;


  factory chatModel.fromJson(Map<String,dynamic> json)=> chatModel(
    id: json["_id"],
    name: json["name"],
    about: json["about"],
    subject: json["subject"],
    rating: json["rating"],
    experience: json["experience"],
    chatModelClass: json["chatModelClass"],
    qualification: json["qualification"],
    contact: json["contact"],
  );

  Map<String,dynamic> toJson()=>{
    "_id":id,
    "name":name,
    "about": about,
    "subject":subject,
    "rating":rating,
    "experience":experience,
    "chatModelClass":chatModelClass,
    "qualification":qualification,
    "contact": contact,
  };
}
