import 'package:flutter/material.dart';

import 'package:testproject/drawingscreen.dart';
import 'package:testproject/homepage.dart';
import 'package:testproject/homepage3.dart';
import 'package:testproject/homepage4.dart';
import 'package:testproject/secondhomepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
