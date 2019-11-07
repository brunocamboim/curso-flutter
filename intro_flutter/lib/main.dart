import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'ui/coluna.dart';
import 'ui/bemvindo.dart';

void main() {
  runApp(
    new MaterialApp(
      title: "Olá",
      home: Coluna(),
    ),
    // new Center(
    //   child: new Text("Alo Bruno",
    //     textDirection: TextDirection.ltr,
    //   ),
    // )
  );
}