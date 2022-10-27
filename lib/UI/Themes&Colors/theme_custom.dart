import 'package:flutter/material.dart';
import 'color_constant.dart';



class CustomTheme {
  static ThemeData get lightTheme { //1
    return ThemeData( //2
    appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.white //here you can give the text color
          ),
      primaryColor: CustomHexColors.primaryAppColor,
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Open sans', //3
      splashColor: CustomHexColors.primaryAppColor,
      buttonTheme: ButtonThemeData( // 4
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
        buttonColor: CustomHexColors.primaryAppColor,
   
      )
    );
  }



}

