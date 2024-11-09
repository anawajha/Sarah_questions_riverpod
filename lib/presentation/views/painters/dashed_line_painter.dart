
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:sarahah_questions/app/theme/color_manager.dart';

class DashedLinePainter extends CustomPainter {
  DashedLinePainter({this.horizontal = true, this.color});
  final ui.Color? color;
  final bool horizontal;
  
  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 9, dashSpace = 5, startX = 0;
    final paint = ui.Paint()
      ..color = color ?? ColorManager().outlineVariant
      ..strokeWidth = 1;

      if(horizontal){
            while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
    }else{
          while (startX < size.height) {
      canvas.drawLine(Offset(0, startX), Offset(0, startX + dashWidth), paint);
      startX += dashWidth + dashSpace;
    }
      }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}