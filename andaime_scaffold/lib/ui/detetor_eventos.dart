import 'package:flutter/material.dart';

class DetetorEventos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (
        AppBar(
          title: Text("Detetor"),
          backgroundColor: Colors.deepPurpleAccent,
        )
      ),

      body: new Center(
        child: new MeuBotao(),
      ),
    );
  }
}

class MeuBotao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector( //detector de eventos e gestos
      onTap: () {
        final snackBar = SnackBar(content: Text("Ola Gestos/Eventos"));
        Scaffold.of(context).showSnackBar(snackBar);
      },

      child: Container(
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(5.5)
        ),

        child: Text("O meu botão"),
      ),

    );
  }
}