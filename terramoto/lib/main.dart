import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

Map _dados;
List _features;

void main() async {

  _dados = await pegaTerramotos();

  _features = _dados['features'];

  // debugPrint("$_features");

  runApp(new MaterialApp(
    home: new Terremoto(),
  ));
}

class Terremoto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.red,
          title: Text(
            "Terramotos",
            style: TextStyle(fontSize: 25.0),
          ),
        ),
        body: Center(
            child: ListView.builder(
          itemCount: _features.length,
          padding: const EdgeInsets.all(5.0),
          itemBuilder: (BuildContext context, int posicao) {

            initializeDateFormatting("pt_BR", null);

            var format = new DateFormat.yMMMMd("pt_BR");

            var data = format.format(new DateTime.fromMicrosecondsSinceEpoch(
              _features[posicao]['properties']['time'] * 1000
            ));

            return Column(
              children: <Widget>[
                Divider(
                  height: 5.5,
                ),
                ListTile(
                  title: Text(
                    "${data}",
                    style: TextStyle(
                      fontSize: 15.5,
                      color: Colors.orange,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  subtitle: Text(
                    "${_features[posicao]['properties']['place']}",
                    style: TextStyle(
                      fontSize: 14.5,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.italic,
                      color: Colors.grey
                    ),
                  ),
                  leading: CircleAvatar(
                    backgroundColor: Colors.greenAccent,
                    child: Text(
                      "${_features[posicao]['properties']['mag']}",
                      style: TextStyle(
                        fontSize: 16.5,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontStyle: FontStyle.normal
                      ),
                    ),
                  ),
                  onTap: () => _mostraMensagem(context, _features[posicao]['properties']['title']),
                ),
              ],
            );
          },
        )
      )
    );
  }
}

Future<Map> pegaTerramotos() async {
  String url =
      "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson";

  http.Response response = await http.get(url);

  return json.decode(response.body);
}

_mostraMensagem(BuildContext context, String mensagem){
  var alert = AlertDialog(
    title: Text("Terramotos"),
    content: (Text(mensagem)),
    actions: <Widget>[
      FlatButton(
        onPressed: () => {
          Navigator.pop(context)
        },
        child: Text("Ok"),
      )
    ],
  );

  showDialog(
    context: context,
    builder: (context) => alert
  );
}