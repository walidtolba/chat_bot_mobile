
import 'package:chat_bot/pages/chat_page.dart';
import 'package:chat_bot/pages/landing_page.dart';
import 'package:chat_bot/pages/voice_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ThemeData.dark().colorScheme.copyWith(
              primary: Colors.white,
              secondary: Colors.white,
            ),
        useMaterial3: true,
      ),
      home: VoicePage(),
    );
  }
}

