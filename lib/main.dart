import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moosa/view/splashscreen.dart';




void main() => runApp(MyApp());

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      
      );
  }
}

