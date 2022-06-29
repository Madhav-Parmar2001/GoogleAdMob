import 'package:flutter/material.dart';
import 'package:google_admob/Admob_Self/Bottom_Banner_Ad_Page.dart';
import 'package:google_admob/Admob_Self/Interstitial_Ad_Page.dart';
import 'package:google_admob/Admob_Self/Interstitial__Video_Ad_Page.dart';
import 'package:google_admob/Admob_Self/Rewarded_Ad_Page.dart';
import 'package:google_admob/Admob_Self/Top_Banner__Ad_Page.dart';


class Ad_Mobile_Page extends StatefulWidget {
  @override
  State<Ad_Mobile_Page> createState() => _Ad_Mobile_PageState();
}

class _Ad_Mobile_PageState extends State<Ad_Mobile_Page> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ad Mobile"),
      ),
      body: Column(
        children: [
          Center(
            child: RaisedButton(
              child: Text(" Top Banner Ad"),
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Top_Banner_Page()));
              },
            ),
          ),

          Center(
            child: RaisedButton(
              child: Text(" Bottom Banner Ad"),
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Bottom_Banner_Page()));
              },
            ),
          ),

          Center(
            child: RaisedButton(
              child: Text(" Interstitial Ad"),
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Interstitial_Ad_Page()));
              },
            ),
          ),

          Center(
            child: RaisedButton(
              child: Text(" Interstitial Video Ad"),
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Interstitial_Video_Ad_Page()));
              },
            ),
          ),

          Center(
            child: RaisedButton(
              child: Text(" Rewarded Ad"),
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Rewarded_Ad_Page()));
              },
            ),
          ),

        ],
      ),
    );
  }
}
