import 'package:flutter/material.dart';
import 'package:imagine_cup_software/dbHelper/conceptModel.dart';
import 'package:imagine_cup_software/dbHelper/readModel.dart';

import '../dbHelper/mongodb.dart';

class popularConcepts extends StatefulWidget {
  const popularConcepts({Key? key}) : super(key: key);

  @override
  State<popularConcepts> createState() => _popularConceptsState();
}

class _popularConceptsState extends State<popularConcepts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
            future: MongoDatabase.getData(0),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (snapshot.hasData) {
                  var totalData = snapshot.data.length;
                  print("Total Data " + totalData.toString());
                  return Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return displayCard(index,
                              conceptModel.fromJson(snapshot.data[index]));
                        }),
                  );
                } else {
                  return Center(
                    child: Text(
                      "Unable to connect to the Internet.\nPlease find a stable network connection.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "Lato",
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  );
                }
              }
            }),
      ),
    );
  }

  Widget displayCard(int index, conceptModel data) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.height / 3.5,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Card(
              elevation: 3.5,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.network(
                  "${data.image}",
                  width: MediaQuery.of(context).size.height / 3,
                  height: MediaQuery.of(context).size.width / 3,
                ),
              ),
            ),
          ),

          Text(
            "${data.title}",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              fontFamily: "Lato",
            ),
            textAlign: TextAlign.center,
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}

class exploreStudy extends StatefulWidget {
  const exploreStudy({Key? key}) : super(key: key);

  @override
  State<exploreStudy> createState() => _exploreStudyState();
}

class _exploreStudyState extends State<exploreStudy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
            future: MongoDatabase.getData(1),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (snapshot.hasData) {
                  var totalData = snapshot.data.length;
                  print("Total Data " + totalData.toString());
                  return Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return displayCard(index,
                              readModel.fromJson(snapshot.data[index]));
                        }),
                  );
                } else {
                  return Center(
                    child: Text(
                      "Unable to connect to the Internet.\nPlease find a stable network connection.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "Lato",
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  );
                }
              }
            }),
      ),
    );
  }

  Widget displayCard(int index, readModel data) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.height / 3.5,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Card(
              elevation: 3.5,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.network(
                  "${data.image}",
                  width: MediaQuery.of(context).size.height / 3,
                  height: MediaQuery.of(context).size.width / 3,
                ),
              ),
            ),
          ),

          Text(
            "${data.title}",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              fontFamily: "Lato",
            ),
            textAlign: TextAlign.center,
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}

