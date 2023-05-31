import 'package:imagine_cup_software/concepts/concepts_widget.dart';
// import 'package:imagine_cup_software/image_process_tactile.dart';
// import 'package:imagine_cup_software/understandingScienceObject.dart';
import 'package:flutter/material.dart';
import 'package:imagine_cup_software/dbHelper/conceptModel.dart';
import 'package:imagine_cup_software/dbHelper/mongodb.dart';

import '../Dashboard/dashboard.dart';

class Concepts extends StatefulWidget {
  const Concepts({Key? key}) : super(key: key);

  @override
  State<Concepts> createState() => _ConceptsState();
}

class _ConceptsState extends State<Concepts> {
  Widget displayCard(int index, conceptModel data) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            side: BorderSide(
              color: Color(0xffFFA800),
              width: 0.8
            )
          ),
          elevation: 5,
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  height: MediaQuery.of(context).size.height / 8,
                  width: MediaQuery.of(context).size.width/0.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Image.network("${data.image}",
                          width: MediaQuery.of(context).size.width/3.8,
                          height: MediaQuery.of(context).size.height/3.8,),
                        ),
                      ),
                      
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text("${data.title}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Lato",
                          ),
                          maxLines: 4,),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
      onTap: () => {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Concept_Widget(title: data.title, description: data.description, image: data.image))),
      },
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Courses To Study",
        style: TextStyle(
          fontFamily: "Lato",
          fontWeight: FontWeight.w600,
          fontSize: 22
        ),),
        elevation: 0,
        backgroundColor: Color(0xff19786A),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
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
                return Container(
                  color: Color(0xff19786A),
                  child: Column(
                    children: <Widget>[
                      Container(
                        color: Color(0xff1786A),
                        height: MediaQuery.of(context).size.height / 6,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  style: TextStyle(
                                    letterSpacing: 0.5,
                                    color: Colors.black,
                                    fontFamily: "Lato",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor:Colors.grey.shade200,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide.none,
                                    ),
                                    hintText: "Search Course Modules",
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.only(right: 8.0),
                                      child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            color: Color(0xffFFA800),
                                          ),
                                          child: Icon(Icons.search,)),
                                    ),
                                    suffixIconColor: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 25.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15)),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 35.0, left: 20),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text("Concept Modules",style:
                                      TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Lato",
                                      ),
                                    textAlign: TextAlign.left,),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 25.0),
                                    child: ListView.builder(
                                        itemCount: snapshot.data.length,
                                        itemBuilder: (context, index) {
                                          return displayCard(
                                              index,
                                              conceptModel.fromJson(
                                                  snapshot.data[index]));
                                        }),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Center(
                  child: Text("Unable to connect to the Internet.\nPlease find a stable network connection.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Lato",
                    fontSize: 16,
                    fontWeight: FontWeight.w400
                  ),),
                );
              }
            }
          },
        ),
      ),
    );
  }
}
