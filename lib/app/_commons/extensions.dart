import 'package:flutter/material.dart';

extension WidgetExtensions on Widget {
  Widget paddingOnly({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) =>
      Padding(padding: EdgeInsets.only(top: top, left: left, right: right, bottom: bottom), child: this);

  Widget paddingAll(double value) => Padding(padding: EdgeInsets.all(value), child: this);

  Widget borderRadius(double radius) => ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        child: this,
      );
}
