import 'package:flutter/material.dart';

class Clickable extends StatelessWidget {
  const Clickable(
      {super.key, required this.child, this.onClilc, this.color, this.radius});
  final Widget child;
  final void Function()? onClilc;
  final Color? color;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // overlayColor: MaterialStateProperty.all<Color?>(color ??
      //     Theme.of(context).colorScheme.primaryContainer.withOpacity(0.7)),
      borderRadius: BorderRadius.circular(radius ?? 12),
      onTap: onClilc,
      child: child,
    );
  }
}
