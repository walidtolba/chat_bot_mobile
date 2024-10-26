import 'package:chat_bot/pages/chat_page.dart';
import 'package:chat_bot/pages/landing_page.dart';
import 'package:chat_bot/pages/voice_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';

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

class BarThing extends StatelessWidget {
  const BarThing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            height: 300,
            width: 400,
            child: LineChart(
              LineChartData(
                backgroundColor: Colors.white,
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(show: true,),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(color: Colors.black, width: 1),
                ),
                minX: 0,
                maxX: 6,
                minY: 0,
                maxY: 6,
                lineBarsData: [
                  LineChartBarData(
                    color: Colors.blue.withAlpha(150),
                    spots: [
                      FlSpot(0, 0.5),
                      FlSpot(1, 1),
                      FlSpot(2, 2.5),
                      FlSpot(3, 2.75),
                      FlSpot(4, 2.5),
                      FlSpot(5, 3),
                      FlSpot(6, 5),
                    ],
                    isCurved: true,
                    barWidth: 2,
                    belowBarData: BarAreaData(show: false),
                  ),
                  LineChartBarData(
                    color: Colors.red.withAlpha(150),
                    spots: [
                      FlSpot(0, 0),
                      FlSpot(1, 0.5),
                      FlSpot(2, 2),
                      FlSpot(3, 2.5),
                      FlSpot(4, 2.5),
                      FlSpot(5, 3),
                      FlSpot(6, 5),
                    ],
                    isCurved: true,
                    barWidth: 2,
                    belowBarData: BarAreaData(show: false),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
