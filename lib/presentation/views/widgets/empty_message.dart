import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyMessage extends StatelessWidget {
  const EmptyMessage({super.key, required this.message, this.icon, this.withImage = true, this.mainAxisSize = MainAxisSize.max});

  final String message;
  final IconData? icon;
  final bool withImage;
  final MainAxisSize mainAxisSize;

  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: mainAxisSize,
      children: [
        if(withImage) ... [
        Icon(icon ?? Icons.assignment_outlined, size: 28.w, color: Theme.of(context).textTheme.bodyMedium?.color,),
        SizedBox(height: 20.h,),
        ],
        Text(message, style: Theme.of(context).textTheme.bodyMedium, maxLines: 3,)
      ],
    ),);
  }
}