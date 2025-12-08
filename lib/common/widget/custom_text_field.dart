import 'package:flutter/material.dart';
import 'package:bo_acc_form/common/constants/app_ui_widgets.dart';


class CustomTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final bool isObscure;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final TextEditingController? controller;
  final bool isRequired;
  final void Function(String)? onChanged;
  final FocusNode? focusNode;

  const CustomTextField({
    super.key,
    this.label = "",
    required this.hintText,
    this.isObscure = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onSaved,
    this.controller,
    this.isRequired = false,
    this.onChanged,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppUiWidgets.verticalSpacing6,
        AppUiWidgets.fieldLabel(context, label: label, isRequired: isRequired),
        AppUiWidgets.verticalSpacing6,

        Container(
          padding: EdgeInsets.symmetric(vertical: 2),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(14)),

          child: TextFormField(
            controller: controller,
            obscureText: isObscure,
            keyboardType: keyboardType,
            validator: validator,
            focusNode: focusNode,
            onSaved: onSaved,
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: AppUiWidgets.hintTextStyle(context),
              filled: true,
              fillColor: Theme.of(context).cardColor,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(12),
              ),

              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
