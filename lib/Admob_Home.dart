import 'package:flutter/material.dart';
import 'package:google_admob/Admob_Self/Ad_Mobile_Page.dart';
import 'package:google_admob/Admock_class/Admock_Page.dart';

class Admob_Home extends StatefulWidget {

  @override
  State<Admob_Home> createState() => _Admob_HomeState();
}

class _Admob_HomeState extends State<Admob_Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admob_Home"),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.arrow_forward_ios),
            title: Text("(1) Ads Mobile Class"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Admock_Page()));
            },
          ),
          Divider(),

          ListTile(
            leading: Icon(Icons.arrow_forward_ios),
            title: Text("(2) Ads Mobile self"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Ad_Mobile_Page()));
            },
          ),
          Divider(),


        ],
      ),
    );
  }
}
