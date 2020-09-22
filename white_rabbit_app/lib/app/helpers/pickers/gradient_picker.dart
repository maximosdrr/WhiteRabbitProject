import 'dart:ui';

import 'package:flutter/cupertino.dart';

class GradientPicker {
  static LinearGradient getGradient() {
    return new LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color.fromRGBO(54, 209, 220, 1),
          Color.fromRGBO(91, 134, 229, 1),
        ]);
  }
}
