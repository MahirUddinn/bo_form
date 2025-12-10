import 'package:flutter/material.dart';
import 'package:bo_acc_form/common/constants/app_sizes.dart';

class AppUiWidgets {
  static Widget fieldLabel(
    BuildContext context, {
    required String label,
    bool isRequired = false,
  }) {
    if (label.isEmpty) return Container();

    return RichText(
      text: TextSpan(
        text: label,
        style: TextStyle(
          fontSize: AppSizes.fs15,
          fontWeight: FontWeight.w600,
          color: Theme.of(context).textTheme.bodyLarge?.color,
        ),
        children: [
          if (isRequired)
            TextSpan(
              text: " *",
              style: TextStyle(color: Colors.red),
            ),
        ],
      ),
    );
  }

  static TextStyle errorTextStyle(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.error,
      fontSize: AppSizes.fs12,
    );
  }

  static TextStyle hintTextStyle(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).hintColor,
      fontSize: AppSizes.fs15,
    );
  }

  static InputDecoration standardInputDecoration(
    BuildContext context, {
    required String hintText,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: hintTextStyle(context),
      filled: true,
      fillColor: Theme.of(context).cardColor,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(AppSizes.br12),
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: AppSizes.mp12,
        vertical: AppSizes.mp16,
      ),
    );
  }

  static TextStyle sectionTitleStyle({
    double fontSize = AppSizes.fs15,
    FontWeight fontWeight = FontWeight.bold,
  }) {
    return TextStyle(fontSize: fontSize, fontWeight: fontWeight);
  }

  static BoxDecoration roundedContainerDecoration(BuildContext context) {
    return BoxDecoration(borderRadius: BorderRadius.circular(AppSizes.mp16));
  }
}
