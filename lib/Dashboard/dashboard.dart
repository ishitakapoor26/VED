import '../Widget.dart';
import 'package:imagine_cup_software/place_staggered_gridview.dart';
import 'package:flutter/material.dart';

import 'package:imagine_cup_software/Dashboard/dashboardUI.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final double statusbarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
        key: _scaffoldKey,
        drawer: new Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMt6xMMLCNElmhMP07tuJ14Av7SmuI6XYv9g&usqp=CAU"),
                      radius: 45.0,
                    ),
                  )),
              listDrawer(
                data1: 'Ishita Kapoor',
                data2: Icons.supervisor_account,
              ),
              Divider(
                height: 1.0,
                thickness: 1.0,
                color: Color(0xffE9E9E9),
                indent: 10.0,
                endIndent: 10.0,
              ),
              listDrawer(
                data1: 'Grade: 10',
                data2: Icons.class_outlined,
              ),
              Divider(
                height: 1.0,
                thickness: 1.0,
                color: Color(0xffE9E9E9),
                indent: 10.0,
                endIndent: 10.0,
              ),
              listDrawer(
                  data1: 'ishitakapoor12612@gmail.com',
                  data2: Icons.email_outlined),
              Divider(
                height: 1.0,
                thickness: 1.0,
                color: Color(0xffE9E9E9),
                indent: 10.0,
                endIndent: 10.0,
              ),
              listDrawer(
                data1: 'FAQ',
                data2: Icons.question_answer_sharp,
              ),
              Divider(
                height: 1.0,
                thickness: 1.0,
                color: Color(0xffE9E9E9),
                indent: 10.0,
                endIndent: 10.0,
              ),
              listDrawer(
                data1: 'Contact Us',
                data2: Icons.contact_support,
              ),
              Divider(
                height: 1.0,
                thickness: 1.0,
                color: Color(0xffE9E9E9),
                indent: 10.0,
                endIndent: 10.0,
              ),
              listDrawer(
                data1: 'Settings',
                data2: Icons.settings,
              ),
              Divider(
                height: 1.0,
                thickness: 1.0,
                color: Color(0xffE9E9E9),
                indent: 10.0,
                endIndent: 10.0,
              ),
              listDrawer(
                data1: 'Rate Us',
                data2: Icons.star_rate,
              ),
              Divider(
                height: 1.0,
                thickness: 1.0,
                color: Color(0xffE9E9E9),
                indent: 10.0,
                endIndent: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    '*T&C Apply',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        appBar: new AppBar(
          title: Text('Hello there!'),
          leading: new IconButton(
            icon: new Icon(Icons.account_circle_outlined),
            onPressed: () => _scaffoldKey.currentState!.openDrawer(),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Color(0xffF3F8FD),
                  elevation: 4.0,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      '"Life is a constant journey of trying to open your eyes. I’m just begining my journey, and my eyes aren’t fully open yet."',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 14.0,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ),
              // dashboardUI(),
              PlaceStaggeredGridView(),

              // navbar(),
            ],
          ),
        ),
      
    );
  }
}

class listDrawer extends StatelessWidget {
  const listDrawer({Key? key, this.data1, required this.data2})
      : super(key: key);

  final data1;
  final IconData data2;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ListTile(
        leading: Icon(
          data2,
          color: Colors.blue,
        ),
        title: Text(
          '${data1}',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
