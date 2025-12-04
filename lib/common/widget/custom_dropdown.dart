import 'package:bo_acc_form/common/constants/app_ui_const.dart';
import 'package:flutter/material.dart';

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
        AppUiWidgets.verticalSpacing6,
        AppUiWidgets.fieldLabel(
          context,
          label: labelText,
          isRequired: isRequired,
        ),
        AppUiWidgets.verticalSpacing6,

        Container(
          padding: EdgeInsets.symmetric(vertical: 2),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(14)),

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
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.error,
                  width: 1,
                ),
              ),

              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.error,
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),

              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
            ),

            icon: Icon(
              Icons.keyboard_arrow_down_sharp,
              color: Theme.of(context).hintColor,
              size: 30,
            ),

            items: values.map((value) {
              return DropdownMenuItem(
                value: value,
                child: Text(value, style: TextStyle(fontSize: 15)),
              );
            }).toList(),

            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
