
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project_tab/models/Util.dart';
import 'package:project_tab/pages/LoadingPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:project_tab/models/Signo.dart';
import 'SignosList.dart';

class TabBarApi extends StatefulWidget {
  @override
  _TabBarApiState createState() => _TabBarApiState();
}

class _TabBarApiState extends State<TabBarApi> {
  List<Signo>  _storeListSigno = new  List<Signo>();

  @override
  void initState() {
    super.initState();
    this.setStore();
  }

  List<Signo> parseSignos(String responseBody) {
  final parsed = json.decode(responseBody);
  List<Signo> _listaSignos =  new List<Signo>();
   for (final name in parsed.keys) {
        String iconUrl = Util.zodiac_icons[name];
       final value = parsed[name];
       value['icon'] = iconUrl;

     _listaSignos.add(new Signo.fromJson(value));
  }

  return _listaSignos;
}
  Future< List<Signo> > fetchSignos(http.Client client) async {
  final response =
      await client.get('https://api.adderou.cl/tyaas/');
  // Usa la función compute para ejecutar parse en un isolate separado
  dynamic _jsonHoroscopo = json.decode(response.body)['horoscopo'];
  String encodeJson = json.encode(_jsonHoroscopo);
  return this.parseSignos(encodeJson);
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
    List<Signo> _storeListSignoAux =  await this.fetchSignos(new http.Client());
    setState(() {
      this._storeListSigno = _storeListSignoAux;
    });
  }
 

  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Tia Yolanda Zultana"),
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
              this._storeListSigno.isNotEmpty ? SignosList(this._storeListSigno) :LoadingPage(),
              Text("Tia"),
              Text("Yolanda")
            ],
            
          ),
          
        ),
      )
      
    );
    }

  }



