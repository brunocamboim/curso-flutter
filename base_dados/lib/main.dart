import 'package:flutter/material.dart';

void main() => runApp(
  Home()
);

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('B-Dados'),
          backgroundColor: Colors.black38,
          centerTitle: true,
        ),
      ),
    );
  }
}
