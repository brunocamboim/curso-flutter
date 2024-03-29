import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(Home());

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _dadosControl = new TextEditingController();
  String _dadosSalvos = "";

  @override
  void initState() {
    super.initState();
    _pegarDados();
  }

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
          padding: const EdgeInsets.all(13.4),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              TextField(
                controller: _dadosControl,
                decoration: InputDecoration(labelText: "Escreva algo..."),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
              ),
              FlatButton(
                color: Colors.redAccent,
                onPressed: () {
                  _salvarDados(_dadosControl.text);
                },
                child: Text('Salvar Dados'),
              ),
              Text("$_dadosSalvos")
            ],
          ),
        ),
      ),
    );
  }

  void _pegarDados() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String info = preferences.getString('dados');
    setState(() {
      if (info != null && info.isNotEmpty) {
        _dadosSalvos = info;
      } else {
        _dadosSalvos = "Vazio";
      }
    });
  }

  void _salvarDados(String mensagem) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('dados', mensagem);
  }

}