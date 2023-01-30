import 'package:imagine_cup_software/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imagine_cup_software/test_yourself/start.dart';
import 'package:imagine_cup_software/read/pdfSelect.dart';
import 'package:imagine_cup_software/concepts/concepts.dart';

class appbar extends StatelessWidget {
  const appbar({Key? key, required this.title}) : super(key: key);

  final String title;
  final double barHeight = 55.0;

  @override
  Widget build(BuildContext context) {

    final double statusbarHeight = MediaQuery
        .of(context)
        .padding
        .top;

    return Container(
      padding: EdgeInsets.only(top: statusbarHeight),
      height: statusbarHeight + barHeight,
      child: Center(
        child: Text(
          title,
          style: TextStyle(fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
        ),
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff2683E5), Color(0xff36ABFB)],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0.5, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
    );
  }
}


class navbar extends StatefulWidget {
  const navbar({Key? key}) : super(key: key);

  @override
  State<navbar> createState() => _navbarState();
}

class _navbarState extends State<navbar> {
  int currentIndex = 0;
  final screens = [
    Dashboard(),
    PdfSelect(),
    Concepts(),
    StartScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        iconSize: 30, selectedFontSize: 25,
        unselectedFontSize: 20,


        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_rounded, color: Colors.white,), backgroundColor: Colors.blue),
          BottomNavigationBarItem(icon: Icon(Icons.library_books_rounded, color: Colors.white,),backgroundColor: Colors.blue),
          BottomNavigationBarItem(icon: Icon(Icons.play_lesson_rounded, color: Colors.white,),  backgroundColor: Colors.blue),
          BottomNavigationBarItem(icon: Icon(Icons.lightbulb_rounded, color: Colors.white,),  backgroundColor: Colors.blue),
        ],
        onTap: (index) =>setState(() { currentIndex = index;},),
      ),
    );
  }
}