import 'package:flutter/material.dart';
import 'package:imagine_cup_software/chat/tutorData.dart';
import 'package:imagine_cup_software/dbHelper/mongodb.dart';

import '../classes/language_constants.dart';
import '../dbHelper/chatModel.dart';

class chatList extends StatefulWidget {
  const chatList({Key? key}) : super(key: key);

  @override
  State<chatList> createState() => _chatListState();
}

class _chatListState extends State<chatList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(translation(context).tutorsearch,
          style: TextStyle(
              fontFamily: "Lato",
              fontWeight: FontWeight.w600,
              fontSize: 22
          ),),
        elevation: 0,
        backgroundColor: Color(0xff19786A),
        centerTitle: true,
      ),
      body: SafeArea(
        child: FutureBuilder(
            future: MongoDatabase.getData(2),
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
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0, top: 20),
                          child: Container(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      style: TextStyle(
                                        letterSpacing: 0.5,
                                        color: Colors.black,
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
                                        hintText: translation(context).tutorsearch,
                                        suffixIcon: Padding(
                                          padding: const EdgeInsets.only(right: 8.0),
                                          child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                color: Color(0xff19786A),
                                              ),
                                              child: Icon(Icons.search,
                                              color: Colors.white,)),
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
                          child: Column(
                                children: <Widget>[

                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 25.0),
                                      child: ListView.builder(
                                          itemCount: snapshot.data.length,
                                          itemBuilder: (context, index) {
                                            return displayCard(
                                                chatModel.fromJson(
                                                    snapshot.data[index]));
                                          }),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                      ],
                    ),
                  );
                } else {
                  return Center(
                    child: Text(
                      "Unable to connect to the Internet.\nPlease find a stable network connection.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "Lato",
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  );
                }
              }
            }),
      ),
    );
  }

  Widget displayCard(chatModel data) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: GestureDetector(
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              side: BorderSide(
                  color: Color(0xffFFA800),
                  width: 0.3
              )
          ),
          elevation: 6,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width/5,
                    height: MediaQuery.of(context).size.height/9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      image: DecorationImage(
                        image: NetworkImage("${data.Profile}"),
                      )
                    ),
                  ),
                ),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("${data.name}",
                      style: TextStyle(
                        fontFamily: "Lato",
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                      ),
                      textAlign: TextAlign.left,),
                    ),
                    Row(
                      children: [
                        Text("Rating: ",
                            textAlign: TextAlign.left),
                        Text("${data.rating} ", textAlign: TextAlign.left),
                        Icon(Icons.star,color: Color(0xffFFA800), size: 20,)
                      ],
                    ),
                    Container(
                      child: Text("${data.subject}",textAlign: TextAlign.left),
                    )
                  ],
                ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        color: Color(0xff19876A),
                          onPressed: (){},
                          icon: Icon(Icons.phone)
                      ),
                    ),
                  ),
                ],
              ),

              ],
            ),
          ),
        ),
        onTap: (){
          showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20)
                  )
              ),
              context: context,
              builder: (context)=> tutorDetails(data.name,data.chatModelClass, data.experience, data.rating, data.subject, data.Profile, data.about)
          );
        },
      ),
    );
  }
}
