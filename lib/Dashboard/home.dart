import 'package:flutter/material.dart';
import 'package:imagine_cup_software/chat/tutorList.dart';

import '../concepts/concepts.dart';
import '../read/pdfSelect.dart';
import '../test_yourself/start.dart';
import 'dashboard.dart';
import 'homepage.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final tabs= <Widget>[
    Homepage(),
    Dashboard(),
    Concepts(),
    chatList(),
  ];
  int _currentIndex=0;
  
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        iconSize: 30.0,
        backgroundColor: Colors.grey.shade100,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,
              // color: Colors.grey,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.category,
                // color: Colors.grey,
              ),
              label: "Category"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark,
                // color: Colors.grey,
              ),
              label: "Bookmark"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat,
                // color: Colors.grey,
              ),
              label: "Chat"
          ),
        ],
        onTap: (index){
          setState(() {
            _currentIndex=index;
          });
        },
        selectedItemColor: Color(0xff19786A),
        // selectedIconTheme: ,
      ),
      body: SafeArea(
        child: tabs.elementAt(_currentIndex),
      ),
    );
  }
}
