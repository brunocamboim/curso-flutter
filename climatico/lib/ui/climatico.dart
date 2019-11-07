import 'package:climatico/telas/tela_cidade.dart';
import 'package:climatico/transacoes/pega_clima.dart';
import 'package:climatico/util/util.dart' as util;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Climatico extends StatefulWidget {
  @override
  _ClimaticoState createState() => _ClimaticoState();
}

class _ClimaticoState extends State<Climatico> {

  String _cidadeInserida;

  Future _abrirNovaTela(BuildContext context) async {

    Map resultado = await Navigator
    .of(context)
    .push(new MaterialPageRoute<Map>(
      builder: (BuildContext context) {
        return new MudarCidade();
      } 
    ));
    
    if(resultado != null && resultado.containsKey('cidade')) {
      _cidadeInserida = resultado['cidade'];
      debugPrint("Cidade $_cidadeInserida");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Climático"),
        backgroundColor: Colors.redAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => _abrirNovaTela(context)
          )
        ],
      ),

      body: Stack(
        children: <Widget>[
          Center(
            child: Image.asset(
              'assets/umbrella.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity
            ),
          ),
          Container(
            alignment: Alignment.topRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text("${_cidadeInserida == null ? util.minhaCidade : _cidadeInserida}",
                  style: styleCidade(),
                )
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Image.asset("assets/light-rain.png"),
          ),
          atualizarTempoWidget(_cidadeInserida)
        ],
      ),
    );
  }

  Widget atualizarTempoWidget(String cidade) {
    return FutureBuilder(
      future: pegaClima(util.appId, cidade == null ? util.minhaCidade : cidade),
      builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
        if (snapshot.hasData) {

          Map conteudo = snapshot.data;
          return Container(
            margin: const EdgeInsets.fromLTRB(30.0, 250.0, 0.0, 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ListTile(
                  title: Text(conteudo['main']['temp'].toString() + "C",
                    style: tempStyle(),
                  ),
                  subtitle: ListTile(
                    title: Text("Umidade: ${conteudo['main']['humidity'].toString()}\n"
                      "Min: ${conteudo['main']['temp_min'].toString()} C\n"
                      "Max: ${conteudo['main']['temp_max'].toString()} C\n",
                      style: extraTemp(),
                    ),
                  ),
                )
              ],
            ),
          );

        } else {
          return Container(
            child: Text("Falhou!"),
          );
        }
      },
    );
    
  }

  TextStyle extraTemp() {
    return TextStyle(
      color: Colors.white70,
      fontStyle: FontStyle.normal,
      fontSize: 19.0
    );
  }

  TextStyle styleCidade() {
    return TextStyle(
      color: Colors.white70,
      fontStyle: FontStyle.italic,
      fontSize: 25.0
    );
  }


  TextStyle tempStyle() {
    return TextStyle(
      color: Colors.white70,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      fontSize: 45.0
    );
  }

}