import 'package:bo_acc_form/presentation/bloc/form_data/form_data_cubit.dart';
import 'package:bo_acc_form/presentation/bloc/stepper_cubit/stepper_cubit.dart';
import 'package:bo_acc_form/presentation/screen/home_page.dart';
import 'package:bo_acc_form/common/constants/app_ui_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BOAccForm extends StatelessWidget {
  const BOAccForm({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BO Form',
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: AppUiConst.scaffoldBackgroundColorLight,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppUiConst.primaryColor,
          primary: AppUiConst.primaryColor,
          onPrimary: AppUiConst.white,
          brightness: Brightness.light,
          onPrimaryContainer: AppUiConst.black,
          primaryContainer: AppUiConst.white,
          error: AppUiConst.errorColor,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: AppUiConst.appBarBackgroundColorLight,
          iconTheme: IconThemeData(color: AppUiConst.black),
          titleTextStyle: TextStyle(
            color: AppUiConst.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppUiConst.inputFillColorLight,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppUiConst.primaryColor),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        cardColor: AppUiConst.cardColorLight,
        disabledColor: AppUiConst.disabledColorLight,
        hintColor: AppUiConst.hintColor,
      ),

      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppUiConst.scaffoldBackgroundColorDark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppUiConst.primaryColor,
          primary: AppUiConst.primaryColor,
          onPrimary: AppUiConst.white,
          brightness: Brightness.dark,
          primaryContainer: AppUiConst.scaffoldBackgroundColorDark,
          onPrimaryContainer: AppUiConst.white,
        ),

        appBarTheme: AppBarTheme(
          backgroundColor: AppUiConst.appBarBackgroundColorDark,
          elevation: 0,
          iconTheme: IconThemeData(color: AppUiConst.white),
          titleTextStyle: TextStyle(
            color: AppUiConst.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppUiConst.inputFillColorDark,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppUiConst.inputBorderColorDark),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppUiConst.primaryColor),
            borderRadius: BorderRadius.circular(12),
          ),
        ),

        cardColor: AppUiConst.cardColorDark,
        disabledColor: AppUiConst.disabledColorDark,
        hintColor: AppUiConst.hintColor,
      ),

      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => StepperCubit()),
          BlocProvider(create: (context) => FormDataCubit()),
        ],
        child: HomePage(),
      ),
    );
  }
}
