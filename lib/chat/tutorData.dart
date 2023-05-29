import 'package:flutter/material.dart';

class tutorDetails extends StatefulWidget {
  final name;

  final std;

  final experience;

  final rating;

  final subject;

  final profile;

  final about;

  // final qualify;

  const tutorDetails(
    this.name,
    this.std,
    this.experience,
    this.rating,
    this.subject,
    this.profile,
    this.about, {
    Key? key,
  }) : super(key: key);

  @override
  State<tutorDetails> createState() => _tutorDetailsState();
}

class _tutorDetailsState extends State<tutorDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 5,
                    height: MediaQuery.of(context).size.height / 5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        image: DecorationImage(
                            image: NetworkImage("${widget.profile}"))),
                  ),
                ),
                Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,),
                        child: Text(widget.name,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 22,
                          fontFamily: "Lato",
                        ),),
                      ),
                    ),
                    Text(widget.subject,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        fontFamily: "Lato",
                        color: Colors.grey
                      ),),
                  ],
                ),
                // SizedBox(
                //   width: MediaQuery.of(context).size.width/7,
                // ),
                Column(
                  children: [
                    Icon(
                      Icons.star,
                      color: Color(0xffFFA800),
                    ),
                    Text("${widget.rating}/5",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        fontFamily: "Lato",
                      ),),
                  ],
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height / 10,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade400,
                              blurRadius: 1.0,
                              spreadRadius: 1.0,
                              offset: Offset(1.0, 2.0), // shadow direction: bottom right
                            )
                          ],
                          color: Color(0xff19876A),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Years of Exp.\n${widget.experience}",
                          style: TextStyle(color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              fontFamily: "Lato",
                            ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 1.0,
                              spreadRadius: 1.0,
                              offset: Offset(1.0, 2.0), // shadow direction: bottom right
                            )
                          ],
                          color: Color(0xffFFA800),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Teaching to\n${widget.std}",
                          style: TextStyle(color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              fontFamily: "Lato",
                            ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 1.0,
                              spreadRadius: 1.0,
                              offset: Offset(1.0, 2.0), // shadow direction: bottom right
                            )
                          ],
                          color: Color(0xff19876A),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Qualification\n${widget.experience}",
                          style: TextStyle(color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              fontFamily: "Lato",
                            ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text("About",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    fontFamily: "Lato",
                  ),
                textAlign: TextAlign.left,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text("${widget.about}",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  fontFamily: "Lato",
                  color: Colors.grey
                ),),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffFFA800),
                      minimumSize: Size.fromHeight(50)),
                  child: Text("Schedule a Call",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      fontFamily: "Lato",
                    ),)),
            ),
          ],
        ),
      ),
    );
  }
}
