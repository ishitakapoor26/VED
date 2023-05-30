import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:mongo_dart/mongo_dart.dart';

class BluetoothDeviceListEntry extends StatelessWidget {
  const BluetoothDeviceListEntry({Key? key,required this.onTap,required this.device  }) : super(key: key);
  final VoidCallback onTap;
  final BluetoothDevice? device;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(Icons.devices, color: Color(0xff19876A),),
      title: Text(device!.name ?? "Unknown Device"),
      subtitle: Text(device!.address.toString()),
      trailing: InkWell(
        onTap: onTap,
        child: Container(
          height: MediaQuery.of(context).size.height/20,
          width: MediaQuery.of(context).size.width/4.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: Color(0xffFFA800),
          ),
          child: Align(
              alignment: Alignment.center,
              child:Text('Connect',style: TextStyle(color: Colors.white,
              fontFamily: "Lato",
                fontSize: 14,
                fontWeight: FontWeight.w600
              ),)
          ),
        ),
      ),

    );
  }
}