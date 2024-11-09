import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension DoubleExtension on num{

  SizedBox get spaceX => SizedBox(width: toDouble().w,);
  SizedBox get spaceY => SizedBox(height: toDouble().h,);

  BorderRadius get radius => BorderRadius.circular(toDouble().r);
  BorderRadius get radiusBottom => BorderRadius.vertical(bottom : Radius.circular( toDouble().r));
  BorderRadiusGeometry get radiusEnd => BorderRadiusDirectional.horizontal(end : Radius.circular( toDouble().r));
  BorderRadius get radiusTop => BorderRadius.vertical(top : Radius.circular( toDouble().r));

  EdgeInsetsGeometry get padding => EdgeInsets.all(toDouble().w);
  EdgeInsetsGeometry get paddingH => EdgeInsets.symmetric(horizontal: toDouble().w);
  EdgeInsetsGeometry get paddingV => EdgeInsets.symmetric(vertical: toDouble().h);
  EdgeInsets get paddingTop => EdgeInsets.only(top: toDouble().h);
  EdgeInsetsGeometry get paddingBottom => EdgeInsets.only(bottom: toDouble().h);
  EdgeInsetsGeometry get paddingStart => EdgeInsetsDirectional.only(start : toDouble().w);
}