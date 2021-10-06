import 'package:flutter/material.dart';

const double BASE_DESIGN_WIDTH = 375.0;
const double BASE_DESIGN_HEIGHT = 811.0;

double? _screenWidth;
double? _screenHeight;

void setScreenSize(BuildContext context) {
  _screenWidth = MediaQuery.of(context).size.width;
  _screenHeight = MediaQuery.of(context).size.height;
}

double getWidth(double width) {
  final target =
      width * ((_screenWidth ?? BASE_DESIGN_WIDTH) / BASE_DESIGN_WIDTH);
  return target;
}

double getHeight(double height) {
  final target =
      height * ((_screenHeight ?? BASE_DESIGN_HEIGHT) / BASE_DESIGN_HEIGHT);
  return target;
}
