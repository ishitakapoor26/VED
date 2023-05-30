
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:imagine_cup_software/Dashboard/homepage.dart';
import 'package:imagine_cup_software/hardware_connection/send_message.dart';
import 'package:imagine_cup_software/onboardingScreens/onboardSecond.dart';

import '../Dashboard/dashboard.dart';
import 'connection.dart';

void main(){
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: FlutterBluetoothSerial.instance.requestEnable(),
        builder: (BuildContext context, future) {
          if (future.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: Container(
                height: double.infinity,
                child: Center(
                  child: Icon(
                    Icons.bluetooth_disabled,
                    size: 200,
                    color: Colors.black,
                  ),
                ),
              ),
            );
          } else {
            return Home();
          }
        },
    ),);
  }
}

//////////////////////////////////////////////////////////////////////////////////////////
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff19876A),
            leading: GestureDetector(
                child: Icon(Icons.arrow_back),
                onTap: (){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>onboardSecond()));
                },
            ),
            title: Text("Connection"),
            centerTitle: true,
          ),
          body: SelectBondedDevicePage(
            onCahtPage: (device1) {
              BluetoothDevice device = device1;
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ChatPage(
                  server: device,
                );
              }));
            },
          ),
        ));
  }
}