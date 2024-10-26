import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NormalMessageWidget extends StatelessWidget {
  final String message;
  final bool isUser;
  NormalMessageWidget({required this.isUser, required this.message, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(message,
          style: GoogleFonts.chivo(
            fontSize: 16,
            color: isUser? Color(0xFF7000FF):Color(0xFF242424),
            fontWeight: FontWeight.w300,
          )),
    );
  }
}
