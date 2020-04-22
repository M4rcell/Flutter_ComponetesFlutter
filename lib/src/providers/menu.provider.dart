
// importacioines necesarios  para cargar archivos JSON
import 'package:flutter/services.dart' show rootBundle;


// importar la libreria
import 'dart:convert';

class _MenuProvider{

  List<dynamic> opciones = [];

 // constructor
  _MenuProvider(){

    //metodo
    //cargardata();
    
      }
  
  // future => returna una tarea que se va resolver en un futuro
  Future <List<dynamic>>   cargardata() async {
        //primero configurar pubspec.yaml => para tener acceso a ruta del archivo        
        // URL donde se encuentra el archivo

        // crear un fichure
       final resp = await rootBundle.loadString('data/menu-opts.json');
      
         Map dataMap = json.decode(resp);
           print(dataMap['rutas']);

           opciones = dataMap['rutas'];

           return opciones;

      }

}

// instancia de la aplicacion
final menuProvider = new _MenuProvider();
