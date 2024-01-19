import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testproject/widgets/my_buttons.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({super.key});

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  bool light = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green.shade100,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FaIcon(
            FontAwesomeIcons.barsStaggered,
            color: Colors.green[900],
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: FaIcon(
                FontAwesomeIcons.circleCheck,
                color: Colors.green[900],
              )),
          IconButton(
              onPressed: () {},
              icon: FaIcon(
                FontAwesomeIcons.bell,
                color: Colors.green[900],
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomPaint(
              painter: MyCustomPainter(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Welcome,",
                        style: GoogleFonts.poppins(fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Mohammed Shibil",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.green[900]),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.grey,
                            ),
                            Text(
                              "set location",
                              style: GoogleFonts.poppins(color: Colors.black),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Off Duty",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.black),
                            ),
                            Switch(
                              value: light,
                              inactiveThumbColor: Colors.grey,
                              inactiveTrackColor: Colors.grey[200],
                              activeColor: Colors.green[900],
                              onChanged: (bool value) {
                                setState(() {
                                  light = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 47,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MyButtons(
                          icon: Icons.insert_chart_rounded, text: "Enquiries"),
                      MyButtons(
                          icon: Icons.card_travel_rounded, text: "Clients"),
                      MyButtons(icon: Icons.add_card_sharp, text: "Orders"),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Services",
                        style: GoogleFonts.poppins(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 29.0,
                              spreadRadius: 1.0,
                              offset: const Offset(
                                5.0,
                                5.0,
                              ),
                            )
                          ]),
                      child: Column(
                        children: [
                          ListTile(
                            leading: Icon(
                              Icons.accessibility_new,
                              color: Colors.green[900],
                            ),
                            title: Text(
                              "New Enquiry",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400),
                            ),
                            trailing: Icon(
                              Icons.keyboard_arrow_right,
                              color: Colors.green[900],
                              size: 30,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 14),
                            child: Divider(
                              thickness: 1,
                            ),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.person_pin_rounded,
                              color: Colors.green[900],
                            ),
                            title: Text(
                              "Add Clients",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400),
                            ),
                            trailing: Icon(
                              Icons.keyboard_arrow_right,
                              color: Colors.green[900],
                              size: 30,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 14),
                            child: Divider(
                              thickness: 1,
                            ),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.call,
                              color: Colors.green[900],
                            ),
                            title: Text(
                              "call Logs",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400),
                            ),
                            trailing: Icon(
                              Icons.keyboard_arrow_right,
                              color: Colors.green[900],
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Complaints",
                        style: GoogleFonts.poppins(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 29.0,
                              spreadRadius: 1.0,
                              offset: const Offset(
                                5.0,
                                5.0,
                              ),
                            )
                          ]),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                              "Add Complaint",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400),
                            ),
                            trailing: Icon(
                              Icons.keyboard_arrow_right,
                              color: Colors.green[900],
                              size: 30,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 14),
                            child: Divider(
                              thickness: 1,
                            ),
                          ),
                          ListTile(
                            title: Text(
                              "View Complaints",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400),
                            ),
                            trailing: Icon(
                              Icons.keyboard_arrow_right,
                              color: Colors.green[900],
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.green.shade100; // Set the color of the shape as needed

    final rect = Rect.fromPoints(
      Offset(0, 0),
      Offset(size.width, size.height),
    );

    final path = Path()
      ..moveTo(rect.left, rect.top)
      ..lineTo(rect.right, rect.top)
      ..lineTo(rect.width, rect.height / 5)
      ..quadraticBezierTo(
        size.width / 2,
        rect.bottom / 3.3,
        rect.left,
        rect.bottom / 5,
      )
      ..lineTo(rect.left, rect.top)
      ..close();

    // Draw the shape on the canvas
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
