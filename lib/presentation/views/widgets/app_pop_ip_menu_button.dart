import 'package:flutter/material.dart';

class AppPopupMenuButton extends StatelessWidget {
  const AppPopupMenuButton({
    super.key,
    required this.items,
  });

  final List<PopupMenuEntry> items;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scaleX: 0.6,
      scaleY: 0.65,
      child: PopupMenuButton(
          padding: EdgeInsets.zero,
          icon: Icon(
            Icons.more_vert_rounded),
          itemBuilder: (context) => items),
    );
  }
}
