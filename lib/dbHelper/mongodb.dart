import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:imagine_cup_software/dbHelper/constant.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabase{
 static var db, conceptCollection, readCollection, chatCollection, testCollection;
 static connect() async{
   db= await Db.create(MONGO_CONN_URL);
   await db.open();
   inspect(db);
   var status= db.serverStatus();
   print(status);
   conceptCollection =db.collection(USER_COLLECTION[0]);
   readCollection= db.collection(USER_COLLECTION[1]);
   chatCollection= db.collection(USER_COLLECTION[2]);
   testCollection= db.collection(USER_COLLECTION[3]);
   // print(await userCollection.find().toList());
 }

 static Future<List<Map<String, dynamic>>> getData(int index) async{
   var arrData;
   if(index==0){
   arrData= await conceptCollection.find().toList();
   return arrData;
   }else if(index==1){
     arrData= await readCollection.find().toList();
     return arrData;
   }else if(index==2){
     arrData= await chatCollection.find().toList();
     return arrData;
   }else if(index==3){
     arrData= await testCollection.find().toList();
     return arrData;
   }
   return arrData;
 }

}