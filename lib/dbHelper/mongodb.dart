import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:imagine_cup_software/dbHelper/constant.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabase{
 static var db, userCollection;
 static connect() async{
   db= await Db.create(MONGO_CONN_URL);
   await db.open();
   inspect(db);
   var status= db.serverStatus();
   print(status);
   userCollection =db.collection(USER_COLLECTION);
   print(await userCollection.find().toList());
 }}