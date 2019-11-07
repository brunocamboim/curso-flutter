import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {

  final TextEditingController _usuarioController = new TextEditingController();
  final TextEditingController _senhaController = new TextEditingController();

  String _bemvindo = "";

  void _mostraBemVindo() {
    setState(() {
     if (_usuarioController.text.isNotEmpty && _senhaController.text.isNotEmpty) {

       _bemvindo = "Bem-vindo, ${_usuarioController.text}";

     } else {

      _bemvindo = "Vazio!";

     }
    });
  }

  void _cancelar() {
    setState(() {
      _usuarioController.clear();
      _senhaController.clear();
      _bemvindo = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Cadastro"),
        backgroundColor: Colors.deepOrange,
      ),
      backgroundColor: Colors.amber,
      body: Container(
          alignment: Alignment.topCenter,
          child: ListView(
            children: <Widget>[
              Image.asset(
                "assets/face.png",
                width: 90.0,
                height: 90.0,
                color: Colors.white,
              ),

              // cadastro/formulario
              Container(
                  width: double.infinity,
                  color: Colors.white70,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: _usuarioController,
                          decoration: new InputDecoration(
                            hintText: "Nome",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.5)),

                            // icon: Icon(Icons.person)
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: _senhaController,
                          obscureText: true,
                          decoration: new InputDecoration(
                            hintText: "Senha",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.5)),

                            // icon: Icon(Icons.person)
                          ),
                        ),
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              // margin: const EdgeInsets.only(left: 38.0),
                              child: RaisedButton(
                                onPressed: _mostraBemVindo,
                                color: Colors.white,
                                child: Text("Entrar",
                                  style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: 16.9
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              // margin: const EdgeInsets.only(left: 120.0),
                              child: RaisedButton(
                                onPressed: _cancelar,
                                color: Colors.white,
                                child: Text("Cancelar",
                                  style: TextStyle(
                                    fontSize: 16.9,
                                    color: Colors.blueAccent
                                  ),
                                )
                              )
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("$_bemvindo",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 19.6,
                          fontWeight: FontWeight.w400
                        ),
                      )
                    ],
                  ),
                )
            ],
          )),
    );
  }
}
