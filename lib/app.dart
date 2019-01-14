import 'package:flutter/material.dart';
import 'home.dart';
import 'login.dart';
import 'colors.dart';

final ThemeData _kShrineTheme = _buildShrineTheme("blue");

class InsaneApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Insane',
      home: HomePage(),
      initialRoute: '/login',
      onGenerateRoute: _getRoute,
      theme: _kShrineTheme,
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

ThemeData _buildShrineTheme(String color) {
  final ThemeData base = ThemeData.light();

  if (color == "blue") {
    return base.copyWith(
      accentColor: kShrineIndigo900,
      primaryColor: kShrineBlue100,
      buttonTheme: base.buttonTheme.copyWith(
        buttonColor: kShrineBlue100,
        textTheme: ButtonTextTheme.normal,
      ),
      primaryIconTheme: base.iconTheme.copyWith(
        color: kShrineBrown900
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(),
      ),
      scaffoldBackgroundColor: kShrineBackgroundWhite,
      cardColor: kShrineBackgroundWhite,
      textSelectionColor: kShrineBlue100,
      errorColor: kShrineErrorIndigo,
      textTheme: _buildShrineTextTheme(base.textTheme),
      primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
      accentTextTheme: _buildShrineTextTheme(base.accentTextTheme),
    );
  }
  else {
    return base.copyWith(
    accentColor: kShrineBrown900,
    primaryColor: kShrinePink100,
    buttonTheme: base.buttonTheme.copyWith(
      buttonColor: kShrinePink100,
      textTheme: ButtonTextTheme.normal,
    ),
    scaffoldBackgroundColor: kShrineBackgroundWhite,
    cardColor: kShrineBackgroundWhite,
    textSelectionColor: kShrinePink100,
    errorColor: kShrineErrorRed,
    );
  }
}

TextTheme _buildShrineTextTheme(TextTheme base) {
  return base.copyWith(
    headline: base.headline.copyWith(
      fontWeight: FontWeight.w500,
    ),
    title: base.title.copyWith(
      fontSize: 18.0
    ),
    caption: base.caption.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
    ),
  ).apply(
    fontFamily: 'Rubik',
    displayColor: kShrineBrown900,
    bodyColor: kShrineBrown900,
  );
}

// TODO: Change home: to a Backdrop with a HomePage frontLayer (104)
// TODO: Make currentCategory field take _currentCategory (104)
// TODO: Pass _currentCategory for frontLayer (104)
// TODO: Change backLayer field value to CategoryMenuPage (104)
// TODO: Build a Shrine Theme (103)
// TODO: Build a Shrine Text Theme (103)
