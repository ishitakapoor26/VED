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
            Container(
              color: Color(0xffFFA800),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0,left: 15),
                        child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,

                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Profile",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              fontFamily: "Lato",
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width / 5,
                      height: MediaQuery.of(context).size.height / 7.5,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: NetworkImage(widget.image),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 35),
                    child: Text(
                      widget.name,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          fontFamily: "Lato",
                      color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),

                ],
              ),
            ),

            // Padding(
            //   padding: const EdgeInsets.all(10.0),
            //   child: Divider(
            //     color: Color(0xff19876A).shade300,
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: displayWidget(
                  "Account Settings",
                  Icon(
                    Icons.settings,
                    color: Color(0xff19876A),
                  )),
            ),
            displayWidget(
                "Change Language",
                Icon(
                  Icons.language_outlined,
                  color: Color(0xff19876A),
                )),
            displayWidget(
                "Support",
                Icon(
                  Icons.support_agent,
                  color: Color(0xff19876A),
                )),
            displayWidget(
                "Help",
                Icon(
                  Icons.help_outline,
                  color: Color(0xff19876A),
                )),
            displayWidget(
                "About",
                Icon(
                  Icons.info,
                  color: Color(0xff19876A),
                )),
            displayWidget(
                "Log out",
                Icon(
                  Icons.logout,
                  color: Color(0xff19876A),
                ))
          ],
        ),
      ),
    );
  }

  Widget displayWidget(String str, Icon icon) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: icon,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: Text(
              str,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  fontFamily: "Lato"),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
