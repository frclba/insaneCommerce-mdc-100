import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'model/product.dart';

// TODO -> add velocity constant

class Backdrop extends StatefulWidget {
  final Category currentCategory;
  final Widget frontLayer;
  final Widget backLayer;
  final Widget frontTitle;
  final Widget backTitle;

  const Backdrop({
    @required this.currentCategory,
    @required this.frontLayer,
    @required this.backLayer,
    @required this.frontTitle,
    @required this.backTitle,
  }) : assert(currentCategory != null),
       assert(frontLayer != null),
       assert(backLayer != null),
       assert(frontTitle != null),
       assert(backTitle != null);

  @override
  _BackdropState createState() => _BackdropState();
}

// TODO: Add _FrontLayer class (104)
// TODO: Add _BackdropTitle class (104)
// TODO: Add _BackdropState class (104)