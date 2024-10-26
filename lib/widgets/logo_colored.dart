import 'dart:math';
import 'package:flutter/material.dart';

class LogoColored extends StatefulWidget {
  final double size;
  const LogoColored({required this.size});

  @override
  _LogoColoredState createState() => _LogoColoredState();
}

class _LogoColoredState extends State<LogoColored> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(); // Infinite rotation
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final angle = _controller.value * 2 * pi; // Full rotation

        // Calculate rotating alignments for both gradients
        final gradientBegin = Alignment(cos(angle), sin(angle));
        final gradientEnd = Alignment(-cos(angle), -sin(angle));

        return Container(
          margin: EdgeInsets.all(30),
          alignment: Alignment.center,
          width: widget.size,
          height: widget.size,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF7000FF),
                Color(0xFFFF00B8),
              ],
              begin: gradientBegin,
              end: gradientEnd,
            ),
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: Color(0x663C00E8),
                spreadRadius: 0,
                blurRadius: 50,
                offset: Offset(0, 4),
              ),
              BoxShadow(
                color: Color(0x33FA00FF),
                spreadRadius: 0,
                blurRadius: 20,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Container(
            height: widget.size - 4,
            width: widget.size - 4,
            decoration: BoxDecoration(
              color: Color(0xFF0F0F0F),
              borderRadius: BorderRadius.circular(60),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Inner rotating gradient container
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF7000FF),
                        Color(0xFFFF00B8),
                      ],
                      begin: gradientBegin,
                      end: gradientEnd,
                    ),
                    border: Border.all(width: 0),
                  ),
                  child: Image.asset('assets/images/new_logo.png'),
                ),
                // Outline for the inner icon
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFF0F0F0F),
                      width: 1,
                    ),
                  ),
                  child: Image.asset('assets/images/new_logo.png'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
