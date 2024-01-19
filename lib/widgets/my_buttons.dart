import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButtons extends StatelessWidget {
  IconData icon;
  String text;

  MyButtons({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.green[900],
          size: 40,
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          text,
          style: GoogleFonts.poppins(),
        ),
      ],
    );
  }
}
