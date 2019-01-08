import 'package:flutter/material.dart';
import 'home.dart';
import 'login.dart';


class InsaneApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Insane',
      home: HomePage(),
      initialRoute: '/login',
      onGenerateRoute: _getRoute,
    );
  }

  Route<dynamic> _getRoute(RouteSettings settings){
    if(settings.name != '/login'){
      return null;
    }
    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => LoginPage(),
      fullscreenDialog: true,
    );
  }
}
// TODO: Change home: to a Backdrop with a HomePage frontLayer (104)
// TODO: Make currentCategory field take _currentCategory (104)
// TODO: Pass _currentCategory for frontLayer (104)
// TODO: Change backLayer field value to CategoryMenuPage (104)
// TODO: Build a Shrine Theme (103)
// TODO: Build a Shrine Text Theme (103)
