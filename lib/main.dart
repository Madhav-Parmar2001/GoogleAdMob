import 'package:flutter/material.dart';
import 'package:google_admob/Admob_Home.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ad Mobile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Admob_Home());
  }
}


