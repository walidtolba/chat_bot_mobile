import 'package:chat_bot/widgets/logo_colored.dart';
import 'package:chat_bot/widgets/messages/image_message_widget.dart';
import 'package:chat_bot/widgets/messages/normal_message_widget.dart';
import 'package:chat_bot/widgets/messages/welcome_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VoicePage extends StatelessWidget {
  const VoicePage({super.key});

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
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 13, vertical: 25),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 22),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 50,
                              ),
                              SizedBox(
                                width: double.infinity,
                              ),
                              Image.asset('assets/images/listener.png'),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                'You can speak Now. I am listening !',
                                style: GoogleFonts.chivo(
                                  textStyle: TextStyle(
                                    color: Color(0xFF242424),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                height: 73,
                                width: 73,
                                decoration: BoxDecoration(
                                    color: Color(0xFF7000FF),
                                    borderRadius: BorderRadius.circular(50)),
                                    child: Icon(Icons.mic_none, color: Colors.white, size: 40,),
                              )
                            ],
                          )),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Transform.translate(
                      offset: Offset(0, -66),
                      child: Hero(tag: 'logo', child: LogoColored(size: 73))),
                ),
              ],
            )
          ],
        )
      ],
    ));
  }
}
