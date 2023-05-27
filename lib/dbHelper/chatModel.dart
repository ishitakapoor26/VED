import 'package:mongo_dart/mongo_dart.dart';
import 'dart:convert';

// chatModel mongoDbModelFromJson(String str)=>
//     chatModel.fromJson(json.decode(str));

// String mongoDbModelToJson(chatModel data)=> json.encode(data.toJson());

class chatModel {
  chatModel({
    required this.id,
    required this.name,
    required this.subject,
    required this.rating,
    required this.category,
    required this.experience,
    required this.about,
    required this.chatModelClass,
    required this.qualification,
    required this.contact,
    required this.profile,
  });

  ObjectId id;
  String name;
  String subject;
  String rating;
  String category;
  String experience;
  String about;
  String chatModelClass;
  String qualification;
  String contact;
  String profile;


  factory chatModel.fromJson(Map<String,dynamic> json)=> chatModel(
    id: json["_id"],
    name: json["name"],
    about: json["about"],
    subject: json["subject"],
    profile: json["profile"],
    rating: json["rating"],
    category: json["category"],
    experience: json["experience"],
    chatModelClass: json["chatModelClass"],
    qualification: json["qualification"],
    contact: json["contact"],
  );

  Map<String,dynamic> toJson()=>{
    "_id":id,
    "name":name,
    "about": about,
    "profile":profile,
    "subject":subject,
    "rating":rating,
    "category":category,
    "experience":experience,
    "chatModelClass":chatModelClass,
    "qualification":qualification,
    "contact": contact,
  };
}
