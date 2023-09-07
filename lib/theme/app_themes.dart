import 'package:expert_system_app/resources/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'theme_text.dart';

class AppThemes {
  AppThemes._();

  static ThemeData lightTheme(BuildContext context) => ThemeData(
        // unselectedWidgetColor: AppColors.royalBlue,
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        // cardTheme: const CardTheme(color: AppColors.vulcan),
        textTheme: ThemeText.getLightTextTheme(),
        // brightness: Brightness.dark,
        inputDecorationTheme: inputDecorationTheme(context),
        // colorScheme:
        //     ColorScheme.fromSwatch().copyWith(secondary: AppColors.royalBlue),
      );
}

InputDecorationTheme inputDecorationTheme(BuildContext context) {
  return InputDecorationTheme(
    hintStyle: context.titleMedium.copyWith(color: Colors.grey),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white,
      ),
    ),
    enabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
    ),
  );
}
