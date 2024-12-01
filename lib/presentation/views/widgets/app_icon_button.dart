import 'package:flutter/material.dart';
import 'package:sarahah_questions/app/extensions/num.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.color,
    this.size = 24,
    this.padding = 4,
    this.iconColor,
    this.elevation = 0,
  });

  final IconData icon;
  final void Function()? onPressed;
  final Color? iconColor;
  final Color? color;
  final double size;
  final double padding;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: size,
        ),
        style: IconButton.styleFrom(
            padding: padding.padding,
            backgroundColor: color ?? Theme.of(context).colorScheme.surface,
            elevation: elevation,
            shadowColor:
                Theme.of(context).colorScheme.onSurface.withOpacity(0.4),
            foregroundColor:
                iconColor ?? Theme.of(context).colorScheme.onSurface));
  }
}
