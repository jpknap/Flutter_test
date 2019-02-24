import 'package:flutter/material.dart';
 
class Home extends StatefulWidget {

    final void Function(String) onPresses;

   Home(this.onPresses);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  final _formKey = GlobalKey<FormState>();
  String data ;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              textFormField(context),
              textFormField(context),
              Padding(
                padding: EdgeInsets.only(top:10.0),
                child: RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()){
                
                        _formKey.currentState.save();
                        widget.onPresses(data);
                        _formKey.currentState.reset();
                         Scaffold.of(context).showSnackBar(SnackBar(content: Text('Mensaje Guardado'),backgroundColor: Colors.lightGreen,));
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
      color: Colors.white,
    );
  }
  
  TextFormField textFormField (BuildContext context)  {
    return TextFormField (
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      onSaved: (value) => data = value,
      validator: (value) {
        if (value.isEmpty)
        return ('Por favor ingrese un valor');
      },
      decoration: InputDecoration(
        hintText: 'Ingresa un texto libreta',
        icon: Icon(Icons.text_fields),
        fillColor: Colors.grey
      ),
    );
  }

}