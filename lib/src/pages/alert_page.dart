

import 'package:flutter/material.dart';

//stles 
class AlertPage  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Mostrar Alerta'),
          color: Colors.blue,
          textColor: Colors.white,
          // botones redondedos
          shape: StadiumBorder() ,
          onPressed:() => _mostraAlerta(context)),
      ),

      
      //creacion de botton para regresar
      floatingActionButton: FloatingActionButton(
        
        child: Icon(Icons.text_fields),
        onPressed: () {
          Navigator.pop(context);
        },
        tooltip: 'Show me the value!',
        
     
      ),
    );
  }

  void _mostraAlerta(context){
    
    // mostrar un message dialog a l presiuonar en el boton
    showDialog(
      context: context,
      // cerrar el alerta ahciendo clik afuera
      barrierDismissible: true,
      // encargado de creear el poap de alerta
      builder: (context){

       return AlertDialog(
         shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
         title: Text('Titulo'),
         content: Column(
           // mesage alert se adapte al contenido
           mainAxisSize: MainAxisSize.min,
           children: <Widget>[
             Text('Hola mundo asasd asd asd asd asd as da asd asd sad asd asd'),
             TextField(
                decoration: InputDecoration(
               // border: InputBorder.none,
                hintText: 'Escribe tu nombre'
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Enter your username'
                ),
              ),
             FlutterLogo(size: 100.0,)
           ],
         ),
         //botones
         actions: <Widget>[
           FlatButton(
             color: Colors.blue,
             textColor: Colors.white,
             shape: StadiumBorder(),
             child: Text('OK'),
             onPressed: (){
               //Navigator.of(context).pop();
              var tol= Tooltip(
                 message: 'Show me the value!',
                 //child: Icon(Icons.text_fields),
                 );
               return tol;
             } ,
           ),
           FlatButton(
             color: Colors.blue,
             textColor: Colors.white,
             shape: StadiumBorder(),
             child: Text('Cancelar'),
             onPressed: () => Navigator.of(context).pop(),
           )
         ],
 
       );
      }
    );
  }    


} 