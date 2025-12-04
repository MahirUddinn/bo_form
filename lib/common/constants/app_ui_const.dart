import 'package:flutter/material.dart';

class AppUiColors {
  static const Color primaryColor = Color(0xFF3B60EC);
  static const Color scaffoldBackgroundColorLight = Color(0xFFEDEDED);
  static const Color scaffoldBackgroundColorDark = Color(0xFF121212);

  static const Color appBarBackgroundColorLight = Color(0xFFE0E0E0);
  static const Color appBarBackgroundColorDark = Color(0xFF1E1E1E);

  static const Color cardColorLight = Colors.white;
  static const Color cardColorDark = Color(0xFF1E1E1E);

  static const Color inputFillColorLight = Colors.white;
  static const Color inputFillColorDark = Color(0xFF1E1E1E);
  static const Color inputBorderColorDark = Color(0xFF343434);

  static const Color disabledColorLight = Color(0xFFBDBDBD);
  static const Color disabledColorDark = Color(0xFF424242);

  static const Color hintColor = Colors.grey;
  static const Color errorColor = Colors.red;
  static const Color successColor = Color(0xFF01D3B8);

  static const Color black = Colors.black;
  static const Color white = Colors.white;
}

class AppUiWidgets {
  // Common spacing
  static const SizedBox verticalSpacing2 = SizedBox(height: 2);
  static const SizedBox verticalSpacing4 = SizedBox(height: 4);
  static const SizedBox verticalSpacing6 = SizedBox(height: 6);
  static const SizedBox verticalSpacing8 = SizedBox(height: 8);
  static const SizedBox verticalSpacing12 = SizedBox(height: 12);
  static const SizedBox verticalSpacing16 = SizedBox(height: 16);

  static const SizedBox horizontalSpacing6 = SizedBox(width: 6);
  static const SizedBox horizontalSpacing10 = SizedBox(width: 10);

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
          fontSize: 15,
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
    return TextStyle(color: Theme.of(context).colorScheme.error, fontSize: 12);
  }

  static TextStyle hintTextStyle(BuildContext context) {
    return TextStyle(color: Theme.of(context).hintColor, fontSize: 15);
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
        borderRadius: BorderRadius.circular(12),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    );
  }

  static TextStyle sectionTitleStyle({
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.bold,
  }) {
    return TextStyle(fontSize: fontSize, fontWeight: fontWeight);
  }

  static BoxDecoration roundedContainerDecoration(BuildContext context) {
    return BoxDecoration(borderRadius: BorderRadius.circular(14));
  }
}
