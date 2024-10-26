import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartMessageWidget extends StatelessWidget {
  final List<double> xValues = [0, 1, 2, 3, 4, 5, 6];
  final List<double> yValues1 = [0.5, 1, 2.5, 2.75, 2.5, 3, 5];
  final List<double> yValues2 = [0, 0.5, 2, 2.5, 2.5, 3, 5];

  LineChartMessageWidget({super.key});

  List<FlSpot> _createSpots(List<double> xValues, List<double> yValues) {
    return List<FlSpot>.generate(
      xValues.length,
      (index) => FlSpot(xValues[index], yValues[index]),
    );
  }

  double get minX => xValues.reduce((a, b) => a < b ? a : b);
  double get maxX => xValues.reduce((a, b) => a > b ? a : b);
  double get minY => [
        ...yValues1,
        ...yValues2
      ].reduce((a, b) => a < b ? a : b);
  double get maxY => [
        ...yValues1,
        ...yValues2
      ].reduce((a, b) => a > b ? a : b);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: LineChart(
        LineChartData(
          backgroundColor: Colors.white,
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                reservedSize: 35,
                getTitlesWidget: (value, meta) {
                  return Text(
                    value.toInt().toString(),
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  );
                },
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                getTitlesWidget: (value, meta) {
                  return Text(
                    'Day ${value.toInt()}',
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  );
                },
              ),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: Colors.black, width: 1),
          ),
          minX: minX,
          maxX: maxX,
          minY: minY,
          maxY: maxY,
          lineBarsData: [
            LineChartBarData(
              color: Colors.blue.withAlpha(150),
              spots: _createSpots(xValues, yValues1),
              isCurved: true,
              barWidth: 2,
              belowBarData: BarAreaData(show: false),
            ),
            LineChartBarData(
              color: Colors.red.withAlpha(150),
              spots: _createSpots(xValues, yValues2),
              isCurved: true,
              barWidth: 2,
              belowBarData: BarAreaData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}
