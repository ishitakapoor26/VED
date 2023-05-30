import 'package:flutter/material.dart';

class profilePage extends StatefulWidget {
  final image;

  final name;

  const profilePage(this.image, this.name, {Key? key}) : super(key: key);

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.only(left: 32),
      child: Scaffold(
        body: ListView(
          children: [
            Text("Profile",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                fontFamily: "Lato"
              ),
            textAlign: TextAlign.center,),
            ClipOval(
              child: SizedBox.fromSize(
                size: Size.fromRadius(22),
                child: Image.network(widget.image,height: MediaQuery.of(context).size.height/5,
                    width: MediaQuery.of(context).size.width/5,),
              ),
            ),
            Text(widget.name,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  fontFamily: "Lato"
              ),
              textAlign: TextAlign.center,
            ),
            Text("Account Setting",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  fontFamily: "Lato"
              ),
              textAlign: TextAlign.center,),
            Text("Change Language",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  fontFamily: "Lato"
              ),
              textAlign: TextAlign.center,),
            Text("Support",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  fontFamily: "Lato"
              ),
              textAlign: TextAlign.center,),
            Text("Help",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  fontFamily: "Lato"
              ),
              textAlign: TextAlign.center,),
            Text("About",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  fontFamily: "Lato"
              ),
              textAlign: TextAlign.center,),
            Text("Log out",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  fontFamily: "Lato"
              ),
              textAlign: TextAlign.center,),
          ],
        ),
      ),
    );
  }
}
