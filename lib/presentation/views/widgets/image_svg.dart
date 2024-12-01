import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ImageSvg extends StatelessWidget {
  const ImageSvg(this.path, 
      {super.key, this.color, this.width, this.height, this.colored = true});

  final String path;
  final Color? color;
  final double? width;
  final double? height;
  final bool colored;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(path,
        width: width,
        height: height,
        colorFilter: colored ? ColorFilter.mode(
            color ?? Theme.of(context).colorScheme.onSurface,
            BlendMode.srcIn) : null);
  }
}
