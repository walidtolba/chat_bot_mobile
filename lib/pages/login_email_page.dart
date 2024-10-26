import 'package:chat_bot/globals.dart';
import 'package:chat_bot/pages/login_password_page.dart';
import 'package:chat_bot/widgets/logo_colored.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginEmailPage extends StatefulWidget {
  LoginEmailPage({super.key});

  @override
  State<LoginEmailPage> createState() => _LoginEmailPageState();
}

class _LoginEmailPageState extends State<LoginEmailPage> {
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/background.png'),
                      fit: BoxFit.contain)),
            ),
            Opacity(
              opacity: 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(),
                  TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: 0.0, end: 1.0),
                    duration: Duration(seconds: 1),
                    builder: (context, scale, child) {
                      return Transform.scale(
                        scale: scale * 4,
                        child: Container(
                          width: 131,
                          height: 131,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Color(0xFF9643FF),
                                  Color(0xFFB384FF),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter),
                            borderRadius: BorderRadius.circular(70),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 105),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Transform.translate(
                    offset: Offset(0, -62),
                    child: Hero(tag: 'logo', child: LogoColored(size: 89))),
                Text(
                  'Add your email',
                  style: GoogleFonts.chivo(
                      textStyle: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 16,
                          fontWeight: FontWeight.w600)),
                ),
                SizedBox(height: 57),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: 64,
                  width: 289,
                  decoration: BoxDecoration(
                    color: Color(0x0DFFFFFF),
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Color(0x4DFFFFFF)),
                  ),
                  child: TextField(
                    controller: _emailController,
                    style: GoogleFonts.chivo(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
                      hintStyle: GoogleFonts.chivo(
                        textStyle: TextStyle(
                          color: Color(0x7FFFFFFF),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 33),
                GestureDetector(
                  child: Container(
                    alignment: Alignment.center,
                    height: 60,
                    width: 229,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Color(0xFF2E2E2E),
                            Color(0xFF000000),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Color(0x4DFFFFFF)),
                    ),
                    child: Text(
                      'Send Email',
                      style: GoogleFonts.chivo(
                          textStyle: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 14,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                  onTap: () {
                    if (_emailController.text.isNotEmpty) {
                      lastEmail = _emailController.text.trim();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginPasswordPage()));
                    }
                  },
                ),
                SizedBox(
                  height: 55,
                  width: double.infinity,
                )
              ],
            ),
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(top: 30, left: 30),
                child: Icon(Icons.arrow_back, color: Colors.white, size: 30),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ));
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}