import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  TextEditingController controller = TextEditingController();
  late Razorpay _razorpay;
  @override
  void initState() {
    // TODO: implement initState

    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerpaymentsuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerpaymenterror);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerexternalwallet);
    super.initState();
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.green.shade100,
                  prefixIcon: Icon(
                    Icons.attach_money_outlined,
                    color: Colors.green[900],
                  ),
                  hintText: "Enter Amount to pay",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  )),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 10, right: 10),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (controller.text.isNotEmpty) {
                    var options = {
                      "key": "rzp_test_iwvzCQtd0NEdhl",
                      "amount": num.parse(controller.text) * 100,
                      "name": "my test Projects",
                      "description": "payment for our work",
                      "prefill": {
                        "contact": "8848555711",
                        "email": "shibiliazwin23@gmail.com"
                      },
                      "external": {
                        "wallets": ["paytm"]
                      },
                    };
                    try {
                      _razorpay.open(options);
                    } catch (e) {
                      print(e.toString());
                    }
                  }
                },
                child: Text("PAY"),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[900],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25))),
              ),
            ),
          ),
        ],
      ),
    );
  }

  handlerpaymentsuccess() {
    print("handlerpaymentsuccess");
  }

  handlerpaymenterror() {
    print("handlerpaymenterror");
  }

  handlerexternalwallet() {
    print("handlerexternalwallet");
  }
}
