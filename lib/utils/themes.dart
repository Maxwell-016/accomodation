import 'package:accomodation_module/utils/appColors.dart';
import 'package:flutter/material.dart';

class Themes{
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.mmustBlue,
      splashColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
  );
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.mmustBlue,
      splashColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
    iconTheme: const IconThemeData(
      color: Colors.black,

    )
  );
}