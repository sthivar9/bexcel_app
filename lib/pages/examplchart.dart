import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartSample extends StatelessWidget {
  const LineChartSample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: AspectRatio(
            aspectRatio: 2.0,
            child: LineChart(LineChartData(
                lineBarsData: [
                  LineChartBarData(
                    show: true,
                    spots: const [
                      FlSpot(0, 0),
                      FlSpot(1, 1.5),
                      FlSpot(2, 3.5),
                      FlSpot(3, 5),
                      FlSpot(4, 4),
                      FlSpot(5, 3),
                      FlSpot(6, 6),
                    ],
                    color: Colors.red,
                    gradient: const LinearGradient(colors: [
                      Color.fromARGB(255, 255, 111, 101),
                      Colors.purpleAccent,
                      Colors.lightBlueAccent,
                    ], begin: Alignment.bottomLeft, end: Alignment.topCenter),
                    barWidth: 6,
                    isCurved: true,
                    isStrokeCapRound: true,
                    dotData: FlDotData(show: false),
                  ),
                ],
                titlesData: const FlTitlesData(
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                        axisNameWidget: Text("Expense"))))),
          ),
        ),
      ),
    );
  }
}
