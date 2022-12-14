import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double paddingTop;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    var padding = MediaQuery.of(context).padding;
    paddingTop = padding.top;
  }
}
