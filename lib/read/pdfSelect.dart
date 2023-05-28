import 'package:imagine_cup_software/read/pdfView.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imagine_cup_software/Dashboard/dashboard.dart';

import '../dbHelper/mongodb.dart';
import '../dbHelper/readModel.dart';

class PdfSelect extends StatefulWidget {
  const PdfSelect({Key? key}) : super(key: key);

  @override
  State<PdfSelect> createState() => _PdfSelectState();
}

class _PdfSelectState extends State<PdfSelect> {
  List<String> chapterName = [
    "Shapes and Space",
    "Numbers One to\nNine",
    "Addition",
    "Subtraction",
    "Numbers Ten to\nTwenty",
    "Time"
  ];
  List<String> pdfList = [
    "assets/pdf/chapter 1.pdf",
    "assets/pdf/chapter 2.pdf",
    "assets/pdf/chapter 3.pdf",
    "assets/pdf/chapter 4.pdf",
    "assets/pdf/chapter 5.pdf",
    "assets/pdf/chapter 6.pdf",
  ];

  List<String> imgUrl = [
    "https://img.favpng.com/8/6/15/shape-three-dimensional-space-geometry-clip-art-png-favpng-fqS4Pm4REyySkDJtf4qdgTzxd.jpg",
    "https://previews.123rf.com/images/katerynadi/katerynadi1701/katerynadi170100001/69807704-number-letter-colored-concept-number-one-to-nine-letter-idea-numerals-typography-design-element-for-.jpg",
    "https://clipart.world/wp-content/uploads/2020/08/old-math-teacher-png-transparent.png",
    "https://thumbs.dreamstime.com/z/girl-math-problem-subtraction-illustration-88110836.jpg",
    "https://i.pinimg.com/originals/c8/66/c9/c866c9d58a60e1209cc22a904fbacd7c.png",
    "https://w7.pngwing.com/pngs/359/349/png-transparent-analog-clock-illustration-time-management-work-learning-mathematics-part-time-problem-solving-study-skills.png"
  ];

  Widget displayCard(int index, readModel data) {
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
                            width: MediaQuery.of(context).size.width/3,
                            height: MediaQuery.of(context).size.height/3),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Study Material",
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
                                    hintText: "Search Study Material",
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
                                  topLeft: Radius.circular(18)),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 35.0, left: 20),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text("Study Materials",style:
                                    TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Lato",
                                    ),
                                      textAlign: TextAlign.left),
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
                                              readModel.fromJson(
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

  onTap(int index) {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>PdfView(pdfPath: pdfList[index], title: chapterName[index])));
  }
}

