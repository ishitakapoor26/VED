import 'package:imagine_cup_software/read/pdfView.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imagine_cup_software/Dashboard/dashboard.dart';

class PdfSelect extends StatefulWidget {
  const PdfSelect({Key? key}) : super(key: key);

  @override
  State<PdfSelect> createState() => _PdfSelectState();
}

class _PdfSelectState extends State<PdfSelect> {
  List<String> chapters = [
    "Chapter 1",
    "Chapter 2",
    "Chapter 3",
    "Chapter 4",
    "Chapter 5",
    "Chapter 6",
  ];
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          centerTitle: true,
          title: Text("Study Material"),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
          child: Container(
            child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 40,
                padding: EdgeInsets.all(10.0),
                children: [
                  for (int i = 0; i < chapters.length; i++)
                    Tile(
                      chap: chapters[i],
                      pdfPath: pdfList[i],
                      chapName: chapterName[i],
                      imgUrl: imgUrl[i],
                    )
                ]),
          ),
        ),
      ),
    );
  }
}

class Tile extends StatelessWidget {
  String chap;
  String pdfPath;
  String chapName;
  String imgUrl;
  Tile(
      {required this.chap,
      required this.pdfPath,
      required this.chapName,
      required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
        // bottom: 2,
        // left: 2,
        // right: 2,
        // top: 2,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
      Positioned(
        bottom: 70,
        left: 5,
        right: 5,
        top: 5,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext) => PdfView(
                      pdfPath: pdfPath,
                      title: chap,
                    )));
          },
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imgUrl),
                ),
                color: Colors.white,
                borderRadius: BorderRadius.circular(5)),
          ),
        ),
      ),
      Positioned(
          bottom: 5,
          left: 25,
          child: Column(
            children: [
              Text(
                chap,
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              Text(
                chapName,
                style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ],
          )),
      // Positioned(
      //   bottom: 10,
      //   left: 30,
      //   child: Center(
      //     child: Text(
      //       chapName,
      //       style: GoogleFonts.poppins(
      //           fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white),
      //     ),
      //   ),
      // ),
    ]);
  }
}

void main() {
  runApp(PdfSelect(),
  );
}
