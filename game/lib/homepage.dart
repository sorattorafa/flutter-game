import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pow/pow.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double xpointAxis = 0;

  void run() {
    setState(() {
      xpointAxis += 0.1;
      ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                color: Colors.blue,
              )),
          Expanded(
              flex: 3,
              child: GestureDetector(
                onTap: run,
                child: AnimatedContainer(
                  alignment: Alignment(xpointAxis, 0),
                  duration: Duration(microseconds: 0),
                  child: Pow(),
                  color: Colors.yellow.shade700,
                ),
              ))
        ],
      ),
    );
  }
}
