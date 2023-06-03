import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:imagine_cup_software/chat/successPage.dart';
import 'package:imagine_cup_software/splash.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:table_calendar/table_calendar.dart';

class bookingPage extends StatefulWidget {

  final email;
  final name;

  const bookingPage({this.name, this.email, Key? key}) : super(key: key);

  @override
  State<bookingPage> createState() => _bookingPageState();
}

class _bookingPageState extends State<bookingPage> {

  FirebaseAuth auth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['https://mail.google.com/']);
  late String time;
  late DateTime date;
  CalendarFormat _format = CalendarFormat.month;
  DateTime _focusDay = DateTime.now();
  DateTime _currentDay = DateTime.now();
  int? currentIndex;
  bool _isWeekend = false;
  bool _dateSelected = false;
  bool _timeSelected = false;
  Color bgColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    // Config().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Book Appointment",
          style: TextStyle(
              fontFamily: "Lato", fontWeight: FontWeight.w600, fontSize: 20),
        ),
        elevation: 0,
        backgroundColor: Color(0xffFFA800),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[
                _tableCalendar(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 25),
                  child: Center(
                    child: Text(
                      "Select Time",
                      style: TextStyle(
                        fontFamily: "Lato",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          _isWeekend
              ? SliverToBoxAdapter(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Weekend is not available. please select another date",
                      style: TextStyle(
                        fontFamily: "Lato",
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                )
              : SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return InkWell(
                        splashColor: Colors.transparent,
                        onTap: () {
                          setState(() {
                            currentIndex = index;
                            _timeSelected = true;
                            time= "${index + 9}:00 ${index + 9 > 11 ? "PM" : "AM"}";
                            bgColor = _timeSelected && _dateSelected?Color(0xffFFA800):Colors.grey;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: currentIndex == index
                                    ? Color(0xffFFA800)
                                    : Colors.black),
                            borderRadius: BorderRadius.circular(15),
                            color: currentIndex == index
                                ? Color(0xffFFA800)
                                : null,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "${index + 9}:00 ${index + 9 > 11 ? "PM" : "AM"}",
                            style: TextStyle(
                              fontFamily: "Lato",
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color:
                                  currentIndex == index ? Colors.white : null,
                            ),
                          ),
                        ),
                      );
                    },
                    childCount: 8,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, childAspectRatio: 1.5)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: bgColor),
                  child: Text(
                    "Book a Call",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        fontFamily: "Lato"),
                  ),
                  onPressed: () {
                    if(_timeSelected && _dateSelected){
                      sendEmailToStudent(widget.name, widget.email, time,date!);
                    }
                    _timeSelected && _dateSelected
                        ? Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Success()))
                        : null;
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tableCalendar() {
    return TableCalendar(
      focusedDay: _focusDay,
      firstDay: DateTime.now(),
      lastDay: DateTime(2023, 12, 31),
      calendarFormat: _format,
      currentDay: _currentDay,
      rowHeight: 48,
      calendarStyle: CalendarStyle(
        todayDecoration: BoxDecoration(
          color: Color(0xffFFA800),
          shape: BoxShape.circle,
        ),
      ),
      availableCalendarFormats: {
        CalendarFormat.month: 'Month',
      },
      onFormatChanged: (format) {
        setState(() {
          _format = format;
        });
      },
      onDaySelected: ((selectedDay, focusedDay) {
        setState(() {
          _currentDay = selectedDay;
          date= selectedDay;
          _focusDay = focusedDay;
          _dateSelected = true;
          bgColor = _timeSelected && _dateSelected?Color(0xffFFA800):Colors.grey;
          if (selectedDay.weekday == 6 || selectedDay.weekday == 7) {
            _isWeekend = true;
            _timeSelected = false;
            currentIndex = null;
          } else {
            _isWeekend = false;
          }
        });
      }),
    );
  }

  Future sendEmailToStudent(String name, String email, String time, DateTime date) async{

    _googleSignIn.signOut();
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication? googleAuth =
    await googleUser!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth!.accessToken,
      idToken: googleAuth!.idToken,
    );
    final user= _googleSignIn.currentUser;
    if(user==null) return;
    // final _auth = await user.authentication;
    final token =credential.accessToken;
    final smtpServer = gmailSaslXoauth2('ishitakapoor12612@gmail.com', token!);
    final message= Message()
      ..recipients = ['${email}']
      ..from = Address('ishitakapoor12612@gmail.com', 'Ishita from eDrishti')
      ..subject = "Doubt Session Booking Details"
      ..text = "Thank you for booking a doubt seesion with one of our tutors!\nHere are the details for the session:\nTutor Name: ${name}\nMode: Call\nContact Number from which you will be receiving call: +91XXXXXXX022\nTime: ${time}\nDate: ${date}\nAll the best!";
    try{
      await send(message, smtpServer);
      print('Message sent');
      showSnackBar('Sent email successfully!');
    } on MailerException catch(e){
      print('Message not sent');
    print(e);
  }
  }

  void showSnackBar(String s) {
    final snackBar = SnackBar(content:
    Text(
      s, style:
      TextStyle(
        fontSize: 20,
        fontFamily: "Lato",
      ),
    ),
    backgroundColor: Color(0xff19786A),
    );
    ScaffoldMessenger.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(snackBar);
  }
}




