import 'package:chat_bot/pages/login_email_page.dart';
import 'package:chat_bot/widgets/logo_colored.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.contain)),
        ),
        Container(
          padding: EdgeInsets.only(top: 68, bottom: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Image.asset('assets/images/small_white_logo.png'),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'FinTrack',
                    style: GoogleFonts.comfortaa(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w600)),
                  )
                ],
              ),
              SizedBox(
                height: 60,
              ),
              Column(
                children: [
                  Text(
                    'Unleash the power of FinTrack',
                    style: GoogleFonts.chivo(
                        textStyle:
                            TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Keep an eye on your money',
                    style: GoogleFonts.chivo(
                        textStyle: TextStyle(
                            color: Color(0xFFC3C3C3),
                            fontSize: 13,
                            fontWeight: FontWeight.w300)),
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Column(
                children: [
                  Text(
                    'Tap to start FinTrack',
                    style: GoogleFonts.chivo(
                        textStyle: TextStyle(
                            color: Color(0xFFC3C3C3),
                            fontSize: 14,
                            fontWeight: FontWeight.w300)),
                  ),
                  GestureDetector(
                    child: Hero( 
                      tag: 'logo',
                        child: LogoColored(
                      size: 89,
                    )),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginEmailPage()));
                    },
                  )
                ],
              ),
              Text(
                '©2024 FinTrack. All rights reserved.',
                style: GoogleFonts.chivo(
                    textStyle: TextStyle(
                        color: Color(0xFF646464),
                        fontSize: 10,
                        fontWeight: FontWeight.w300)),
              )
            ],
          ),
        )
      ],
    ));
  }
}
