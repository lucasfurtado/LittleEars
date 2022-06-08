import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fl_chart/fl_chart.dart';

class PlotGraphOne extends StatelessWidget {
  const PlotGraphOne({Key? key, required this.x, required this.y }) : super(key: key);

  final double x;
  final double y;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the debug banner
        debugShowCheckedModeBanner: false,
        title: 'KindaCode.com',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: MyHomePage(x: x,y: y,));
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.x, required this.y}) : super(key: key);

  final double x;
  final double y;

  // Generate some dummy data for the cahrt
  // This will be used to draw the red line
  final List<FlSpot> dummyData1 = List.generate(8, (index) {
    return FlSpot(index.toDouble(), index * Random().nextDouble());
  });

  //// This will be used to draw the orange line
  //final List<FlSpot> dummyData2 = List.generate(8, (index) {
  //  return FlSpot(index.toDouble(), index * Random().nextDouble());
  //});

  //// This will be used to draw the blue line
  //final List<FlSpot> dummyData3 = List.generate(8, (index) {
  //  return FlSpot(index.toDouble(), index * Random().nextDouble());
  //});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Score: ${y.toString()} - Meses: ${x.toString()}'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          child: LineChart(
            LineChartData(
              borderData: FlBorderData(show: false),
              lineBarsData: [
                // The red line
                LineChartBarData(
                  spots: [
                    FlSpot(0, 0),
                    FlSpot(2, 1),
                    FlSpot(4, 5),
                    FlSpot(6, 9.5),
                    FlSpot(8, 12),
                    FlSpot(10, 15),
                    FlSpot(12, 17.5),
                    FlSpot(14, 19.5),
                    FlSpot(16, 21.5),
                    FlSpot(18, 23.5),
                    FlSpot(20, 25),
                    FlSpot(22, 26.5),
                    FlSpot(24, 28),
                    FlSpot(26, 29),
                    FlSpot(28, 30),
                    FlSpot(30, 31),
                    FlSpot(32, 31.5),
                    FlSpot(34, 32.5),
                    FlSpot(36, 33),
                    FlSpot(38, 33.5),
                    FlSpot(40, 34),
                    FlSpot(42, 34.3),
                    FlSpot(44, 34.6),
                    FlSpot(46, 34.8),
                    FlSpot(48, 35),
                  ],
                  isCurved: true,
                  barWidth: 3,
                  color: Colors.green,

                ),
                // The orange line
                LineChartBarData(
                  spots: [
                    FlSpot(x, y),
                  ],
                  isCurved: true,
                  barWidth: 3,
                  color: Colors.orange,
                ),
                // The blue line
              ],
            ),
          ),
        ),
      ),
    );
  }
}