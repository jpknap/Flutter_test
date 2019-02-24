
import 'package:flutter/material.dart';

class ListMessage extends StatelessWidget {
  final List<String> store;
  final void Function(String) onPresses;
  
ListMessage(this.store, this.onPresses);
  @override
  Widget build (BuildContext context) {
    print(this.store);
    return Container(
      child: GridView.count(
  // Crea un grid con 2 columnas. Si cambias el scrollDirection a 
  // horizontal, esto produciría 2 filas.
  crossAxisCount: 3,
  // Genera 100 Widgets que muestran su índice en la lista
  children: this.store.map((String value) {
            return new GestureDetector(
              onLongPress: () {
                this.onPresses (value);

              },
              child: Container(
              color: Colors.green,
              margin: new EdgeInsets.all(1.0),
              child: new Center(
                child: new Text(
                  value,
                  style: new TextStyle(
                    fontSize: 50.0,
                    color: Colors.white,
                  ),
                ),
              ),
            )
            );
          }).toList(), 
 
)

    );
  }
}