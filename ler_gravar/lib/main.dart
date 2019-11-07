import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  return runApp(new MaterialApp(
    home: new Home(),
    title: "I/O",
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _campoDadosControl = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Ler/Gravar"),
          centerTitle: true,
          backgroundColor: Colors.greenAccent,
        ),

        body: Container(
          padding: const EdgeInsets.all(13.0),
          alignment: Alignment.topCenter,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TextField(
                controller: _campoDadosControl,
                decoration: InputDecoration(
                  labelText: "Escreva algo"
                ),
              ),
              Padding(padding: const EdgeInsets.all(14.9),),
              FlatButton(
                color: Colors.greenAccent,
                onPressed: (){
                  gravarDados(_campoDadosControl.text);
                },
                padding: EdgeInsets.all(10.0),
                child: Text("Gravar",),
              ),
              FutureBuilder(
                future: lerDados(),
                builder: (BuildContext context, AsyncSnapshot<String> dados) {
                  if (dados.hasData) {
                    return Text(
                      dados.data,
                      style: TextStyle(
                        color: Colors.pinkAccent
                      ),
                    );
                  } else {
                    return Text(
                      "Nada foi salvo",
                    );
                  }
                },
              )
              
            ],
          ),
        ));
  }
}

Future<String> get _caminhoLocal async {
  final diretorio = await getApplicationDocumentsDirectory();
  return diretorio.path; //home/directory/...
}

Future<File> get _arquivoLocal async {
  final caminho = await _caminhoLocal;
  return new File('$caminho/dados.txt'); //home/directory/.../dados.txt
}

Future<File> gravarDados(String mensagem) async {
  final arquivo = await _arquivoLocal;
  return arquivo.writeAsString('$mensagem');
}

Future<String> lerDados() async {
  try {
    final arquivo = await _arquivoLocal;

    return await arquivo.readAsString();
  } catch (e) {
    return "Ainda não foi salvo nada!";
  }
}
