import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project_tab/models/Signo.dart';
import 'package:project_tab/pages/DetailSigno.dart';

class SignosList extends StatelessWidget {
  final List<Signo> _listaSigno;
        SignosList(this._listaSigno );

  @override
  Widget build (BuildContext context) {
  List colors = [Colors.redAccent, Colors.green, Colors.purpleAccent, Colors.blueGrey];
    Random random = new Random();

    return Container(
      child: GridView.count(
  // Crea un grid con 2 columnas. Si cambias el scrollDirection a 
  // horizontal, esto produciría 2 filas.
  crossAxisCount: 1,
childAspectRatio: 3,
  // Genera 100 Widgets que muestran su índice en la lista
  children: this._listaSigno.map((Signo _signo) {
              int index = random.nextInt(4);
            return new GestureDetector(
              onTap: () {
                Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailSigno(_signo)),
            );
            },
              child:
              Container(
              decoration: BoxDecoration(
                borderRadius: new BorderRadius.all(const  Radius.circular(7.0)),
                                color: colors[index],

              ),
                margin: new EdgeInsets.all(1.0),
               child : Row(
                children: <Widget>[
                  Container (
                 
                    margin: new EdgeInsets.fromLTRB(25.0, 0, 0, 0),
                    child: Image.asset(
                     _signo.icon_url, 
                      width: 65.0,
                      height: 65.0,
                      fit: BoxFit.cover
                    )
            )
                    ,
                  Expanded(
                    child: Container(
                    child: new Center(
                      child: new Text(
                        _signo.nombre,
                        style: new TextStyle(
                          fontSize: 50.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  )
                ],
              )
              )
            );
          }).toList(), 
 
)

    );
  }
}