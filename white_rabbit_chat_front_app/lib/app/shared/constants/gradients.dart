import 'package:flutter/material.dart';

class GradientPicker {
  static LinearGradient getGreenGradient() => LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color.fromRGBO(86, 171, 47, 0),
          Color.fromRGBO(168, 224, 99, 1),
        ],
      );
}
