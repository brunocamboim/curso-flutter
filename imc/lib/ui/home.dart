import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _idade = new TextEditingController();
  TextEditingController _altura = new TextEditingController();
  TextEditingController _peso = new TextEditingController();

  double resultado = 0.0;
  String descricao = "";

  void calcular() {
    setState(() {
      if (_altura.toString().isNotEmpty && _peso.toString().isNotEmpty) {
        resultado = double.parse((double.parse(_peso.text) / pow(double.parse(_altura.text), 2)).toStringAsFixed(2));

        if (resultado < 18.5) {
          descricao = "Peso Baixo";
        } else if (resultado >= 18.5 && resultado <= 24.9) {
          descricao = "Peso Normal";
        } else if (resultado >= 25.0 && resultado <= 29.9) {
          descricao = "Sobrepeso";
        } else if (resultado >= 30.0 && resultado <= 34.9) {
          descricao = "Obesidade";
        } else if (resultado >= 35 && resultado <= 39.9) {
          descricao = "Obesidade Severa";
        } else if (resultado >= 40) {
          descricao = "Obesidade Morbida";
        }
      } 
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("IMC"),
        backgroundColor: Colors.pinkAccent,
      ),

      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          // padding: EdgeInsets.all(5.0),
          children: <Widget>[
            Image.asset("assets/imc-logo.png", height: 130.0, width: 130.0),
            Container(
              decoration: new BoxDecoration(
                color: Colors.black12
              ),
              margin: EdgeInsets.all(5.0),
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _idade,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Idade",
                      icon: Icon(Icons.person_outline)
                    ),
                  ),
                  TextField(
                    controller: _altura,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Altura (m)",
                      icon: Icon(Icons.assessment)
                    ),
                  ),
                  TextField(
                    controller: _peso,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Peso (kg)",
                      icon: Icon(Icons.list)
                    ),
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 5.0),
                          child: RaisedButton(
                            color: Colors.pinkAccent,
                            onPressed: calcular,
                            child: Text("Calcular",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.9
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "${resultado}",
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.blue
                    ),
                  ),
                  Text("${descricao}",
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.pinkAccent
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}