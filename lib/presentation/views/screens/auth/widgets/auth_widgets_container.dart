import 'package:flutter/material.dart';
import 'package:sarahah_questions/app/extensions/num.dart';

class AuthWidgetsContainer extends StatelessWidget {
  const AuthWidgetsContainer({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: AlignmentDirectional.topCenter, children: [
      Container(
        padding: EdgeInsets.zero,
        margin: EdgeInsets.zero,
        height: 435,
        width: double.infinity,
        color: Theme.of(context).primaryColor,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            // Center(
            //     child: ImageSvg(SvgManager().logo,
            //         color: Theme.of(context).colorScheme.onPrimary,
            //         width: 174.w,
            //         height: 68.w)),
            // SvgPicture.asset(SvgManager().authHeaderBackground,
            //     width: double.infinity, height: 290.h, fit: BoxFit.cover)
          ],
        ),
      ),
      ListView(padding: EdgeInsets.symmetric(horizontal: 24),
       children: [
        // padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 331.h, bottom: 122.h),
        331.spaceY,
        Material(
          elevation: 5,
          borderRadius: 30.radius,
          color: Theme.of(context).colorScheme.surface,
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(
                top: 24, left: 34, right: 34, bottom: 48),
            children: children,
          ),
        ),
        122.spaceY
      ])
    ]);
  }
}
