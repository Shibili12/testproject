import 'package:flutter/material.dart';

class DrawingCanvas extends StatefulWidget {
  const DrawingCanvas({Key? key}) : super(key: key);

  @override
  State<DrawingCanvas> createState() => _DrawingCanvasState();
}

class _DrawingCanvasState extends State<DrawingCanvas> {
  List<Offset> offsetsForDrawing = <Offset>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawing Canvas'),
      ),
      body:
          // Drawing
          GestureDetector(
        onPanUpdate: (DragUpdateDetails details) {
          setState(() {
            offsetsForDrawing.add(details.globalPosition);
          });
        },
        onPanEnd: (DragEndDetails details) => setState(() {}),
        child: CustomPaint(
          painter: Draw(offsets: offsetsForDrawing),
          size: Size.infinite,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.clear),
        label: const Text('Clear'),
        onPressed: () {
          setState(() {
            offsetsForDrawing.clear();
          });
        },
      ),
    );
  }
}

class Draw extends CustomPainter {
  final List<Offset> offsets;
  Draw({
    required this.offsets,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = Colors.red;
    paint.strokeWidth = 5;
    for (int i = 0; i < offsets.length - 1; i++) {
      canvas.drawLine(offsets[i], offsets[i + 1], paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
