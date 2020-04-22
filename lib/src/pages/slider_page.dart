
import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPage createState() => _SliderPage();
}

class _SliderPage extends State<SliderPage> {

  double _valorSlider = 100.0;

  bool _bloquearCheck = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
      ),
      body: Container(
        padding: EdgeInsets.only( top: 50.0),
        child: Column(
          children: <Widget>[
            crearSlider(),
            _checkBox(),
            _craerSwitch(),
          // para que use todo el espacio que tiene Expanded
            Expanded (
              child: craerImagen())
          ],
        ),

      ),
      
    );
  }


  Widget crearSlider(){

    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamañp de la imagen',
      divisions: 20,
      value: _valorSlider,
      min: 10.0,
      max: 400.0,
      // evaluar si el check es falso o verdadero
      // si el _bloquearCheck es verdadero debuelve null else check habilitado
      onChanged: (_bloquearCheck)? null: (valor){

       setState(() {
          _valorSlider= valor;
       });
        
      });

  }

  Widget _checkBox(){
    // return Checkbox(
    //   value: _bloquearCheck, 
    //   onChanged: (valor){

    //    setState(() {

    //      _bloquearCheck = valor;

    //    });
    //   },
    // ); 
  //OTRA FORMA DE HACER CHECK BOX PUDES HACER CHICK EN CUALQUIER PARTE

    return CheckboxListTile(
      title: Text('Bloquear Sliders'),
      value: _bloquearCheck , 
      onChanged:(valor){

       setState(() {

         _bloquearCheck = valor;

       });
      },
    );
  }
  
  Widget _craerSwitch(){

    return SwitchListTile(
      title: Text('Bloquear Switch'),
      value: _bloquearCheck , 
      onChanged:(valor){

       setState(() {

         _bloquearCheck = valor;

       });
      },
    );
  }
  

  Widget craerImagen(){

    return Image(
      
      image: NetworkImage('https://66.media.tumblr.com/tumblr_mdwcoiuddg1qea7tao1_500.jpg'),

      width: _valorSlider,
      // para que la imagen se vea bien
      fit: BoxFit.contain,
      );
  }
}