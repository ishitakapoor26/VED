import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:imagine_cup_software/splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dbHelper/mongodb.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp],
  );
  await Firebase.initializeApp();
  await MongoDatabase.connect();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Drishti',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: splashscreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
