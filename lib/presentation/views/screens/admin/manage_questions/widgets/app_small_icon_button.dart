
import 'package:flutter/material.dart';
import 'package:sarahah_questions/app/extensions/num.dart';

class AppSmallIconButton extends StatelessWidget {
  const AppSmallIconButton({
    super.key, required this.icon, required this.onTap,
  });

  final IconData icon;
  final void Function() onTap;


  @override
  Widget build(BuildContext context) {
    return Material(
      shape: CircleBorder(),
      clipBehavior: Clip.antiAlias,
       child: InkWell(onTap: onTap, radius: 100,
    borderRadius: double.infinity.radius, child: Padding(
      padding: 4.padding,
      child: Icon(icon, size: 12),
    ),
    ));
  }
}