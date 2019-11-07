import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final TextEditingController _controlePeso = new TextEditingController();

  int radioValor = 1;
  String _nomePlaneta = "";

  bool selecaoValorA = true;
  bool selecaoValorB = false;
  bool selecaoValorC;
  bool switchValor = false;

  double _resultadoFinal = 0.0;
  
  void tomaContaValorRadio (int valor) {

    setState(() {
      radioValor = valor;  

      switch (radioValor) {
        case 0:
          _resultadoFinal = calcularPesoEmPlaneta(_controlePeso.text, 0.06);
          _nomePlaneta = "Peso em Plutao eh ${_resultadoFinal.toStringAsFixed(2)}";
          break;

        case 1:
        
          _resultadoFinal = calcularPesoEmPlaneta(_controlePeso.text, 0.38);
          _nomePlaneta = "Peso em Marte eh ${_resultadoFinal.toStringAsFixed(2)}";
          break;

        case 2:
          _resultadoFinal = calcularPesoEmPlaneta(_controlePeso.text, 0.91);
          _nomePlaneta = "Peso em Venus eh ${_resultadoFinal.toStringAsFixed(2)}";
          break;
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Planeta X"),
        backgroundColor: Colors.black38,
      ),

      backgroundColor: Colors.blueGrey,

      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          padding: const EdgeInsets.all(1.5),
          children: <Widget>[
            Image.asset(
              "assets/planet.png",
              height: 133.0,
              width: 200.0,
            ),
            Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _controlePeso,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "O seu peso na terra",
                      hintText: 'kg',
                      icon: Icon(Icons.person_outline)
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Radio<int>(
                        activeColor: Colors.brown,
                        value: 0, 
                        groupValue: radioValor, 
                        onChanged: tomaContaValorRadio
                      ),
                      Text(
                        "Plutao",
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                      Radio<int>(
                        activeColor: Colors.red,
                        value: 1, 
                        groupValue: radioValor, 
                        onChanged: tomaContaValorRadio
                      ),
                      Text(
                        "Marte",
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                      Radio<int>(
                        activeColor: Colors.orangeAccent,
                        value: 2, 
                        groupValue: radioValor, 
                        onChanged: tomaContaValorRadio
                      ),
                      Text(
                        "Venus",
                        style: TextStyle(
                          color: Colors.white
                        ),
                      )
                    ],
                  ),

                  //Resultado
                  Text(
                    _controlePeso.text.isEmpty ? "Insira o seu peso" : _nomePlaneta + " Kg",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19.4,
                      fontWeight: FontWeight.w400
                    ),
                  )

                ],
              ),
            )
          ],
        )
      ),
    );
  }

  double calcularPesoEmPlaneta(String peso, double gravidadeSuperficial) {
    if (int.parse(peso).toString().isNotEmpty && int.parse(peso) > 0) {
      return (int.parse(peso) * gravidadeSuperficial);
    } else {
      print("Numero errado!");
      return int.parse("180") * 0.38;
    }

  }

}