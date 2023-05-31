import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:imagine_cup_software/Dashboard/dashboard.dart';
import 'package:imagine_cup_software/Dashboard/homepage.dart';

import '../Dashboard/home.dart';

class onboardSecond extends StatefulWidget {
  const onboardSecond({Key? key}) : super(key: key);

  @override
  State<onboardSecond> createState() => _onboardSecondState();
}

class _onboardSecondState extends State<onboardSecond> {
  late GoogleSignIn _googleSignIn;

  @override
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> signInWithGoogle() async {
    //  Create an instance of the firebase auth and google signin
    final GoogleSignIn googleSignIn = GoogleSignIn();
    //  Triger the authentication flow
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    //  Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser!.authentication;
    //  Create new credentials
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth!.accessToken,
      idToken: googleAuth!.idToken,
    );
    if (googleUser != null) {
      print(googleUser.displayName);
      print(googleUser.email);
      print(googleUser.id);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Homepage()));
    }
    //  Sign In the user with the credentials
    final UserCredential userCredential =
        await auth.signInWithCredential(credential);
  }

  Future<String> getCurrentUID() async {
    return (auth.currentUser)!.uid;
  }

  Future getCurrentUser() async {
    return auth.currentUser;
  }

  getProfileImage() {
    String? photo = auth.currentUser?.photoURL;
    if (auth.currentUser!.photoURL != null) {
      print(photo);
      return Image.network(photo!);
    } else {
      return Icon(
        Icons.account_circle,
        size: 100,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Color(0xff19786A),
                image: DecorationImage(
                    opacity: 0.25,
                    image: AssetImage("assets/Group 52.png"),
                    fit: BoxFit.cover)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 60.0),
                  child: Text(
                    "Want To Learn Science and Mathematics in an Interesting Way?",
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: "Lato",
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                ),
                Image.asset(
                  'assets/rafiki.png',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.8,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35.0, vertical: 3),
                  child: ElevatedButton(
                    onPressed: () async{
                      await signInWithGoogle();
                      getProfileImage();
                      if (mounted) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Home()));
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundImage: NetworkImage("https://w7.pngwing.com/pngs/63/1016/png-transparent-google-logo-google-logo-g-suite-chrome-text-logo-chrome.png"),
                          backgroundColor: Colors.transparent,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "Sign-up/ Sign-in with Google",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                fontFamily: "Lato"),
                          ),
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffFFA800),
                      minimumSize: const Size.fromHeight(55),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric( vertical: 35,
                          horizontal: 18.0),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: CircleAvatar(
                          radius: 24,
                          backgroundColor: Color(0xffFFA800),
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width/4.5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 35.0),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CircleAvatar(
                              radius: 4,
                              backgroundColor: Colors.white54,
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: CircleAvatar(
                                radius: 4,
                                backgroundColor: Colors.white54,
                              ),
                            ),
                            CircleAvatar(
                              radius: 4,
                              backgroundColor: Color(0xffFFA800),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
