import 'package:chat_bot/widgets/logo_colored.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'dart:async';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:http/http.dart' as http;

enum TtsState { playing, stopped, paused, continued }

class VoicePage extends StatefulWidget {
  const VoicePage({super.key});

  @override
  State<VoicePage> createState() => _VoicePageState();
}

class _VoicePageState extends State<VoicePage>
    with SingleTickerProviderStateMixin {
  //////////////////////////////////
  late AnimationController _listeningController;
  String _state = 'Say something';

  SpeechToText _speechToText = SpeechToText();

  bool _speechEnabled = false;

  String? _lastWords;

  late FlutterTts flutterTts;

  String? _newVoiceText;

  TtsState ttsState = TtsState.stopped;

  get isPlaying => ttsState == TtsState.playing;

  get isStopped => ttsState == TtsState.stopped;

  get isPaused => ttsState == TtsState.paused;

  get isContinued => ttsState == TtsState.continued;

  bool get isAndroid => !kIsWeb && Platform.isAndroid;

  _initTts() {
    flutterTts = FlutterTts();

    _setAwaitOptions();

    if (isAndroid) {
      _getDefaultEngine();
      _getDefaultVoice();
    }

    flutterTts.setStartHandler(() {
      setState(() {
        ttsState = TtsState.playing;
      });
    });

    flutterTts.setCompletionHandler(() {
      setState(() {
        ttsState = TtsState.stopped;
      });
    });

    flutterTts.setPauseHandler(() {
      setState(() {
        ttsState = TtsState.paused;
      });
    });

    flutterTts.setContinueHandler(() {
      setState(() {
        ttsState = TtsState.continued;
      });
    });

    flutterTts.setErrorHandler((msg) {
      setState(() {
        ttsState = TtsState.stopped;
      });
    });
  }

  Future _getDefaultEngine() async {
    var engine = await flutterTts.getDefaultEngine;
    if (engine != null) {
      print(engine);
    }
  }

  Future _getDefaultVoice() async {
    var voice = await flutterTts.getDefaultVoice;
  }

  Future _speak() async {
    await flutterTts.setVolume(0.5);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setPitch(1.0);

    if (_newVoiceText != null) {
      if (_newVoiceText!.isNotEmpty) {
        await flutterTts.speak(_newVoiceText!);
      }
    }
    setState(() {
      _state = 'Say something';
    });
  }

  Future _setAwaitOptions() async {
    await flutterTts.awaitSpeakCompletion(true);
  }

  Future _stop() async {
    var result = await flutterTts.stop();
    if (result == 1) setState(() => ttsState = TtsState.stopped);
  }

  Future _pause() async {
    var result = await flutterTts.pause();
    if (result == 1) setState(() => ttsState = TtsState.paused);
  }

  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize(
      onStatus: (status) {
        if (status == 'done') _onRecordingStop();
      },
    );
  }

  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult, localeId: 'en-US');
    setState(() {
      _state = 'I\'m listening';
    });
    setState(() {});
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;
    });
  }

  Future<void> _onRecordingStop() async {
    setState(() {
      _state = 'I\'m thinking';
    });
    _listeningController.reverse();
    _newVoiceText = await generateMessage();
    setState(() {
      _lastWords = _newVoiceText;
      _state = 'I\'m talking';
    });
    _speak();
  }

  Future<String> generateMessage() async {
    final url =
        Uri.parse('https://voice-chat-app-pro.vercel.app/api/generateMessage');

    final headers = {
      'Content-Type': 'application/json',
    };

    final body = jsonEncode({
      "userInput": _lastWords,
      "conversation": [],
      "count": "1",
      "token": "8f9b3f1a-4b7c-ed29-bbb5-1b6f9m4a7u8j"
    });
    final response = await http.post(url, headers: headers, body: body);
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      return responseData['message'].trim() as String;
    } else {
      throw Exception('Failed to load message');
    }
  }

  @override
  void initState() {
    _initSpeech();
    _initTts();
    _listeningController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _listeningController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

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
                              GestureDetector(
                                child: Container(
                                  height: 73,
                                  width: 73,
                                  decoration: BoxDecoration(
                                      color: Color(0xFF7000FF),
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Icon(
                                    Icons.mic_none,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                ),
                                onTap: () {
                                  _listeningController.forward();
                                  _startListening();
                                },
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
