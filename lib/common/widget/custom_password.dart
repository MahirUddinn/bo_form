import 'package:bo_acc_form/common/constants/app_ui_const.dart';
import 'package:flutter/material.dart';

class CustomPasswordField extends StatefulWidget {
  final String label;
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final bool isRequired;

  const CustomPasswordField({
    super.key,
    this.label = "",
    required this.hintText,
    this.controller,
    this.validator,
    this.onSaved,
    this.isRequired = false,
  });

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppUiWidgets.verticalSpacing6,
        AppUiWidgets.fieldLabel(
          context,
          label: widget.label,
          isRequired: widget.isRequired,
        ),
        AppUiWidgets.verticalSpacing6,
        Container(
          padding: EdgeInsets.symmetric(vertical: 2),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(14)),

          child: TextFormField(
            controller: widget.controller,
            obscureText: _isObscure,
            validator: widget.validator,
            onSaved: widget.onSaved,
            decoration: InputDecoration(
              hintText: widget.hintText,
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

              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
                child: Icon(
                  _isObscure ? Icons.visibility_off : Icons.visibility,
                  color: Theme.of(context).hintColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
