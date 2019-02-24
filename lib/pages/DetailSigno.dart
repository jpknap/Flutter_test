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
      body: Container(
      child: Text("Amor: "+this.signo.amor),
    )
    );
  }
}