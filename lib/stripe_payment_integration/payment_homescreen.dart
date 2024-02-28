import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:testproject/stripe_payment_integration/apikeys.dart';

class PaymentHomescreen extends StatefulWidget {
  const PaymentHomescreen({super.key});

  @override
  State<PaymentHomescreen> createState() => _PaymentHomescreenState();
}

class _PaymentHomescreenState extends State<PaymentHomescreen> {
  Map<String, dynamic>? paymentIntent;
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stripe Payment"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Amount",
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  payment();
                },
                child: const Text("Buy Now")),
          ],
        ),
      ),
    );
  }

  Future<void> payment() async {
    // step 1:- payment Intent
    try {
      Map<String, dynamic> body = {
        "amount": "${controller.text}00", //100 rs
        "currency": "INR",
      };
      var response = await http.post(
        Uri.parse("https://api.stripe.com/v1/payment_intents"),
        headers: {
          'Authorization':
              'Bearer sk_test_51Oofb7SBEVvAiQNNRXSbtZQBWn15xjLaHj1mj9gw5I5oQfXAK5uLaMFovO3vf4KS1XDmgvNGRWj9HX7sLeB4KjqD007Tv3xPjR',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: body,
      );
      paymentIntent = json.decode(response.body);
      print(paymentIntent.toString());
    } catch (e) {
      print(e.toString());
    }

    // step 2:- Initializing payment sheet
    await Stripe.instance
        .initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: paymentIntent!['client_secret'],
            style: ThemeMode.light,
            merchantDisplayName: 'Shibili',
          ),
        )
        .then((value) => {});

    // Step 3:- Display Payment Sheet

    try {
      await Stripe.instance.presentPaymentSheet().then((value) {
        print("Payment Successfull");
      });
    } catch (e) {
      print("ERROR" + e.toString());
    }
  }
}
