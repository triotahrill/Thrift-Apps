
import 'package:Thrift/Pages/Home_Screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thrift E-Commerce',
      theme: ThemeData(
        fontFamily: 'Montserrat',
      ),
  home: HomePage(),
    );
  }
}