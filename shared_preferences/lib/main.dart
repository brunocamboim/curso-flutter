import 'package:flutter/material.dart';

void main() => runApp(Home());

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Shared Prefs'),
          centerTitle: true,
          backgroundColor: Colors.deepOrange,
        ),

        body: Container(
          
        ),
      ),
    );
  }
}