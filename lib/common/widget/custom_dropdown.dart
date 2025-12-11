import 'package:bo_acc_form/common/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:bo_acc_form/common/constants/app_ui_widgets.dart';


class CustomDropdown extends StatelessWidget {
  final String labelText;
  final String hintText;
  final List<String> values;
  final String? selectedValue;
  final void Function(String?) onChanged;
  final String? Function(String?)? validator;
  final bool isRequired;

  const CustomDropdown({
    super.key,
    this.labelText = "",
    required this.hintText,
    required this.values,
    required this.onChanged,
    this.selectedValue,
    this.validator,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: AppSizes.mp6,),
        AppUiWidgets.fieldLabel(
          context,
          label: labelText,
          isRequired: isRequired,
        ),
        SizedBox(height: AppSizes.mp6,),

        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(AppSizes.br12)),
          child: DropdownButtonFormField<String>(
            initialValue: selectedValue,
            validator: validator,
            dropdownColor: Theme.of(context).cardColor,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: AppUiWidgets.hintTextStyle(context),
              filled: true,
              fillColor: Theme.of(context).cardColor,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.br12),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  width: AppSizes.borderZeroWidth,
                  style: BorderStyle.none,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.br12),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),

              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.br12),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.error,
                  width: AppSizes.borderZeroWidth,
                  style: BorderStyle.none,
                ),
              ),

              contentPadding: EdgeInsets.symmetric(
                horizontal: AppSizes.mp12,
                vertical: AppSizes.mp16,
              ),
            ),

            icon: Icon(
              Icons.keyboard_arrow_down_sharp,
              color: Theme.of(context).hintColor,
              size: AppSizes.dateIconSize,
            ),

            items: values.map((value) {
              return DropdownMenuItem(
                value: value,
                child: Text(value, style: TextStyle(fontSize: AppSizes.fs15)),
              );
            }).toList(),

            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
