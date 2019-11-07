import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {

  // List _dados = await getJson();
  List _dados = await jsonComplexo();
  String _body = "";

  runApp(new MaterialApp(
    home: new Scaffold(
      appBar: AppBar(
        title: Text("JSON"),
      ),

      body: Center(
        child: Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                
              ],
            )
          ],
        ),
        // child: ListView.builder(
        //   itemCount: _dados.length,
        //   padding: EdgeInsets.all(14.5),
        //   itemBuilder: (BuildContext context, int posicao) {
        //     return Column(
        //       children: <Widget>[
        //         Divider(
        //           height: 5.5
        //         ),
        //         ListTile(
        //           title: Text(
        //             "${_dados[posicao]['email']}"
        //           ),
        //           subtitle: Text(
        //             "${_dados[posicao]['body']}"
        //           ),
        //           leading: CircleAvatar(
        //             backgroundColor: Colors.greenAccent,
        //             child: Text(
        //               "${_dados[posicao]['email'][0]}"
        //             )
        //           ),
        //           onTap: () => _mostraMensagem(context, _dados[posicao]['body']),
        //         )
        //       ],
        //     );
        //   },
        // ),

      ),
    ),
  ));
}


_mostraMensagem(BuildContext context, String mensagem){
  var alert = AlertDialog(
    title: Text("Json"),
    content: (Text(mensagem)),
    actions: <Widget>[
      FlatButton(
        onPressed: () => {
          Navigator.pop(context)
        },
        child: Text("OK"),
      )
    ],
  );

  showDialog(
    context: context,
    builder: (context) => alert
  );
}

Future<List> getJson() async {
  String url = "https://jsonplaceholder.typicode.com/comments";

  http.Response response = await http.get(url);
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Falhou!');
  }
}

Future<List> jsonComplexo() async {
  String url = "https://jsonplaceholder.typicode.com/users";

  http.Response response = await http.get(url);
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Falhou!');
  }
}