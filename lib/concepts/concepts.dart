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
        padding: const EdgeInsets.all(15.0),
        child: Card(
          elevation: 3.5,
          color: Color(0xffFFA800),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  height: MediaQuery.of(context).size.height/4,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  image: DecorationImage(
                    image: NetworkImage("${data.image}"),
                    fit: BoxFit.cover,
                  ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Text(
                  "${data.title}",
                  style: TextStyle(
                    fontFamily: "Lato",
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: ()=> onTap(index),
    );
  }

  void onTap(int index){
    if(index==0){
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Concept_Widget(title: 'What is a Square?', content: 'A flat geometric figure that has four equal sides and four right angles.\n\nRelate it to something formed with four equal or roughly equal sides and four right angles the squares of a checkerboard.', image: 'https://www.creatopy.com/blog/wp-content/uploads/2020/07/Geometric-shapes-in-design-1024x525.png')));
    }
    else if(index==1){
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Concept_Widget(title: 'What is a Sine Graph?', content: 'The sin graph is a visual representation of the sine function for a given range of angles.\nThe horizontal axis of a trigonometric graph represents the angle, usually written as θ, and the y-axis is the sine function of that angle.\nThe graph does not start at the origin but it does pass through it.', image: 'https://www.varsitytutors.com/assets/vt-hotmath-legacy/hotmath_help/topics/graphing-sine-function/sine-graph.gif')));
    }
    else if(index==2){
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Concept_Widget(title: 'What is a Modulus Function Graph?', content: 'A modulus function gives the magnitude of a number irrespective of its sign.\nIt is also called the absolute value function.\nIn mathematics, the modulus of a real number x is given by the modulus function, denoted by |x|.\nIt gives the non-negative value of x.', image: 'https://qph.cf2.quoracdn.net/main-qimg-e5315cf2f84aa1cc9fe9598c448f7cfa')));
    }
    else if(index==3){
      // Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ScienceObject()));
    }
    else if(index==4){
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Concept_Widget(title: 'Understanding Perimeter', content: 'Perimeter is the distance around the outside of a shape.', image: 'https://i.pinimg.com/736x/d4/48/0a/d4480a5d14f48f3fd65775a0f3c3cb39.jpg')));
    }

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("eDrishti",
        style: TextStyle(
          fontFamily: "Lato",
          fontWeight: FontWeight.w600
        ),),
        backgroundColor: Color(0xff19876A),
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
          future: MongoDatabase.getData(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (snapshot.hasData) {
                var totalData = snapshot.data.length;
                print("Total Data " + totalData.toString());
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return displayCard(index,
                          conceptModel.fromJson(snapshot.data[index]));
                    });
              } else {
                return Center(
                  child: Text("No Data Available"),
                );
              }
            }
          },
        ),
      ),
    );
  }
}
