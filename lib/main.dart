import 'package:flutter/material.dart';
import 'package:testproject/animation_example/animatedposition_example.dart';
import 'package:testproject/animation_example/hero_animation_hompage.dart';
import 'package:testproject/animation_example/staggered_animation_example.dart';
import 'package:testproject/animation_example/using_package_example.dart';

import 'package:testproject/loginscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: false),
      debugShowCheckedModeBanner: false,
      home: Opencontainerexample(),
    );
  }
}
