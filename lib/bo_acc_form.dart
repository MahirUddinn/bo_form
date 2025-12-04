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
        scaffoldBackgroundColor: AppUiColors.scaffoldBackgroundColorLight,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppUiColors.primaryColor,
          primary: AppUiColors.primaryColor,
          onPrimary: AppUiColors.white,
          brightness: Brightness.light,
          onPrimaryContainer: AppUiColors.black,
          primaryContainer: AppUiColors.white,
          error: AppUiColors.errorColor,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: AppUiColors.appBarBackgroundColorLight,
          iconTheme: IconThemeData(color: AppUiColors.black),
          titleTextStyle: TextStyle(
            color: AppUiColors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppUiColors.inputFillColorLight,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppUiColors.primaryColor),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        cardColor: AppUiColors.cardColorLight,
        disabledColor: AppUiColors.disabledColorLight,
        hintColor: AppUiColors.hintColor,
      ),

      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppUiColors.scaffoldBackgroundColorDark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppUiColors.primaryColor,
          primary: AppUiColors.primaryColor,
          onPrimary: AppUiColors.white,
          brightness: Brightness.dark,
          primaryContainer: AppUiColors.scaffoldBackgroundColorDark,
          onPrimaryContainer: AppUiColors.white,
        ),

        appBarTheme: AppBarTheme(
          backgroundColor: AppUiColors.appBarBackgroundColorDark,
          elevation: 0,
          iconTheme: IconThemeData(color: AppUiColors.white),
          titleTextStyle: TextStyle(
            color: AppUiColors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppUiColors.inputFillColorDark,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppUiColors.inputBorderColorDark),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppUiColors.primaryColor),
            borderRadius: BorderRadius.circular(12),
          ),
        ),

        cardColor: AppUiColors.cardColorDark,
        disabledColor: AppUiColors.disabledColorDark,
        hintColor: AppUiColors.hintColor,
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
