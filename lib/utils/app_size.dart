import 'package:flutter/material.dart';

double height = 0.0;
double width = 0.0;

extension AppSize on int {
  SizedBox getH() => SizedBox(height: (this / 812) * height);
  SizedBox getW() => SizedBox(width: (this / 375) * width);
}
