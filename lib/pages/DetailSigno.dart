import 'package:flutter/material.dart';
import 'package:project_tab/models/Signo.dart';

class DetailSigno extends StatelessWidget {

  DetailSigno(this.signo);

  final Signo signo;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalle "+this.signo.nombre),
      ),
      body: Column(
        children:<Widget>[
           ListTile(
            title: Center (  child :  Text(this.signo.nombre)),
            subtitle: Center (child :  Text(this.signo.fechaSigno) ),
          ),
          ListTile(
            title: Text("Amor"),
            leading:Icon(Icons.local_florist),
            subtitle: Text(this.signo.amor),
          ),
          ListTile(
            title: Text("Color"),
            leading:Icon(Icons.format_paint),
            subtitle: Text(this.signo.color),
          ),
          ListTile(
            title: Text("Dinero"),
            leading:Icon(Icons.monetization_on),
            subtitle: Text(this.signo.dinero),
          ),
          ListTile(
            title: Text("Salud"),
            leading:Icon(Icons.insert_emoticon),
            subtitle: Text(this.signo.salud),
          ),
          ListTile(
            title: Text("Número"),
            leading:Icon(Icons.looks_one),
            subtitle: Text(this.signo.numero),
          ),
            
        

        ],
        

      )
    );
  }
}