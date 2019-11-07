import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Magnata extends StatefulWidget {
  @override
  _MagnataState createState() => _MagnataState();
}

class _MagnataState extends State<Magnata> {

  int _contadorGrana = 0;

  void _mandaGrana() {

    //atualiza o valor na tela
    setState(() {
      _contadorGrana += 1000;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Magnata"),
        backgroundColor: Colors.lightGreen,
      ),
      body: Container(
          child: new Column(
        children: <Widget>[
          Center(
            child: Text(
              "Fique Rico",
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: 29.9),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                "\$ $_contadorGrana",
                style: TextStyle(fontSize: 45.6, color: _contadorGrana >= 10000 ? Colors.blueAccent : Colors.amber, fontWeight: FontWeight.w700),
              ),
            )
          ),

          Expanded(
            child: Center(
              child: FlatButton(
                onPressed: _mandaGrana,
                color: Colors.lightGreen,
                textColor: Colors.white,
                child: Text("Mais grana!!", style: TextStyle(fontSize: 19.0))
              )
            )
          )
        ],
      )),
    );
  }
}
