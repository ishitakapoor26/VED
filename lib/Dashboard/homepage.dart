import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:imagine_cup_software/Dashboard/homepageSlider.dart';

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

  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<String> getCurrentUID() async {
    return (auth.currentUser)!.uid;
  }

  Future getCurrentUser() async {
    return auth.currentUser;
  }

  getProfileImage() {
    String? photo = auth.currentUser?.photoURL;
    if (auth.currentUser!.photoURL != null) {
      print(photo);
      return Image.network(photo!,
      height: MediaQuery.of(context).size.height/8,
        width: MediaQuery.of(context).size.width/8,

      );
    } else {
      return Icon(
        Icons.account_circle,
        size: 100,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: ListView(
          children: <Widget>[

          ],
        ),
      ),
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
                    child: Text("Hello, ${auth.currentUser?.displayName}!",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black54,
                      fontFamily: "Lato",
                      fontWeight: FontWeight.w600,
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: GestureDetector(
                      child: ClipOval(
                        child: SizedBox.fromSize(
                          size: Size.fromRadius(20),
                          child: getProfileImage(),
                        ),
                      ),
                    )
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
                          fontSize: 14,
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
                  fontSize: 20,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w600,
                ),),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0, right: 1.0, bottom: 10, top: 4),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                          color: Colors.tealAccent.shade100,
                          ),
                          height: MediaQuery.of(context).size.height/10,
                          width: MediaQuery.of(context).size.width/3.8,
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
                          fontSize: 14,
                        ),),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 4,right: 1.0, bottom: 10, top: 4),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            color: Colors.amberAccent.shade100,
                          ),
                          height: MediaQuery.of(context).size.height/10,
                          width: MediaQuery.of(context).size.width/3.8,
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
                            fontSize: 14,
                          ),),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 4,right: 4.0,bottom: 10, top: 4),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            color: Colors.blue.shade100,
                          ),
                          height: MediaQuery.of(context).size.height/10,
                          width: MediaQuery.of(context).size.width/3.8,
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
                            fontSize: 14,
                          ),),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0, right: 12, top: 4),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            color: Colors.orange.shade100,
                          ),
                          height: MediaQuery.of(context).size.height/10,
                          width: MediaQuery.of(context).size.width/3.8,
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
                            fontSize: 14,
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
                        fontSize: 20,
                      ),),
                    GestureDetector(

                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "View All >",
                          style: TextStyle(
                            fontFamily: "Lato",
                            fontSize: 14,
                            color: Colors.grey.shade400
                          ),
                        ),
                      ),
                      onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>Concepts())),
                    )
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height/3.5,
                child: popularConcepts(),
              ),
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Explore Study Material",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: "Lato",
                        fontSize: 20,
                      ),),
                    GestureDetector(

                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "View All >",
                          style: TextStyle(
                              fontFamily: "Lato",
                              fontSize: 14,
                              color: Colors.grey.shade400
                          ),
                        ),
                      ),
                      onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>PdfSelect())) ,
                    )
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height/3.5,
                child: exploreStudy(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




