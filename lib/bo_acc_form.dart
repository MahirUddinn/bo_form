import 'package:bo_acc_form/presentation/screen/home_page.dart';
import 'package:flutter/material.dart';
class BOAccForm extends StatelessWidget {
  BOAccForm({super.key});

  final _primaryColor = Color(0xFF3B60EC);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BO Form',
      theme: ThemeData(
        primaryColorDark: Colors.black,
        brightness: Brightness.light,
        primaryColor: _primaryColor,
        scaffoldBackgroundColor: Color(0xFFEDEDED),
        colorScheme: ColorScheme.fromSeed(
          seedColor: _primaryColor,
          brightness: Brightness.light,
          onPrimaryContainer: Colors.black,
          primaryContainer: Colors.white,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFFE0E0E0),
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        cardColor: Colors.white,
        disabledColor: Colors.grey[400],
        hintColor: Colors.grey,
      ),
      darkTheme: ThemeData(
        primaryColorDark: Colors.white,
        brightness: Brightness.dark,
        primaryColor: _primaryColor,
        scaffoldBackgroundColor: Color(0xFF121212),
        colorScheme: ColorScheme.fromSeed(
          seedColor: _primaryColor,
          brightness: Brightness.dark,
          primaryContainer: Color(0xFF121212),
          onPrimaryContainer: Colors.white,
        ),

        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF1E1E1E),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Color(0xFF1E1E1E),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Color(0xFF343434))
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: _primaryColor),
            borderRadius: BorderRadius.circular(12),
          ),
        ),

        cardColor: Color(0xFF1E1E1E),
        disabledColor: Colors.grey[800],
        hintColor: Colors.grey,
      ),

      home: StepperPage(),
    );
  }
}
