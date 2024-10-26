import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomMessageWidget extends StatelessWidget {
  const WelcomMessageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 55,
          ),
          Text('Welcome to FinTrack',
              style: GoogleFonts.montserrat(
                fontSize: 20,
                color: Color(0xFF0F0F0F),
              )),
          SizedBox(
            height: 7,
          ),
          Text('Let’s meet each other',
              style: GoogleFonts.chivo(
                fontSize: 16,
                color: Color(0xFF242424),
                fontWeight: FontWeight.w300
              )),SizedBox(height: 10,)
        ],
      ),
    );
  }
}