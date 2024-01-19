import 'dart:math';

import 'package:flutter/material.dart';
import 'package:testproject/homescreen.dart';

class CustomShapePainter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomPaint(
              painter: MyCustomPainter(),
              child: ClipPath(
                clipper: MyCustomClipper(),
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 300.0,
                      child: Image.network(
                        'https://images.unsplash.com/photo-1535882832-ac75c142f79f?q=80&w=1536&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                        left: 20,
                        top: 50,
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Icon(Icons.arrow_back_ios)),
                        ))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Welcome Back",
              style: TextStyle(
                color: Colors.green[900],
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text("Login to Your Account",
                style: TextStyle(
                  color: Colors.grey,
                )),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.green.shade100,
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.green[900],
                    ),
                    hintText: "Username",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.green.shade100,
                    prefixIcon: Icon(
                      Icons.visibility,
                      color: Colors.green[900],
                    ),
                    hintText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.check_box_rounded,
                        color: Colors.green[900],
                      ),
                      Text(
                        "Remember Me",
                        style: TextStyle(
                          color: Colors.green[900],
                        ),
                      )
                    ],
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot Password ?",
                        style: TextStyle(
                          color: Colors.green[900],
                        ),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 10, right: 10),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomeScreen2()));
                  },
                  child: Text("Login"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[900],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25))),
                ),
              ),
            ),
            TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Do you have an account ?",
                      style: TextStyle(
                        color: Colors.grey[900],
                      ),
                    ),
                    Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.green[900],
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(
          0, size.height * 0.7) // Move to a point above the bottom-left corner

      // Quadratic bezier curve to create a smaller wave-like shape
      ..quadraticBezierTo(
        size.width * 0.2,
        size.height * 0.8,
        size.width * 0.35,
        size.height * 0.8,
      )
      // ..quadraticBezierTo(
      //   size.width / 2,
      //   size.height * 0.65,
      //   size.width * 3 / 4,
      //   size.height * 0.7,
      // )
      ..quadraticBezierTo(
        size.width * 0.35,
        size.height * 0.8,
        size.width,
        size.height * 0.6,
      )

      // Line to the bottom-right corner
      ..lineTo(size.width, 0)

      // Line to the top-right corner
      ..lineTo(0, 0)

      // Close the path
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white; // Set the color of the shape as needed

    final rect = Rect.fromPoints(
      Offset(0, size.height * 0.5),
      Offset(size.width, size.height),
    );

    // Modify the radius values to control the oval shape
    final radiusX = size.width * 0.5;
    final radiusY = size.height * 0.5;

    final path = Path()
      ..moveTo(rect.center.dx, rect.top)
      ..arcTo(rect, -pi / 2, pi, false)
      ..close();

    // Draw the shape on the canvas
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
