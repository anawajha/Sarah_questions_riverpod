import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SecondaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SecondaryAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(title),
        titleTextStyle: Theme.of(context)
            .textTheme
            .headlineSmall
            ?.copyWith(fontWeight: FontWeight.w500),
        elevation: 0,
        leading: Navigator.of(context).canPop()
            ? IconButton(
                onPressed: () => Get.back(),
                color: Theme.of(context).colorScheme.onSurface,
                icon: Transform.flip(
                    flipX: Directionality.of(context) == TextDirection.rtl,
                    child: const Icon(Iconsax.arrow_square_left))) : null,
            );
            // icon: Icon(Directionality.of(context) == TextDirection.ltr
            //     ? Iconsax.arrow_square_left
            //     : Iconsax.arrow_square_right
            //     )
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
