import 'package:imagine_cup_software/concepts/concepts.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:intro_slider/dot_animation_enum.dart';

import 'package:imagine_cup_software/dashboard.dart';

class IntroSliderPage extends StatefulWidget {
  const IntroSliderPage({Key? key}) : super(key: key);

  @override
  State<IntroSliderPage> createState() => _IntroSliderPageState();
}



class _IntroSliderPageState extends State<IntroSliderPage> {

  List<Slide> slides = [];

  @override
  void initState() {
    slides.add(new Slide(
      title: "Are You Ready to Learn Geometry in an Interesting Way?",
      styleTitle: TextStyle(
        color: Colors.indigo,
        fontFamily: 'Poppins',
        fontSize: 40.0,
        fontWeight: FontWeight.w700,
      ),
      // description: "E-Drishti helps you ",
      // styleDescription: TextStyle(
      //   fontFamily: 'Poppins',
      //   fontSize: 18.0,
      //   color: Colors.blue,
      // ),
      pathImage: "assets/s1-removebg-preview 1.png",
    ),);
    slides.add(new Slide(
      title: "About App",
      styleTitle: TextStyle(
        color: Colors.indigo,
        fontFamily: 'Poppins',
        fontSize: 40.0,
        fontWeight: FontWeight.w700,
      ),
      description: "E-Drsihti helps visually\nimpaired people to\nlearn Maths,\nGeometry and Science.",
      styleDescription: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 18.0,
        color: Colors.blue,
      ),
      pathImage: "assets/eb66f3743096a23657a6501e6602240f.jpg",
    ),);
    slides.add(new Slide(
      title: "How It Works",
      styleTitle: TextStyle(
        color: Colors.indigo,
        fontFamily: 'Poppins',
        fontSize: 40.0,
        fontWeight: FontWeight.w700,
      ),
      description: "For Better Understanding\nof Concepts, audio\nexplanation of concepts\nis available on the\napplication.",
      styleDescription: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 18.0,
        color: Colors.blue,
      ),
      pathImage: "assets/braille_2.PNG",
    ),);
    slides.add(new Slide(
      maxLineTextDescription: 4,
      title: "Practice Maths and Geometry Easily",
      styleTitle: TextStyle(
        color: Colors.indigo,
        fontFamily: 'Poppins',
        fontSize: 40.0,
        fontWeight: FontWeight.w700,
      ),
      description: "Follow along the audio\nof the explanation and\ndraw the geometry on\nthe board and learn\nto create shapes and\ndifferent geometrical figures.",
      styleDescription: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 18.0,
        color: Colors.blue,
      ),
      pathImage: "assets/braille_board1.PNG",
    ),
    );
  }

  void onDonePress() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Dashboard()));
  }

  void onSkipPress() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Dashboard()));
  }

  List<Widget> renderListCustomTabs() {
    List<Widget> tabs = [];
    for (int i = 0; i < slides.length; i++) {
      Slide currentSlide = slides[i];
      tabs.add(Container(width: double.infinity,
        height: double.infinity,
        child: Container(
          margin: EdgeInsets.only(bottom: 100, top: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                ),
                child: CircleAvatar(
                  radius: 130.0,
                  backgroundImage: AssetImage(currentSlide.pathImage ?? " "),
                  backgroundColor: Colors.transparent,
                ),

              ),
              Container(
                padding: EdgeInsets.only(top: 5,bottom: 10, left: 10, right: 10),
                child: Text(currentSlide.title ?? " ",
                  style: TextStyle(
                    color: Color(0xff1F6CC9),
                    fontFamily: 'Poppins',
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                child: Text(currentSlide.description ?? " ",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20.0,
                    color: Colors.black54,
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
                margin: EdgeInsets.only(top: 15, left: 5, right: 5),
              )
            ],
          ),
        ),));
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IntroSlider(
        backgroundColorAllSlides: Colors.white,
        renderSkipBtn: Text("Skip",
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Colors.blue,
              fontWeight: FontWeight.w500,
              fontSize: 15.0,
            )),
        renderNextBtn: Text("Next",
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Colors.white,
            )),
        renderDoneBtn:

        Text("Done",
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Colors.white,
            )),
        colorDoneBtn: Colors.blue,
        colorActiveDot: Colors.blue,
        sizeDot: 8.0,
        typeDotAnimation: dotSliderAnimation.SIZE_TRANSITION,
        listCustomTabs: this.renderListCustomTabs(),
        onDonePress: this.onDonePress,
        onSkipPress: this.onSkipPress,
        scrollPhysics: BouncingScrollPhysics(),
        hideStatusBar: false,
      ),
    );
  }
}
