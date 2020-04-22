

import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPage  createState() => _InputPage();
}

class _InputPage extends State<InputPage> { 

  String _nombre = ''; 
  String _email  = '';
  String _fecha  = '' ;


String _opcionSeleccionada ='Volar';
  List<String> _poderes = ['Volar','Rayos X','Super Aliento','Super Fuerza'];

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de texto'),
      ),
      body: ListView(
        // separacion de textfield
        padding: EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 10
        ),
        children: <Widget>[
          _crearInput(),
           Divider(),
          _crearEmail(),
           Divider(),
          _crearPassword(),
           Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropdown(),
           Divider(),
          _crearPersona(),
           Divider(),

        ],
      ),

      
    );
  }

  Widget _crearInput() {

    return  TextField(
      //autofocus: true,
      // pone en mayuscula al inicio de cada palabra
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        //TextField de forma BorderCicular
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
      //counterText:'Letras  ${_nombre.length}',
      hintText: 'Ingrese su nombre',
      labelText: 'Nombre',
      helperText: 'solo nombres',
      //icono dentro de textfield
      suffixIcon: Icon(Icons.accessibility),
      // icono fuera de textfield
      icon: Icon(Icons.account_circle,color: Colors.blue,)
      ),
      onChanged: (valor){
       
       setState(() {
          _nombre= valor;
       });
        
      },

    );
  

  }

    Widget _crearEmail() {

    return  TextField(
      keyboardType: TextInputType.emailAddress,
      //autofocus: true,
      // pone en mayuscula al inicio de cada palabra
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        //TextField de forma BorderCicular
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
      hintText: 'Ingrese su Email',
      labelText: 'Email',
      helperText: 'Email',
      //icono dentro de textfield
      suffixIcon: Icon(Icons.alternate_email),
      // icono fuera de textfield
      icon: Icon(Icons.email,color: Colors.blue,)
      ),
      onChanged: (valor) => setState(() {
          _email= valor;
       })

    );
  

  }  
 
  Widget _crearPassword() {

    return  TextField(
      obscureText: true,
      //autofocus: true,
      // pone en mayuscula al inicio de cada palabra
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        //TextField de forma BorderCicular
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
      hintText: 'Ingrese su Password',
      labelText: 'Password',
      helperText: 'Password',
      //icono dentro de textfield
      suffixIcon: Icon(Icons.lock_open),
      // icono fuera de textfield
      icon: Icon(Icons.lock,color: Colors.blue,)
      ),
      onChanged: (valor) => setState(() {
          _email= valor;
       })

    );
  

  }  

    Widget _crearFecha(BuildContext context) {

    return  TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
        //TextField de forma BorderCicular
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
      hintText: 'Fecha de Nacimiento',
      labelText: 'Fecha de Nacimiento',
      //icono dentro de textfield
      suffixIcon: Icon(Icons.perm_contact_calendar),
      // icono fuera de textfield
      icon: Icon(Icons.calendar_today,color: Colors.blue,)
      ),
      // sirve para lanzar el selector de fecha
      onTap:(){
        // eliminar Focus
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },

    );
  

  } 
  

  List<DropdownMenuItem<String>> getOpcionsDropdawn(){

    List<DropdownMenuItem<String>> lista = new List();

    //Agregar Elementos a la lista

    _poderes.forEach((poder){

      lista.add(DropdownMenuItem(
        //todo los elementos a mostrar mostrar el poder
        child: Text(poder),
        //mostrar poder
        value: poder,
      ));

    
    });

      return lista;


  }

  Widget _crearDropdown(){

    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0,),

        // para ver todo el ancho de la pantalla control + . = wrap with widget 
        Expanded(
            child: DropdownButton(
            value: _opcionSeleccionada,
            // llamar la lista a mostrar
            items: getOpcionsDropdawn(), 
            onChanged:(opt){

            setState(() {
            _opcionSeleccionada = opt;
            });
       
      }),
        )

      ],

    );
    
    
     

  }
  Widget _crearPersona(){

    return ListTile( 
      title: Text('Nombre es : $_nombre'),
      subtitle: Text('Email es : $_email'),
      trailing: Text(_opcionSeleccionada),
    );

  }

  _selectDate(BuildContext context) async{
    DateTime picked = await showDatePicker(

      context: context,
      initialDate: new DateTime.now(), 
      firstDate: new DateTime(2020), 
      lastDate: new DateTime(2025),
      locale: Locale('es','PE')

      );

    if (picked != null) {
       
       setState(() {

         _fecha = picked.toString();
         _inputFieldDateController.text=  _fecha;

       });
    }
  }
}