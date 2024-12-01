import 'package:flutter/material.dart';
import 'package:sarahah_questions/presentation/views/widgets/loading_shimmer/sliding_gradient_transform.dart';

class Shimmer extends StatefulWidget {
  static ShimmerState? of(BuildContext context) {
    return context.findAncestorStateOfType<ShimmerState>();
  }

  const Shimmer({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  ShimmerState createState() => ShimmerState();
}

class ShimmerState extends State<Shimmer> with SingleTickerProviderStateMixin {
  LinearGradient get gradient => LinearGradient(
        colors: _linearGradient.colors,
        stops: _linearGradient.stops,
        begin: _linearGradient.begin,
        end: _linearGradient.end,
        transform:
            SlidingGradientTransform(slidePercent: _shimmerController.value),
      );

  late AnimationController _shimmerController;
  late LinearGradient _linearGradient;

  Listenable get shimmerChanges => _shimmerController;

  @override
  void initState() {
    super.initState();

    _shimmerController = AnimationController.unbounded(vsync: this)
      ..repeat(min: -0.5, max: 1.5, period: const Duration(milliseconds: 1200));
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    super.dispose();
  }

  bool get isSized =>
      (context.findRenderObject() as RenderBox?)?.hasSize ?? false;

  Size get size => (context.findRenderObject() as RenderBox).size;

  Offset getDescendantOffset({
    required RenderBox descendant,
    Offset offset = Offset.zero,
  }) {
    final shimmerBox = context.findRenderObject() as RenderBox;
    return descendant.localToGlobal(offset, ancestor: shimmerBox);
  }

  @override
  Widget build(BuildContext context) {
    _linearGradient = LinearGradient(
      colors: [
        const Color(0xFFEBEBF4).withOpacity(0.95),
        Theme.of(this.context).colorScheme.surface.withOpacity(0.95),
        const Color(0xFFEBEBF4).withOpacity(0.9),
      ],
      stops: const [
        0.1,
        0.3,
        0.4,
      ],
      begin: const Alignment(-1.0, -0.3),
      end: const Alignment(1.0, 0.3),
      tileMode: TileMode.clamp,
    );
    return widget.child ?? const SizedBox();
  }
}
