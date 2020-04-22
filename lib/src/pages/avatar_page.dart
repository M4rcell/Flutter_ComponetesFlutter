

import 'package:flutter/material.dart';

//stles 
class AvatarPage  extends StatelessWidget {

  static final pageName='avatar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
         Container(
           padding: EdgeInsets.all(5.0),
           child: CircleAvatar(        
            backgroundImage: NetworkImage('https://images.vexels.com/media/users/3/145908/preview2/52eabf633ca6414e60a7677b0b917d92-creador-de-avatar-masculino.jpg'),
            radius: 25.0,
          ),
         ),
         
          Container(
            margin: EdgeInsets.only(
              right:10.0 ),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.brown,
              
            ),
          )
        ],
      ),

      body: Center(
        child: FadeInImage(
          image: NetworkImage('https://images.vexels.com/media/users/3/145908/preview2/52eabf633ca6414e60a7677b0b917d92-creador-de-avatar-masculino.jpg'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
      
    );
  }
}
