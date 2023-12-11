import 'package:flutter/material.dart';

class Drawingline extends StatefulWidget {
  const Drawingline({super.key});

  @override
  State<Drawingline> createState() => _DrawinglineState();
}

class _DrawinglineState extends State<Drawingline> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("drawing line"),
      ),
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          child: CustomPaint(
            painter: LinePainter(), // CustomPainter class for drawing line
          ),
        ),
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    final startPoint = Offset(size.width * 1 / 6, size.height * 1 / 2);
    final endPoint = Offset(size.width * 5 / 6, size.height * 1 / 2);

    canvas.drawLine(startPoint, endPoint, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
