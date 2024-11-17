import 'package:flutter/material.dart';

class DrawerItemModel {
  DrawerItemModel(
      {required this.icon, required this.onTap, required this.text});

  final String text;
  final void Function() onTap;
  final IconData icon;
}
