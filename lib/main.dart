//mateAp y inteer te genera toso el codigo


import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:componentes/src/routes/routes.dart';

// import 'package:componentes/src/pages/home_page.dart';
 import 'package:componentes/src/pages/alert_page.dart';
// import 'package:componentes/src/pages/avatar_page.dart';
// import 'package:componentes/src/pages/home_temp.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes App',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,    
      ],
       supportedLocales: [
        const Locale('en'), // English
        const Locale('es'), // Hebrew
        const Locale.fromSubtags(languageCode: 'zh'), // Chinese *See Advanced Locales below*
        // ... other locales the app supports
      ],
      // home:  HomePage(),
      initialRoute: '/',
      // Rutas => con pocas rutas  ??> si son varios rutas revisar el archivo routes
     // SEGUNDA FORMA DE HACER RUTAS
     routes: getApliactionRoutes(),

     // PRIMERA  FORMA DE HACER RUTAS
     /*  routes: <String,WidgetBuilder>{
        '/'      : (BuildContext context) => HomePage(),
        'alert'  : (BuildContext context) => AlertPage(),
        'avatar' : (BuildContext context) => AvatarPage(),

      }, */
      // genera una ruta  dinamica por defecto
      onGenerateRoute: (RouteSettings setting){

        print('Ruta llamada : ${setting.name}');

        return MaterialPageRoute(
          builder: (BuildContext context ) => AlertPage() 
        );
      },

    );
  }
}