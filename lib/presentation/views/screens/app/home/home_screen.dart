import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sarahah_questions/app/extensions/num.dart';
import 'package:sarahah_questions/app/localization/trans_manager.dart';
import 'package:sarahah_questions/app/router/routes.dart';
import 'package:sarahah_questions/presentation/views/screens/app/home/widgets/app_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(TransManager.appName.tr), actions: [IconButton(onPressed: (){}, icon: Icon(Iconsax.moon))]),
      body: ListView.separated(
        padding: 20.padding,
        itemBuilder: (context, index) => Material(
          clipBehavior: Clip.antiAlias,
          elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: 8.radius,
          side: BorderSide(width: 0.5, color: Theme.of(context).colorScheme.secondary)
        ),
        child: InkWell(
          onTap: () => Get.toNamed(Routes.questions),
          child: Padding(padding: 12.padding, child: Text(
                'Category Title',
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center),),
        ),
      )
      , separatorBuilder: (context, index) => 12.spaceY, itemCount: 4),
      drawer: AppDrawer(),
    );
  }
}
