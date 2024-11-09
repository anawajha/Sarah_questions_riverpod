import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sarahah_questions/app/extensions/num.dart';

class AppCodeTextField extends StatelessWidget {
  const AppCodeTextField(
      {super.key,
      this.isFirst = false,
      this.isLast = false,
      required this.controller,
      this.onFinish});

  final bool isFirst;
  final bool isLast;
  final TextEditingController controller;
  final void Function()? onFinish;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: TextFormField(
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      controller: controller,
      autofocus: isFirst,
      onChanged: (txt) {
        if (txt.isNotEmpty && !isLast) {
          Focus.of(context).nextFocus();
        } else if (txt.isNotEmpty && isLast) {
          onFinish?.call();
        } else if (txt.isEmpty && !isFirst) {
          Focus.of(context).previousFocus();
        }
      },
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderRadius: 8.radius, borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
            borderRadius: 8.radius,
            borderSide: BorderSide(color: Theme.of(context).primaryColor)),
        isDense: true,
        filled: true,
        fillColor: Theme.of(context).colorScheme.outline.withOpacity(0.4),
        focusColor: Theme.of(context).primaryColor,
      ),
      keyboardType: TextInputType.number,
      maxLength: 1,
      style: Theme.of(context)
          .textTheme
          .headlineSmall
          ?.copyWith(fontWeight: FontWeight.w700),
    ));
  }
}
