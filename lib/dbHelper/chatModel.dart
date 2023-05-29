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
    required this.qualification,
    required this.contact,
    required this.chatModelClass,
    required this.Profile,
  });

  ObjectId id;
  String name;
  String subject;
  String rating;
  String experience;
  String about;
  String qualification;
  String contact;
  String chatModelClass;
  String? Profile;

  factory chatModel.fromJson(Map<String,dynamic> json)=> chatModel(
    id: json["_id"],
    name: json["name"],
    subject: json["subject"],
    rating: json["rating"],
    experience: json["experience"],
    about: json["about"],
    qualification: json["qualification"],
    contact: json["contact"],
    chatModelClass: json["chatModelClass"],
    Profile: json["Profile"],
  );

  Map<String,dynamic> toJson()=>{
    "_id":id,
    "name":name,
    "subject":subject,
    "rating":rating,
    "experience":experience,
    "about": about,
    "qualification":qualification,
    "contact": contact,
    "chatModelClass":chatModelClass,
    "Profile": Profile,
  };
}
