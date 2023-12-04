import 'package:flutter/material.dart';

class Drawingcircle extends StatefulWidget {
  const Drawingcircle({super.key});

  @override
  State<Drawingcircle> createState() => _DrawingcircleState();
}

class _DrawingcircleState extends State<Drawingcircle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drwaing Circle"),
      ),
      body: Center(
        child: CustomPaint(
          painter: CirclePainter(),
        ),
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    double centerX = size.width / 2;
    double centerY = size.height / 2;
    double radius = 100.0;

    canvas.drawCircle(Offset(centerX, centerY), radius, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
