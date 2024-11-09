import 'package:sarahah_questions/app/config/constance.dart';
import 'package:sarahah_questions/app/theme/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';

class AppUtils{
  //create singleton
  static final AppUtils _instance = AppUtils._internal();
  AppUtils._internal();
  factory AppUtils() => _instance;

  screenUtil(BuildContext context) {
    ScreenUtil.init(context,
        minTextAdapt: true, designSize: Constants().designSize);
  }


  mainSnack({String? title, required String body, Color? backgroundColor}) {
    Get.showSnackbar( 
      GetSnackBar(
        backgroundColor: backgroundColor ?? const Color(0xFF303030),
        duration: const Duration(seconds: 2),
        borderRadius: 10,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        messageText: Text(body, maxLines: 2, style: TextStyle(color: ColorManager().background),),
      ),
    );
  }


  snackSuccess({String? title, required String body}) {
    mainSnack(body: body, backgroundColor: ColorManager().success);
  }

  snackError({String? title, required String body}) {
    mainSnack(body: body, backgroundColor: ColorManager().error);
  }

  Future<Uint8List> getBytesFromAsset(String path, num width) async {
    final data = await rootBundle.load(path);
    final codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width.toInt(), targetHeight: width.toInt());
    final fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }
}