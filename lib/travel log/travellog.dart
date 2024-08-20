import 'package:flutter/material.dart';
import 'package:testproject/travel%20log/root.dart';

class TravelLog extends StatelessWidget {
  TravelLog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.indigo[400],
          leading: const Icon(Icons.arrow_back),
          title: const Text("ABC signature"),
          bottom: PreferredSize(
              preferredSize: Size(double.infinity, 45),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width / 2 * .86,
                            height: 40,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: .5, color: Colors.white),
                                borderRadius: BorderRadius.circular(4)),
                            child: const Row(
                              children: [
                                Expanded(
                                    child: Center(
                                        child: Text(
                                  "Vishnu",
                                  style: TextStyle(color: Colors.white),
                                ))),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            )),
                        Container(
                          width: MediaQuery.of(context).size.width / 2 * .86,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(width: .5, color: Colors.white),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                              Expanded(
                                  child: Center(
                                      child: Text(
                                "20 AUG",
                                style: TextStyle(color: Colors.white),
                              ))),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        )
                      ]),
                ),
              ))),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomPaint(
                size: Size(double.infinity, 160),
                painter: CombinedPainter(),
                child:
                    _Buildlogdetails('Check In', 'VHMV+F6C', "Redmi 6", "99%")),
            CustomPaint(
                size: Size(double.infinity, 160),
                painter: CombinedPainter2(),
                child: _Buildlogdetails(
                    'Arravinthan Electricals', 'RPMV+633', "Redmi 6", "92%")),
            CustomPaint(
              size: Size(double.infinity, 160),
              painter: CombinedPainter(),
              child: _Buildlogdetails(
                  'Mothakkada Electricals', 'VPX8+P8X', "Redmi 6", "89%"),
            ),
            CustomPaint(
              size: Size(double.infinity, 160),
              painter: CombinedPainter2(),
              child: _Buildlogdetails(
                  'Aryan Electricals', 'YFKU+F6C', "Redmi 6", "75%"),
            ),
            CustomPaint(
              size: Size(double.infinity, 160),
              painter: CombinedPainter(),
              child: _Buildlogdetails(
                  'Sabeel traders', 'DGJ+F6C', "Redmi 6", "65%"),
            ),
            CustomPaint(
              size: Size(double.infinity, 160),
              painter: CombinedPainter2(),
              child:
                  _Buildlogdetails('Abc steels', 'CFHJ+F6HC', "Redmi 6", "50%"),
            ),
          ],
        ),
      ),
    );
  }

  _Buildlogdetails(String log, String logid, String phone, String battery) {
    return Container(
      width: double.infinity,
      height: 160,
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              log,
              style: TextStyle(
                  color: Colors.indigo[400],
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6),
            Text(
              logid,
              style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6),
            Container(
              height: 25,
              width: 100,
              decoration: BoxDecoration(
                  border: Border.all(width: .2),
                  borderRadius: BorderRadius.circular(4)),
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          phone,
                          style: TextStyle(fontSize: 10),
                        ),
                      )),
                  Flexible(
                      child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Divider(),
                      Icon(
                        Icons.battery_charging_full,
                        color: Colors.green,
                        size: 10,
                      ),
                      Text(
                        battery,
                        style: TextStyle(fontSize: 10),
                      )
                    ],
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
