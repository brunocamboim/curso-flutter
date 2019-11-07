import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Coluna extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blueAccent,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Text("Primeiro",
                textDirection: TextDirection.ltr,
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15.0)),

            //Expande o máximo
            // Expanded(child: Text("Ola") ),

            //Utiliza o espaço disponivel
            // Flexible(child: Text("Outro")),
            // Flexible(child: Text("Ainda")),

            Padding(
              padding: EdgeInsets.all(13.0),
              child: FlatButton(onPressed: () => {}, child: Text("Botão")),
            ),

            Text(
              "Segundo",
              textDirection: TextDirection.ltr,
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15.0),
            ),

            new FlatButton(
              onPressed: () => "Hello",
              child: Text("Botão"),
              color: Colors.white,
            )
          ],
        )

        // child: Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   children: <Widget>[
        //     Text("Primeiro",
        //         textDirection: TextDirection.ltr,
        //         style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15.0)),

        //     //Expande o máximo
        //     // Expanded(child: Text("Ola") ),

        //     //Utiliza o espaço disponivel
        //     Flexible(child: Text("Outro")),
        //     Flexible(child: Text("Ainda")),

        //     Padding(
        //       padding: EdgeInsets.all(13.0),
        //       child: FlatButton(onPressed: () => {}, child: Text("Botão")),
        //     ),

        //     Text(
        //       "Segundo",
        //       textDirection: TextDirection.ltr,
        //       style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15.0),
        //     ),

        //     new FlatButton(
        //       onPressed: () => "Hello",
        //       child: Text("Botão"),
        //       color: Colors.white,
        //     )
        //   ],
        // )

        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: <Widget>[
        //     Text("Primeiro",
        //       textDirection: TextDirection.ltr,
        //       style: TextStyle(fontStyle: FontStyle.italic)
        //     ),
        //     Text("Segundo",
        //       textDirection: TextDirection.ltr,
        //       style: TextStyle(fontStyle: FontStyle.italic),
        //     ),

        //     new FlatButton(
        //       onPressed: () => "Hello",
        //       child: Text("Botão"),
        //       color: Colors.white,
        //     )
        //   ],
        // )
        );
  }
}
