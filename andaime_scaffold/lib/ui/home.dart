import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatelessWidget {

  void botaoFlutuante() => debugPrint("Botao Flutuante");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scaffold-Andaime"),
        backgroundColor: Colors.orange,
        actions: <Widget>[
          IconButton(
            icon: new Icon(Icons.accessible),
            onPressed: () => debugPrint("Olá"),
          ),
          IconButton(
            icon: new Icon(Icons.print),
            onPressed: null,
          ),
          IconButton(
            icon: new Icon(Icons.access_alarm),
            onPressed: null,
          )
        ],
      ),

      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Bonni",
              style: TextStyle(
                  fontSize: 19.5,
                  fontWeight: FontWeight.w700,
                  color: Colors.deepOrange),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: InkWell(
                child: Text(
                  "Clique",
                  style: TextStyle(fontSize: 16.0),
                ),
                onTap: () => debugPrint("Tap"),
                onDoubleTap: () => debugPrint("Tap Duplo"),
                onLongPress: () => debugPrint("Long press"),
              ),
            )
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.access_alarm), title: Text("Perfil")),
        BottomNavigationBarItem(
            icon: Icon(Icons.print), title: Text("Imprimir"))
      ]),

      floatingActionButton: FloatingActionButton(
        onPressed: botaoFlutuante,
        child: Icon(Icons.add),
        backgroundColor: Colors.deepOrange,
      ),
    );
  }
}
