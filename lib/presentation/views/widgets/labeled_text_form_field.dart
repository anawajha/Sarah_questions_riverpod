import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sarahah_questions/app/extensions/num.dart';
import 'package:sarahah_questions/presentation/views/widgets/app_text_form_field.dart';

class LabeledTextField extends StatelessWidget {
  const LabeledTextField({
    required this.controller,
    this.obscureText = false,
    this.maxLines = 1,
    this.validator,
    this.suffixIcon,
    this.readOnly = false,
    this.onTap,
    this.inputType,
    this.prefixIcon,
    this.maxLength,
    this.digitsOnly = false,
    this.autoValidate = false,
    this.hint,
    this.inputAction,
    this.onFieldSubmitted,
    this.prefixIconColor,
    this.fillColor,
    this.radius,
    this.textStyle,
    this.suffixIconColor,
    super.key,
    required this.label
  });

  final TextEditingController controller;
  final bool obscureText;
  final int maxLines;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool readOnly;
  final void Function()? onTap;
  final TextInputType? inputType;
  final int? maxLength;
  final bool digitsOnly;
  final String? hint;
  final bool autoValidate;
  final TextInputAction? inputAction;
  final void Function(String)? onFieldSubmitted;
  final Color? prefixIconColor;
  final Color? suffixIconColor;
  final Color? fillColor;
  final double? radius;
  final TextStyle? textStyle;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(start: 20.w),
          child: Text(
            label,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
        5.spaceY,
        AppTextFormField(
            controller: controller,
            autoValidate: autoValidate,
            digitsOnly: digitsOnly,
            fillColor: fillColor,
            hint: hint,
            inputAction: inputAction,
            inputType: inputType,
            maxLength: maxLength,
            maxLines: maxLines,
            obscureText: obscureText,
            onFieldSubmitted: onFieldSubmitted,
            onTap: onTap,
            prefixIcon: prefixIcon,
            prefixIconColor: prefixIconColor,
            radius: radius,
            readOnly: readOnly,
            suffixIcon: suffixIcon,
            suffixIconColor: suffixIconColor,
            textStyle: textStyle,
            validator: validator),
      ],
    );
  }
}
