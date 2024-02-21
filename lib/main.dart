import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/HomeScreen.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // ignore: prefer_const_constructors
      home:HomeScreen(),
    );
  }
}
