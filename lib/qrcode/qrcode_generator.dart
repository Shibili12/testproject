import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'package:qr_flutter/qr_flutter.dart';

class Qrcodegenerator extends StatefulWidget {
  const Qrcodegenerator({super.key});

  @override
  State<Qrcodegenerator> createState() => _QrcodegeneratorState();
}

class _QrcodegeneratorState extends State<Qrcodegenerator> {
  TextEditingController urlcontroller = TextEditingController();
  TextEditingController urlcontroller2 = TextEditingController();
  TextEditingController urlcontroller3 = TextEditingController();
  TextEditingController urlcontroller4 = TextEditingController();

  final List<String> _qrData = [];
  bool ispressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("QR code generator"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ispressed
                ? QrImageView(
                    data: _qrData.toString(),
                    size: 100,
                  )
                : SizedBox(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: urlcontroller,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: urlcontroller2,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  if (urlcontroller.text.isNotEmpty &&
                      urlcontroller2.text.isNotEmpty) {
                    _qrData.clear();
                    _qrData.addAll([urlcontroller.text, urlcontroller2.text]);
                    setState(() {
                      ispressed = true;
                    });
                  }
                },
                child: Text("generate Qrcode")),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: urlcontroller3,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: urlcontroller4,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  scanQR();
                },
                child: Text("Scan QR")),
          ],
        ),
      ),
    );
  }

  Future<void> scanQR() async {
    String barcodeScanRes;

    barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', 'Cancel', true, ScanMode.QR);
    final qrdata =
        barcodeScanRes.substring(1, barcodeScanRes.length - 1).split(', ');
    print(barcodeScanRes.toString());
    if (qrdata.length == 2) {
      urlcontroller3.text = qrdata[0];
      urlcontroller4.text = qrdata[1];
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid QR code')),
      );
    }
    print(barcodeScanRes);
  }
}
