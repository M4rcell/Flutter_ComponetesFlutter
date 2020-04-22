

import 'package:flutter/material.dart';

import 'dart:async';  


class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  // controlador de scroll permite controlar  el  scroll
  ScrollController _scrollController = new ScrollController();


  List<int> _listaNumeros = new List() ;

  int _ultimoItem = 0;

  bool _isLoading = false;

// se  ejecutar al momento de entrar al widget
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _agregar10();


    _scrollController.addListener((){
      //print('SCROLL !!!!!::');
      
      //evalua en que posicion pixeles estas 
      //cuando estas en la final llmas al metodo agregar10()
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        //
        //_agregar10();
        //tiempo de cargar 2s al momento de add image

        fecthData();

  
      }

    });
  }

  // distruir scroll controles despues de no utilizalas
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Listas') ,
        ),
     // stack lo que hace colocar encima de uno a otro
      body:Stack(
        children: <Widget>[
          _crearLista(),
          _craerLoading(),
        ],
        ) 
      
    );
  }

  Widget _crearLista(){

    return RefreshIndicator(
        onRefresh:optenerPagina1 ,
        child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        // builder = es la forma como se a dibujar 
        itemBuilder:(BuildContext context, int index){

          final imagen = _listaNumeros[index];

          return FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage('https://picsum.photos/500/300?image=$imagen')
            );
 
        } ,

        ),
    );

  }

  Future <Null> optenerPagina1() async{

    final duration = new Duration(seconds: 2);

    new Timer(duration, (){

      _listaNumeros.clear();
      _ultimoItem++;
      _agregar10();

    });

    return Future.delayed(duration);

  }

  void _agregar10(){

    for (var i = 0; i < 10; i++) {

      _ultimoItem++;

    _listaNumeros .add(_ultimoItem);
     
      setState(() {
        
      });
    }

  }
  Future<Null> fecthData()async{
   
   _isLoading = true;

   setState(() {
     
   });


  final duration = new Duration(seconds: 2);

  return  new Timer(duration, respuestaHTTP);

  }

  void respuestaHTTP(){

    _isLoading = false;

    _scrollController.animateTo(
      _scrollController.position.pixels +100,
      duration: Duration(milliseconds: 250),
      curve: Curves.fastOutSlowIn,
    );

    _agregar10();


  }

  Widget _craerLoading(){

    if (_isLoading) {
      
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          // loandin en el medio

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

           CircularProgressIndicator()

            ],
          ),

          SizedBox(height: 15.0,)

        ],
      );
      
      

    } else {

      return Container();
    }
  }
}