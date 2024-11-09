import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sarahah_questions/app/extensions/num.dart';
import 'package:sarahah_questions/app/localization/trans_manager.dart';
import 'package:sarahah_questions/presentation/views/widgets/loading.dart';

class DropDownLabeledTextField extends StatelessWidget {
  const DropDownLabeledTextField(
      {required this.controller,
      required this.label,
      this.errorText,
      this.prefixIcon,
      this.onTap,
      this.loading = false,
      this.hint,
      super.key,
      this.iconColor,
      required this.items,
      this.onSelect,
      this.initialSelection,
      required this.width});

  final String label;
  final TextEditingController controller;
  final String? errorText;
  final void Function(dynamic)? onSelect;
  final IconData? prefixIcon;
  final void Function()? onTap;
  final String? hint;
  final Color? iconColor;
  final List<DropdownMenuEntry> items;
  final bool loading;
  final dynamic initialSelection;
  final double width;

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
        DropdownMenu(
            key: UniqueKey(),
            controller: controller,
            hintText: hint,
            initialSelection: initialSelection,
            width: width,
            onSelected: onSelect,
            errorText: errorText,
            leadingIcon: Icon(prefixIcon,
                color: Theme.of(context).colorScheme.outlineVariant),
            textStyle: Theme.of(context).textTheme.labelMedium,
            trailingIcon: Icon(Icons.arrow_drop_down,
                color: Theme.of(context).colorScheme.outlineVariant),
            selectedTrailingIcon: Icon(Icons.arrow_drop_up,
                color: Theme.of(context).colorScheme.outlineVariant),
            dropdownMenuEntries: loading
                ? [
                    const DropdownMenuEntry(
                        value: 0, label: '', leadingIcon: Loading())
                  ]
                : (items.isNotEmpty
                    ? items
                    : [
                        DropdownMenuEntry(
                            value: 0,
                            label: TransManager.thereIsNoOptionsFound.tr,
                            enabled: false)
                      ]),
            inputDecorationTheme: InputDecorationTheme(
                isDense: true,
                hintStyle: Theme.of(context).textTheme.labelMedium?.copyWith(color: Theme.of(context).colorScheme.outlineVariant),
                suffixIconColor: Theme.of(context).colorScheme.outlineVariant,
                iconColor: Theme.of(context).colorScheme.outlineVariant))
      ],
    );
  }
}
