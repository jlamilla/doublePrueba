import 'package:flutter/material.dart';
import 'package:prueba/design/colors.dart';

class BukDoubleThemes{
  BukDoubleThemes._();
  static ThemeData defaultTheme = ThemeData(
    fontFamily: 'RobotoMono',
    primaryColor: BukDoubleColors.brandPrimaryColor,
    
    textTheme:  const TextTheme(
      titleMedium: TextStyle( fontSize: 33.0, fontWeight: FontWeight.w500, color: BukDoubleColors.brandTitleColor,),
      displayLarge: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
      displayMedium: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
      displaySmall: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
      headlineLarge: TextStyle(fontSize: 21.0, color: BukDoubleColors.brandPrimaryColor),
      bodyLarge: TextStyle(fontSize: 18.0, height: 2),
      bodyMedium: TextStyle(fontSize: 16.0),
      bodySmall: TextStyle( fontSize: 15.0, fontWeight: FontWeight.w500, color: BukDoubleColors.brandLightDarkColor, ),
    ) 
  );
}