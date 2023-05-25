import 'package:flutter/material.dart';

import '../concepts/concepts.dart';
import '../read/pdfSelect.dart';
import '../test_yourself/start.dart';
import 'dashboard.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("Hello, Alex!",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black54,
                      fontFamily: "Lato",
                      fontWeight: FontWeight.w600,
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: IconButton(
                        iconSize: 30.0,
                        onPressed: (){},
                        icon: Icon(Icons.account_circle),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text("Find Your Favourite\nCourse To Study",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  fontFamily: "Lato",
                ),
                maxLines: 3,),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        style: TextStyle(
                          letterSpacing: 0.5,
                          color: Colors.grey.shade100,
                          fontFamily: "Lato",
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor:Colors.grey.shade200,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Search",
                          suffixIcon: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xff19786A),
                            ),
                              child: Icon(Icons.search,)),
                          suffixIconColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text("Course categories",
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w600,
                ),),
              ),
              Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                          color: Colors.tealAccent.shade100,
                          ),
                          height: MediaQuery.of(context).size.height/10,
                          width: MediaQuery.of(context).size.width/4,
                        child: IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.science_outlined,
                          color: Colors.teal,
                          size: 40,),
                        ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text("Science",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: "Lato",
                          fontSize: 18,
                        ),),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            color: Colors.amberAccent.shade100,
                          ),
                          height: MediaQuery.of(context).size.height/10,
                          width: MediaQuery.of(context).size.width/4,
                          child: IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.laptop_windows_outlined,
                              color: Colors.deepOrangeAccent,
                              size: 40,),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text("Technology",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: "Lato",
                            fontSize: 18,
                          ),),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            color: Colors.blue.shade100,
                          ),
                          height: MediaQuery.of(context).size.height/10,
                          width: MediaQuery.of(context).size.width/4,
                          child: IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.add_chart,
                              color: Colors.blueAccent,
                              size: 40,),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text("Algebra",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: "Lato",
                            fontSize: 18,
                          ),),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            color: Colors.orange.shade100,
                          ),
                          height: MediaQuery.of(context).size.height/10,
                          width: MediaQuery.of(context).size.width/4,
                          child: IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.auto_graph_outlined,
                              color: Colors.redAccent,
                              size: 40,),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text("Geomtry",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: "Lato",
                            fontSize: 18,
                          ),),
                      ),
                    ],
                  ),
                ),
              ],
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Popular Concepts",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: "Lato",
                        fontSize: 24,
                      ),),
                    GestureDetector(

                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "View All >",
                          style: TextStyle(
                            fontFamily: "Lato",
                            fontSize: 18,
                            color: Colors.grey.shade400
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: <Widget>[

                ],
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Explore Study Material",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: "Lato",
                        fontSize: 24,
                      ),),
                    GestureDetector(

                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "View All >",
                          style: TextStyle(
                              fontFamily: "Lato",
                              fontSize: 18,
                              color: Colors.grey.shade400
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: <Widget>[

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}




