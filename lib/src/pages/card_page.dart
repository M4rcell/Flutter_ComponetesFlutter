
import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardTipo1(),
          // separaciuon entre cards
          SizedBox(height: 25.0,),
           _cardTipo2(),
           SizedBox(height: 25.0,),
           _cardTipo1(),
          // separaciuon entre cards
          SizedBox(height: 25.0,),
           _cardTipo2(),
           SizedBox(height: 25.0,),
           _cardTipo1(),
          // separaciuon entre cards
          SizedBox(height: 25.0,),
           _cardTipo2(),
           SizedBox(height: 25.0,),
           _cardTipo1(),
          // separaciuon entre cards
          SizedBox(height: 25.0,),
           _cardTipo2(),
           SizedBox(height: 25.0,),
           _cardTipo1(),
          // separaciuon entre cards
          SizedBox(height: 25.0,),
           _cardTipo2(),
           SizedBox(height: 25.0,),
           _cardTipo1(),
          // separaciuon entre cards
          SizedBox(height: 25.0,),
           _cardTipo2(),
           SizedBox(height: 25.0,),
           _cardTipo1(),
          // separaciuon entre cards
          SizedBox(height: 25.0,),
           _cardTipo2(),
           SizedBox(height: 25.0,),
        ],
      ),
    );
  }

 Widget _cardTipo1() {
   return Card(
     // sombras de las tarjetas
     elevation: 5.0,
     //
     shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(25.0) ) ,
     child: Column(
       children: <Widget>[
         ListTile(
           leading: Icon(Icons.photo_album,color: Colors.blue,),
           title: Text('Soy el Titulo'),
           subtitle: Text('Si estas experimentando con un cambio de código es muy probable que quieras comentar y descomentar bloques de código de acuerdo a tus necesidades.'),

        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[

            FlatButton(
              child: Text('Cancelar'),
              color: Colors.red,
              textColor: Colors.white,
              padding: EdgeInsets.all(8.0),
              shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(25.0) ) ,
              onPressed: (){},
            ),
            Divider(),
            FlatButton(
              child: Text('Ok'),
              color: Colors.blue,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              // para pisicionar el text del boton
              padding: EdgeInsetsDirectional.only(end: 0),
              splashColor: Colors.blueAccent,
              shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(25.0) ) ,
              onPressed: (){},
            ),
          ],
        )
       ],
     ),
   );
 }

  Widget  _cardTipo2() {

    final card =   Container(
      //clipBehavior: Clip.antiAlias,
      // para adapte al contenido de la tarjeta
      child: Column(
        children: <Widget>[
          FadeInImage(
            image:NetworkImage('https://image.shutterstock.com/z/stock-photo-colorful-hot-air-balloons-flying-over-mountain-at-dot-inthanon-in-chiang-mai-thailand-1033306540.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 200.0,
            fit: BoxFit.cover,
          ), 
            
          //  otra  forma
          /* Image(
            image: NetworkImage('https://image.shutterstock.com/z/stock-photo-colorful-hot-air-balloons-flying-over-mountain-at-dot-inthanon-in-chiang-mai-thailand-1033306540.jpg'),
          ), */
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('No tezczxc zczxc zxc xzc'),
           
          ),
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color : Colors.white,
        // par tomar foma redondeado
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            // radios de boxShadow
            blurRadius: 10.0, 
            //que tanto se  estiende
            spreadRadius: 2.0,
            // es par mover como en plano cartesino
            offset: Offset(2.0, 10.0)
          )
        ]
      ),
      // ClipRRect permite cortar cualquier cosa que se encuentre dentro  de la tarjeta
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: card,
      ),
    );


  }

  
}