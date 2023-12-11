import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CustomPaint Homepage'),
      ),
      body: CustomPaint(
        painter: BackgroundPainter(),
      ),
    );
  }
}

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.white;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);

    drawRoundedRectangleWithTextAndGestureDetector(
      canvas,
      Rect.fromLTWH(20, 20, 160, 160),
      "Rectangle 1",
      () {},
    );

    drawRoundedRectangleWithTextAndGestureDetector(
      canvas,
      Rect.fromLTWH(210, 20, 170, 160),
      "Rectangle 2",
      () {},
    );

    drawRoundedRectangleWithTextAndGestureDetector(
      canvas,
      Rect.fromLTWH(20, 220, 160, 180),
      "Rectangle 3",
      () {},
    );

    drawRoundedRectangleWithTextAndGestureDetector(
      canvas,
      Rect.fromLTWH(210, 220, 170, 180),
      "Rectangle 4",
      () {},
    );
  }

  void drawRoundedRectangleWithTextAndGestureDetector(
    Canvas canvas,
    Rect rect,
    String text,
    VoidCallback onTap,
  ) {
    Paint redBorderPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;
    RRect redContainerRect = RRect.fromRectAndCorners(
      rect,
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
      bottomLeft: Radius.circular(20),
      bottomRight: Radius.circular(20),
    );
    canvas.drawRRect(redContainerRect, redBorderPaint);

    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(color: Colors.black, fontSize: 16),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(minWidth: 0, maxWidth: rect.width);

    double textX = rect.left + (rect.width - textPainter.width) / 2;
    double textY = rect.top + (rect.height - textPainter.height) / 2;

    textPainter.paint(canvas, Offset(textX, textY));

    // Wrap the GestureDetector in a Positioned widget to position it within the CustomPaint
    Positioned(
      left: rect.left,
      top: rect.top,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: rect.width,
          height: rect.height,
          color: Colors.transparent,
        ),
      ),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
