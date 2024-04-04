import 'package:flutter/material.dart';

extension DynamicSize on BuildContext {
  double width(double width) {
    return MediaQuery.sizeOf(this).width * (width / 412);
  }

  double height(double height) {
    return MediaQuery.sizeOf(this).width * (height / 892);
  }
}
