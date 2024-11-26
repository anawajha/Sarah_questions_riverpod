import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:sarahah_questions/app/config/constance.dart';
import 'package:sarahah_questions/app/theme/color_manager.dart';

// ignore: non_constant_identifier_names
GetSnackBar AppSnackBar ({required String body, Color? backgroundColor, Color? textColor, String? icon}){
   
    return GetSnackBar(
        snackPosition: SnackPosition.TOP,
        icon: icon == null
            ? null
            : SvgPicture.asset(
                icon,
                width: 20,
                height: 20,
              ),
        backgroundColor: backgroundColor ?? const Color(0xFF303030),
        duration: const Duration(milliseconds: 2500),
        borderRadius: 20,
        margin: EdgeInsets.symmetric(
            horizontal: 12, vertical: 12),
        padding: EdgeInsets.symmetric(
            horizontal: 32, vertical: 16),
        messageText: Text(
          body,
          maxLines: 2,
          style: TextStyle(
              color: textColor ?? ColorManager().onPrimary,
              fontFamily: Constants().font),
        ),
      );
}