import 'package:chat_bot/pages/voice_page.dart';
import 'package:chat_bot/widgets/logo_colored.dart';
import 'package:chat_bot/widgets/messages/image_message_widget.dart';
import 'package:chat_bot/widgets/messages/normal_message_widget.dart';
import 'package:chat_bot/widgets/messages/welcome_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

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
                        height: 300,
                        padding: EdgeInsets.symmetric(horizontal: 22),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              WelcomMessageWidget(),
                              SizedBox(
                                height: 30,
                              ),
                              NormalMessageWidget(
                                  isUser: false,
                                  message: 'Do you want to set a name for me?'),
                              SizedBox(
                                height: 30,
                              ),
                              NormalMessageWidget(isUser: true, message: 'Yes'),
                              SizedBox(
                                height: 30,
                              ),
                              ImageMessageWidget(),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      TextField(
                        style: GoogleFonts.chivo(
                          textStyle: TextStyle(
                            color: Color(0xFF9A9A9A),
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.mic_none,
                              color: Color(0xFF7000FF),
                              size: 26,
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => VoicePage()));
                            },
                          ),
                          hintText: 'Type here or speak',
                          hintStyle: GoogleFonts.chivo(
                            textStyle: TextStyle(
                              color: Color(0xFF9A9A9A),
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(29),
                            borderSide: BorderSide(
                                color:
                                    Color(0xFF8A8A8A)), // Default border color
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(29),
                            borderSide: BorderSide(
                                color: Color(
                                    0xFF8A8A8A)), // Border color when not focused
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(29),
                            borderSide: BorderSide(
                                color: Color(
                                    0xFF8A8A8A)), // Border color when focused
                          ),
                          filled: true,
                          fillColor: Colors
                              .transparent, // Change to desired background color if needed
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 16), // Padding inside the TextField
                        ),
                      )
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
