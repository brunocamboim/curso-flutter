import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BemVindo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blueAccent,
      child: new Center(
        child: new Text(
          "Alo, Bruno",
          textDirection: TextDirection.ltr,
          style: new TextStyle(fontSize: 34.0, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}