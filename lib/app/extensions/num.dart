import 'package:flutter/material.dart';

extension DoubleExtension on num{

  SizedBox get spaceX => SizedBox(width: toDouble());
  SizedBox get spaceY => SizedBox(height: toDouble(),);

  BorderRadius get radius => BorderRadius.circular(toDouble());
  BorderRadius get radiusBottom => BorderRadius.vertical(bottom : Radius.circular( toDouble()));
  BorderRadiusGeometry get radiusEnd => BorderRadiusDirectional.horizontal(end : Radius.circular( toDouble()));
  BorderRadius get radiusTop => BorderRadius.vertical(top : Radius.circular( toDouble()));

  EdgeInsetsGeometry get padding => EdgeInsets.all(toDouble());
  EdgeInsetsGeometry get paddingH => EdgeInsets.symmetric(horizontal: toDouble());
  EdgeInsetsGeometry get paddingV => EdgeInsets.symmetric(vertical: toDouble());
  EdgeInsets get paddingTop => EdgeInsets.only(top: toDouble());
  EdgeInsetsGeometry get paddingBottom => EdgeInsets.only(bottom: toDouble());
  EdgeInsetsGeometry get paddingStart => EdgeInsetsDirectional.only(start : toDouble());
}