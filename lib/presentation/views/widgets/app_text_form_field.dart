import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField(
      {super.key,
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
      this.textStyle, this.suffixIconColor, this.filled, this.onChanged});

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
  final void Function(String)? onChanged;
  final Color? prefixIconColor;
  final Color? suffixIconColor;
  final Color? fillColor;
  final double? radius;
  final TextStyle? textStyle;
  final bool? filled;
  

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      readOnly: readOnly,
      onTap: onTap,
      onChanged: onChanged,
      controller: controller,
      maxLines: maxLines,
      inputFormatters: <TextInputFormatter>[
        if (inputType == TextInputType.number && digitsOnly) ...[
          FilteringTextInputFormatter.digitsOnly
        ],
      ],
      decoration: InputDecoration(
        filled: filled,
        fillColor: fillColor,
        focusColor: Theme.of(context).primaryColor,
        hintText: hint,
        hintStyle: Theme.of(context).textTheme.labelMedium?.copyWith(color: Theme.of(context).colorScheme.outlineVariant),
        suffixIcon: suffixIcon,
        suffixIconColor: suffixIconColor ?? Theme.of(context).colorScheme.outlineVariant,
        prefixIcon: prefixIcon,
        prefixIconColor: prefixIconColor ?? Theme.of(context).colorScheme.outlineVariant,
        iconColor: Theme.of(context).primaryColor
      ),
      obscureText: obscureText,
      keyboardType: inputType,
      maxLength: maxLength,
      validator: validator,
      style: Theme.of(context).textTheme.labelMedium,
      textInputAction: inputAction,
      onFieldSubmitted: onFieldSubmitted,
      autovalidateMode:
          autoValidate ? AutovalidateMode.onUserInteraction : null,
    );
  }
}
