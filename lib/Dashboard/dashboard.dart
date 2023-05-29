import '../Widget.dart';
import 'package:imagine_cup_software/Dashboard/place_staggered_gridview.dart';
import 'package:flutter/material.dart';

import 'package:imagine_cup_software/Dashboard/dashboardUI.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color(0xff19786A),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              // height: MediaQuery.of(context).size.height,
              // width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,),
                    child: Text("Choose.\nFilter.\nLearn.\nPractice.\nApply.",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Lato",
                      color: Colors.white,
                      letterSpacing: 0.6
                    ),),
                  ),
                  Image.asset("assets/cute.png",
                  width: MediaQuery.of(context).size.width/1.7,
                  height: MediaQuery.of(context).size.height/3.25,
                  fit: BoxFit.cover,)
                ],
              ),
            ),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(40)),
                    color: Colors.white),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 30.0, right: 30.0, top: 40, bottom: 10),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Categories",
                            style: TextStyle(
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PlaceStaggeredGridView(),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
