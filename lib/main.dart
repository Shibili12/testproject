import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:testproject/animation_example/animatedposition_example.dart';
import 'package:testproject/animation_example/hero_animation_hompage.dart';
import 'package:testproject/animation_example/staggered_animation_example.dart';
import 'package:testproject/animation_example/using_package_example.dart';
import 'package:testproject/payment%20App/HomePage.dart';
import 'package:testproject/payment%20App/theme%20components/Palette.dart';
import 'package:testproject/stripe_payment_integration/apikeys.dart';
import 'package:testproject/stripe_payment_integration/payment_homescreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
      "pk_test_51Op6GsSCjzujotMZt18DWUnXysZVNLnhp6EkQbPjVISxAkbDb7AwQOELiCSbbPXwmSKfGVrOK9B2KvCj6GkACF0c00xj39y7ct";
  await Stripe.instance.applySettings();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: false,
          appBarTheme: const AppBarTheme(
              elevation: 1,
              backgroundColor: Palette.ToDoRed,
              iconTheme: IconThemeData(color: Colors.white))),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
