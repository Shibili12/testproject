import 'package:flutter/material.dart';

class Drawingrect extends StatefulWidget {
  const Drawingrect({super.key});

  @override
  State<Drawingrect> createState() => _DrawingrectState();
}

class _DrawingrectState extends State<Drawingrect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drwaing Rectangle"),
      ),
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          child: CustomPaint(
            painter: RectanglePainter(),
          ),
        ),
      ),
    );
  }
}

class RectanglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromPoints(
      Offset(50.0, 50.0),
      Offset(250.0, 250.0),
    );

    Paint paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
