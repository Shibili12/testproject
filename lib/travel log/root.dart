import 'package:flutter/material.dart';

class CombinedPainter extends CustomPainter {
  int possition = 0;
  String startTime;
  String endTime;
  CombinedPainter(
      {this.possition = 0, required this.startTime, required this.endTime});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.indigo
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1.0;

    var verticalStartPoint = Offset(size.width * 1 / 6, 0);
    var verticalEndPoint = Offset(size.width * 1 / 6, size.height);
    if (possition == 0) {
      verticalStartPoint = Offset(size.width * 1 / 6, 0);
      verticalEndPoint = Offset(size.width * 1 / 6, size.height);
    } else {
      verticalStartPoint = Offset(size.width * 5 / 6, 0);
      verticalEndPoint = Offset(size.width * 5 / 6, size.height);
    }

    const double dashWidth = 5.0;
    const double dashSpace = 5.0;

    double verticalCurrentY = verticalStartPoint.dy;

    // Define the circle's position and radius
    final circleRadius = 20.0;
    final circleCenter = Offset(verticalStartPoint.dx, size.height / 2);
    final circleTopY = circleCenter.dy - circleRadius;
    final circleBottomY = circleCenter.dy + circleRadius;

    // Define the positions for the start and end time texts
    final startTimeY = 20.0;
    final endTimeY = size.height - 30.0;
    final timeTextHeight = 15.0;

    // Draw the dashed vertical line, skipping the circle area and time text areas
    while (verticalCurrentY < verticalEndPoint.dy) {
      if ((verticalCurrentY + dashWidth < circleTopY ||
              verticalCurrentY > circleBottomY) &&
          (verticalCurrentY + dashWidth < startTimeY ||
              verticalCurrentY > startTimeY + timeTextHeight) &&
          (verticalCurrentY + dashWidth < endTimeY ||
              verticalCurrentY > endTimeY + timeTextHeight)) {
        final startDash = Offset(verticalStartPoint.dx, verticalCurrentY);
        final endDash =
            Offset(verticalStartPoint.dx, verticalCurrentY + dashWidth);
        canvas.drawLine(startDash, endDash, paint);
      }
      verticalCurrentY += dashWidth + dashSpace;
    }

    // Draw circle border at the center of the vertical line
    final circleBorderPaint = Paint()
      ..color = Colors.indigo
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0; // Thickness of the circle border

    canvas.drawCircle(circleCenter, circleRadius, circleBorderPaint);

    // Draw person icon at the center of the circle
    var iconData = Icons.person;
    if (possition == 0) {
      iconData = Icons.person;
    } else {
      iconData = Icons.business_center_outlined;
    }
    final iconPainter = TextPainter(
      text: TextSpan(
        text: String.fromCharCode(iconData.codePoint),
        style: TextStyle(
          color: Colors.indigo,
          fontSize: circleRadius,
          fontFamily: iconData.fontFamily,
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    iconPainter.layout();

    // Calculate the position of the icon inside the circle
    final iconPosition = Offset(
      circleCenter.dx - iconPainter.width / 2,
      circleCenter.dy - iconPainter.height / 2,
    );

    iconPainter.paint(canvas, iconPosition);

    // Draw start time text
    final startTimePainter = TextPainter(
      text: TextSpan(
        text: startTime,
        style: TextStyle(
          color: Colors.indigo,
          fontSize: 14.0,
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    startTimePainter.layout();
    final startTimePosition = Offset(verticalStartPoint.dx - 15, startTimeY);
    startTimePainter.paint(canvas, startTimePosition);

    // Draw end time text
    final endTimePainter = TextPainter(
      text: TextSpan(
        text: endTime,
        style: TextStyle(
          color: Colors.indigo,
          fontSize: 14.0,
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    endTimePainter.layout();
    final endTimePosition = Offset(verticalStartPoint.dx - 15, endTimeY);
    endTimePainter.paint(canvas, endTimePosition);
    if (possition == 0) {
      tersst(verticalEndPoint, size, dashWidth, canvas, dashSpace, paint);
    } else {
      tersst1(verticalEndPoint, size, dashWidth, canvas, dashSpace, paint);
    }

    // Horizontal Line Painter at the end of Vertical Line
    // final horizontalStartPoint = Offset(verticalEndPoint.dx, size.height);
    // final horizontalEndPoint = Offset(size.width * 5 / 6, size.height);
    //
    // double horizontalCurrentX = horizontalStartPoint.dx;
    //
    // while (horizontalCurrentX < horizontalEndPoint.dx) {
    //   final startDash = Offset(horizontalCurrentX, horizontalStartPoint.dy);
    //   final endDash =
    //   Offset(horizontalCurrentX + dashWidth, horizontalStartPoint.dy);
    //   canvas.drawLine(startDash, endDash, paint);
    //   horizontalCurrentX += dashWidth + dashSpace;
    // }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  tersst(Offset verticalEndPoint, Size size, double dashWidth, Canvas canvas,
      double dashSpace, Paint paint) {
    final horizontalStartPoint = Offset(verticalEndPoint.dx, size.height);
    final horizontalEndPoint = Offset(size.width * 5 / 6, size.height);

    double horizontalCurrentX = horizontalStartPoint.dx;

    while (horizontalCurrentX < horizontalEndPoint.dx) {
      final startDash = Offset(horizontalCurrentX, horizontalStartPoint.dy);
      final endDash =
          Offset(horizontalCurrentX + dashWidth, horizontalStartPoint.dy);
      canvas.drawLine(startDash, endDash, paint);
      horizontalCurrentX += dashWidth + dashSpace;
    }
  }

  tersst1(Offset verticalEndPoint, Size size, double dashWidth, Canvas canvas,
      double dashSpace, Paint paint) {
    final horizontalStartPoint = Offset(verticalEndPoint.dx, size.height);
    final horizontalEndPoint = Offset(size.width * 1 / 6, size.height);

    double horizontalCurrentX = horizontalStartPoint.dx;

    while (horizontalCurrentX > horizontalEndPoint.dx) {
      final startDash = Offset(horizontalCurrentX, horizontalStartPoint.dy);
      final endDash =
          Offset(horizontalCurrentX - dashWidth, horizontalStartPoint.dy);

      canvas.drawLine(startDash, endDash, paint);

      horizontalCurrentX -= dashWidth + dashSpace;
    }
  }
}

// class CombinedPainter2 extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     // Vertical Line Painter (reverse position)
//     final paint = Paint()
//       ..color = Colors.indigo
//       ..strokeCap = StrokeCap.round
//       ..strokeWidth = 1.0;
//
//     // Reverse vertical line to start from the opposite side
//     final verticalStartPoint = Offset(size.width * 5 / 6, 0);
//     final verticalEndPoint = Offset(size.width * 5 / 6, size.height);
//
//     const double dashWidth = 5.0;
//     const double dashSpace = 5.0;
//
//     double verticalCurrentY = verticalStartPoint.dy;
//
//     // Define the circle's position and radius
//     final circleRadius = 20.0;
//     final circleCenter = Offset(verticalStartPoint.dx, size.height / 2);
//     final circleTopY = circleCenter.dy - circleRadius;
//     final circleBottomY = circleCenter.dy + circleRadius;
//
//     // Define the positions for the start and end time texts
//     final startTimeY = 20.0;
//     final endTimeY = size.height - 30.0;
//     final timeTextHeight = 15.0; //  height for the time text area
//
//     // Draw the dashed vertical line, skipping the circle area and time text areas
//     while (verticalCurrentY < verticalEndPoint.dy) {
//       if ((verticalCurrentY + dashWidth < circleTopY ||
//           verticalCurrentY > circleBottomY) &&
//           (verticalCurrentY + dashWidth < startTimeY ||
//               verticalCurrentY > startTimeY + timeTextHeight) &&
//           (verticalCurrentY + dashWidth < endTimeY ||
//               verticalCurrentY > endTimeY + timeTextHeight)) {
//         final startDash = Offset(verticalStartPoint.dx, verticalCurrentY);
//         final endDash =
//         Offset(verticalStartPoint.dx, verticalCurrentY + dashWidth);
//         canvas.drawLine(startDash, endDash, paint);
//       }
//       verticalCurrentY += dashWidth + dashSpace;
//     }
//
//     // Draw circle border at the center of the vertical line
//     final circleBorderPaint = Paint()
//       ..color = Colors.indigo
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 2.0;
//
//     canvas.drawCircle(circleCenter, circleRadius, circleBorderPaint);
//
//     // Draw person icon at the center of the circle
//     final iconData = Icons.business_center_outlined;
//     final iconPainter = TextPainter(
//       text: TextSpan(
//         text: String.fromCharCode(iconData.codePoint),
//         style: TextStyle(
//           color: Colors.indigo,
//           fontSize: circleRadius,
//           fontFamily: iconData.fontFamily,
//         ),
//       ),
//       textDirection: TextDirection.ltr,
//     );
//
//
//     iconPainter.layout();
//
//     // Calculate the position of the icon inside the circle
//     final iconPosition = Offset(
//       circleCenter.dx - iconPainter.width / 2,
//       circleCenter.dy - iconPainter.height / 2,
//     );
//
//     iconPainter.paint(canvas, iconPosition);
//
//     // Draw start time text
//     final startTimePainter = TextPainter(
//       text: TextSpan(
//         text: "12:00",
//         style: TextStyle(
//           color: Colors.indigo,
//           fontSize: 14.0,
//         ),
//       ),
//       textDirection: TextDirection.ltr,
//     );
//
//     startTimePainter.layout();
//     final startTimePosition = Offset(
//         verticalStartPoint.dx - 15, startTimeY);
//     startTimePainter.paint(canvas, startTimePosition);
//
//     // Draw end time text
//     final endTimePainter = TextPainter(
//       text: TextSpan(
//         text: "12:30",
//         style: TextStyle(
//           color: Colors.indigo,
//           fontSize: 14.0,
//         ),
//       ),
//       textDirection: TextDirection.ltr,
//     );
//
//     endTimePainter.layout();
//     final endTimePosition = Offset(
//         verticalStartPoint.dx - 15, endTimeY);
//     endTimePainter.paint(canvas, endTimePosition);
//     // Horizontal Line Painter at the end of the vertical line (reverse direction)
//     final horizontalStartPoint = Offset(verticalEndPoint.dx, size.height);
//     final horizontalEndPoint = Offset(size.width * 1 / 6, size.height);
//
//     double horizontalCurrentX = horizontalStartPoint.dx;
//
//     while (horizontalCurrentX > horizontalEndPoint.dx) {
//       final startDash = Offset(horizontalCurrentX, horizontalStartPoint.dy);
//       final endDash =
//       Offset(horizontalCurrentX - dashWidth, horizontalStartPoint.dy);
//
//       canvas.drawLine(startDash, endDash, paint);
//
//       horizontalCurrentX -= dashWidth + dashSpace;
//     }
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }