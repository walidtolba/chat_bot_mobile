import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ImageMessageWidget extends StatelessWidget {
  ImageMessageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        
      ),  
      child: ClipRRect(borderRadius: BorderRadius.circular(20), child: Image.asset('assets/images/cat.jpg')),
    );
  }
}
