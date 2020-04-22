
import 'package:flutter/material.dart';

import 'package:componentes/src/providers/menu.provider.dart';
import 'package:componentes/src/utils/icons_string_util.dart';

import 'package:componentes/src/pages/alert_page.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _lista(),
    );
  }
      
  Widget _lista() {

       //llamando class MenuProviders
      //print(menuProvider.opciones) ;
     
      return FutureBuilder(
        // esta propiedad => future tiene que estar enlaza a lo nosotros queremos espera
        future: menuProvider.cargardata(),
        //esta propidad => informacion que debuelve mientras que no se resuelava el future
        initialData: [], // es opcional
        //  recive una funcion //builder todo lo que se va a dibujar en el dispositivo
        builder: (BuildContext context,AsyncSnapshot <List<dynamic>> snapshot){
        
          return ListView(

            // Enviar snapshot.data y BuildContext
            children: _listaItems(snapshot.data,context),

          );
        },

      );
    
    }
        // recibiendo snapshot.data y BuildContext
  List<Widget> _listaItems(List<dynamic> data ,context) {
    
     final List<Widget> opciones =[];
     
     //if (data == null) {return []; }

     data.forEach((opt){

       final widgetTemp = ListTile(
         // devuelve text del archivo JSON
         title: Text(opt['texto']),
         // icono al principio
         leading: getIcon(opt['icon']),
         // icono al final
         trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
         // funcion para realizar una tarea especifica
         onTap: (){
           // los PushNAmed => los nombre de las rutas tienes que  estar definidos 
           // main.dart
           Navigator.pushNamed(context, opt['ruta']);

           
           /* final route = MaterialPageRoute(
             builder: (context) => AlertPage()
           );

           para nevegar entre pantallas
           Navigator.push(context, route); */



         },
       );
       
       // agregar a la lista
       opciones..add(widgetTemp)
               ..add(Divider());
     });

     return opciones;

  }
      
}


//CONTINUAR  EN 66