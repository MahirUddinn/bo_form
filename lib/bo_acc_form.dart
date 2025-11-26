import 'package:bo_acc_form/presentation/screen/home_page.dart';
import 'package:flutter/material.dart';

class BOAccForm extends StatelessWidget {
  const BOAccForm({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: const Color(0xFFEDEDED),
        primaryColorLight: Colors.white,
        primaryColorDark: Colors.black,
        disabledColor: const Color(0xFFABABAB),
        primaryColor: const Color(0xFF3B60EC),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFE0E0E0),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black87),
        ),
      ),

      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF111111),
        primaryColorDark: Color(0xFF222222),
        primaryColorLight: Colors.white,
        disabledColor: const Color(0xFF303030),
        primaryColor: const Color(0xFF3B60EC),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF202020),
          iconTheme: IconThemeData(color: Colors.red),
        ),
      ),

      home: StepperPage(),
    );
  }
}
