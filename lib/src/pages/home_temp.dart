
//ACCESOS RAPIDOS
// flutter stateless widget => para generar todo codigo statesles 

import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

  final opciones =['Uno','Dos','Tres','Cuatro','Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            title: Text('Componente Temp'),
      ),
      body: ListView(
        children: _craerItemCorta()
       // children: _crearItems()
      ),
    );
  }

  List<Widget>_crearItems(){

    List<Widget> lista = new List<Widget>();

    for (String item in opciones) {

      final tempWidget = ListTile(
        title: Text(item),
      );
      

      lista..add(tempWidget)
           ..add(Divider());
      

    }

    return lista;
   
  }

  // OTRA  FORMA DE CREAR UNA LISTA
  List<Widget> _craerItemCorta() {

    return  opciones.map((item){
      
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item +'  '),
            subtitle: Text('data'),
            leading: Icon(Icons.arrow_drop_down_circle),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: (){},
          ),
          Divider()
        ],
      );

    }).toList();

  

  }
}