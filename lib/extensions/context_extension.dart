import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double dynamicWidth(double value) {
    return MediaQuery.of(this).size.width * (value/100);
  }

  double dynamicHeight(double value) {
    return MediaQuery.of(this).size.height * (value/100);
  }
}
