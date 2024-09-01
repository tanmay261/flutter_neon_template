import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double calculateRadius(
        double value, double maxValue, double minRadius, double maxRadius) {
      return minRadius + (value / maxValue) * (maxRadius - minRadius);
    }

    const double minRadius = 30.0;
    const double maxRadius = 80.0;
    const double maxValue = 30.0;
    var chartData = PieChartData(sections: [
      PieChartSectionData(
          value: 30,
          title: 'A',
          showTitle: true,
          radius: calculateRadius(30, maxValue, minRadius, maxRadius),
          color: Colors.blue),
      PieChartSectionData(
          value: 20,
          title: 'B',
          showTitle: true,
          radius: calculateRadius(20, maxValue, minRadius, maxRadius),
          color: Colors.red),
      PieChartSectionData(
          value: 15,
          title: 'C',
          showTitle: true,
          radius: calculateRadius(15, maxValue, minRadius, maxRadius),
          color: Colors.green),
      PieChartSectionData(
          value: 25,
          title: 'D',
          showTitle: true,
          radius: calculateRadius(25, maxValue, minRadius, maxRadius),
          color: Colors.yellow),
      PieChartSectionData(
          value: 10,
          title: 'E',
          showTitle: true,
          radius: 50,
          color: Colors.purple),
    ]);
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: ListView(children: [
          SizedBox(
            height: 300,
            child: PieChart(chartData),
          ),
        ]),
      ),
    ));
  }
}
