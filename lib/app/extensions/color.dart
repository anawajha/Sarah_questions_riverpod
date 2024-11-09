import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

extension ColorExtension on Color {

  SvgTheme get svgTheme => SvgTheme(currentColor: this);
  ColorFilter get svgColorFilter => ColorFilter.mode(this, BlendMode.srcIn);
}
