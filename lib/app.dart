import 'package:flutter/material.dart';
import 'home.dart';
import 'login.dart';
import 'colors.dart';
import 'backdrop.dart';
import 'category_menu_page.dart';

import 'supplemental/cut_corners_border.dart';
import 'model/product.dart';

final ThemeData _kShrineTheme = _buildShrineTheme("blue");

class InsaneApp extends StatefulWidget {
  static String colorMode = "";

  @override
  _InsaneAppState createState() {
    return new _InsaneAppState();
  }
}

class _InsaneAppState extends State<InsaneApp> {
  Category _currentCategory = Category.all;

  void _onCategoryTap(Category category) {
    setState(() {
      _currentCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Insane',
      home: Backdrop(
        currentCategory: _currentCategory,
        frontLayer: HomePage(category: _currentCategory),
        backLayer: CategoryMenuPage(
          currentCategory: _currentCategory,
          onCategoryTap: _onCategoryTap,
        ),
        // TODO Make Nighmode logic working properly
        frontTitle: Text('InsanEcommerce'),
        backTitle: Text('MENU'),
      ),
      initialRoute: '/login',
      onGenerateRoute: _getRoute,
      theme: _kShrineTheme,
    );
  }

  Route<dynamic> _getRoute(RouteSettings settings) {
    if (settings.name != '/login') {
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
  Color fontColor;

  if (color == "blue") {
    InsaneApp.colorMode = "dayMode";
    fontColor = kShrineBrown900;

    return base.copyWith(
      accentColor: kShrineIndigo900,
      primaryColor: kShrineBlue100,
      buttonTheme: base.buttonTheme.copyWith(
        buttonColor: kShrineBlue100,
        textTheme: ButtonTextTheme.normal,
      ),
      primaryIconTheme: base.iconTheme.copyWith(color: kShrineBrown900),
      inputDecorationTheme: InputDecorationTheme(
        border: CutCornersBorder(),
      ),
      scaffoldBackgroundColor: kShrineBackgroundWhite,
      cardColor: kShrineBackgroundWhite,
      textSelectionColor: kShrineBlue100,
      errorColor: kShrineErrorIndigo,
      textTheme: _buildShrineTextTheme(base.textTheme, fontColor),
      primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme, fontColor),
      accentTextTheme: _buildShrineTextTheme(base.accentTextTheme, fontColor),
    );
  }
  if (color == "yellow") {
    InsaneApp.colorMode = "nightMode";
    final ThemeData baseDark = ThemeData.dark();
    fontColor = kShrineBackgroundWhite;

    return baseDark.copyWith(
      accentColor: kShrineAltDarkGrey,
      primaryColor: kShrineAltDarkGrey,
      buttonColor: kShrineAltYellow,
      scaffoldBackgroundColor: kShrineAltDarkGrey,
      cardColor: kShrineAltDarkGrey,
      textSelectionColor: kShrinePink100,
      errorColor: kShrineErrorRed,
      textTheme: _buildShrineTextTheme(baseDark.textTheme, fontColor),
      primaryTextTheme:
          _buildShrineTextTheme(baseDark.primaryTextTheme, fontColor),
      accentTextTheme:
          _buildShrineTextTheme(baseDark.accentTextTheme, fontColor),
      primaryIconTheme: base.iconTheme.copyWith(color: kShrineAltYellow),
      inputDecorationTheme: InputDecorationTheme(
        border: CutCornersBorder(),
      ),
    );
  } else {
    InsaneApp.colorMode = "dayMode";

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

TextTheme _buildShrineTextTheme(TextTheme base, Color fontColor) {
  return base
      .copyWith(
        headline: base.headline.copyWith(
          fontWeight: FontWeight.w500,
        ),
        title: base.title.copyWith(fontSize: 18.0),
        caption: base.caption.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
      )
      .apply(
        fontFamily: 'Rubik',
        displayColor: fontColor,
        bodyColor: fontColor,
      );
}