import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_plot/flutter_plot.dart';

class GraficoTeste extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Point> data = [
    const Point(21.0, 19.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter plot'),
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: new Column(
              children: <Widget>[
                new Container(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: new Text('Super Neat Plot'),
                ),
                new Container(
                  child: new Plot(
                    height: 400.0,
                    data: data,
                    gridSize: new Offset(2.0, 2.0),
                    style: new PlotStyle(
                      pointRadius: 3.0,
                      outlineRadius: 1.0,
                      primary: Colors.white,
                      secondary: Colors.orange,
                      textStyle: new TextStyle(
                        fontSize: 10.0,
                        color: Colors.blueGrey,
                      ),
                      axis: Colors.blueGrey[600],
                      gridline: Colors.blueGrey[100],
                    ),
                    padding: const EdgeInsets.fromLTRB(40.0, 12.0, 12.0, 40.0),
                    xTitle: 'My X Title',
                    yTitle: 'My Y Title',
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}