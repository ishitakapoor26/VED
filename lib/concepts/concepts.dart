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
      onTap: () => onTap(index),
    );
  }

  void onTap(int index) {
    if (index == 0) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Concept_Widget(
              title: 'What is a Square?',
              content:
                  'A flat geometric figure that has four equal sides and four right angles.\n\nRelate it to something formed with four equal or roughly equal sides and four right angles the squares of a checkerboard.',
              image:
                  'https://www.creatopy.com/blog/wp-content/uploads/2020/07/Geometric-shapes-in-design-1024x525.png')));
    } else if (index == 1) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Concept_Widget(
              title: 'What is a Sine Graph?',
              content:
                  'The sin graph is a visual representation of the sine function for a given range of angles.\nThe horizontal axis of a trigonometric graph represents the angle, usually written as θ, and the y-axis is the sine function of that angle.\nThe graph does not start at the origin but it does pass through it.',
              image:
                  'https://www.varsitytutors.com/assets/vt-hotmath-legacy/hotmath_help/topics/graphing-sine-function/sine-graph.gif')));
    } else if (index == 2) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Concept_Widget(
              title: 'What is a Modulus Function Graph?',
              content:
                  'A modulus function gives the magnitude of a number irrespective of its sign.\nIt is also called the absolute value function.\nIn mathematics, the modulus of a real number x is given by the modulus function, denoted by |x|.\nIt gives the non-negative value of x.',
              image:
                  'https://qph.cf2.quoracdn.net/main-qimg-e5315cf2f84aa1cc9fe9598c448f7cfa')));
    } else if (index == 3) {
      // Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ScienceObject()));
    } else if (index == 4) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Concept_Widget(
              title: 'Understanding Perimeter',
              content:
                  'Perimeter is the distance around the outside of a shape.',
              image:
                  'https://i.pinimg.com/736x/d4/48/0a/d4480a5d14f48f3fd65775a0f3c3cb39.jpg')));
    }
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
                                    color: Colors.grey.shade100,
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
