
import 'package:flutter/material.dart';
import 'package:project_tab/pages/Home.dart';
import 'package:project_tab/pages/ListMessage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TabBarEjemplo extends StatefulWidget {
  @override
  _TabBarEjemploState createState() => _TabBarEjemploState();
}

class _TabBarEjemploState extends State<TabBarEjemplo> {
  List<String>  _storeListString = new  List<String>();

  @override
  void initState() {
    super.initState();
    setStore();
  }
  
  dynamic getListStringStore () async {
    SharedPreferences prefs =  await SharedPreferences.getInstance();
    List<String> _storeListStringAux = prefs.getStringList('listString') == null ? new List<String>() : prefs.getStringList('listString');
    return _storeListStringAux;
  }
  void setListStringStore (List<String> newListString) async {
     SharedPreferences prefs =  await SharedPreferences.getInstance();
    List<String> _storeListStringAux = prefs.getStringList('listString') == null ? new List<String>() : prefs.getStringList('listString');
    prefs.setStringList('listString', _storeListStringAux);
  }
  void setStore () async  {
    List<String> _storeListStringAux =  await this.getListStringStore();
    setState(() {
      this._storeListString = _storeListStringAux;
    });
  }
  void removeElementStore (String value) async {
     List<String> _storeListStringAux = await this.getListStringStore();
    _storeListStringAux.remove(value);
    await this.setListStringStore(_storeListStringAux);
    setState(() {
      this._storeListString = _storeListStringAux;
    });
  }
  void addElementstore (String data) async {
     List<String> _storeListStringAux = await this.getListStringStore();
     _storeListStringAux.add(data);
     await this.setListStringStore(_storeListStringAux);
     setState(() {
     this._storeListString = _storeListStringAux;
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text("pruebas tab"),
          ),
          backgroundColor: Colors.lightBlueAccent,
          bottomNavigationBar: TabBar(        
            tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.all(5.0),
            indicatorColor: Colors.yellow,
          ),
          body: TabBarView(
            children: <Widget>[
              Column(
                
                children: <Widget>[

   Home(this.addElementstore),
    Expanded(
      child: ListMessage(this._storeListString,this.removeElementStore),
    ),

              ],),
              
              ListMessage(this._storeListString,this.removeElementStore),
              Icon(Icons.directions_bike)
            ],
            
          ),
          
        ),
      )
      
    );
  }

}

