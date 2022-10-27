import 'package:flutter/material.dart';

import '../Themes&Colors/color_constant.dart';

class CustomTextStyle {
  static const TextStyle raisedButtonText =
      TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);
static const TextStyle flatButtonText =
      TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);
  static const TextStyle textfieldText = TextStyle(
      color: CustomHexColors.primaryAppColor,
      decoration: TextDecoration.none,
      decorationColor: Colors.transparent,
      fontSize: 20,
     );

       static const TextStyle logoText = TextStyle(
      color: CustomHexColors.primaryAppColor,
      fontSize: 25,
      wordSpacing: 4,
      fontWeight: FontWeight.w300
     );

       static const TextStyle coloredInformationText = TextStyle(
      color: CustomHexColors.primaryAppColor,
      fontWeight: FontWeight.bold,
      fontSize: 14,
     );

       static const TextStyle plainInformationText = TextStyle(
      color: Colors.black,

      fontSize: 14,
     );

  static const TextStyle textfieldErrorText =
      TextStyle(height: 0, 
       decoration: TextDecoration.none,
      color: CustomHexColors.primaryErrorColor, fontSize: 15);

  static const TextStyle textfieldHintsText =
      TextStyle(color: Colors.black38,
       decoration: TextDecoration.none,
       fontSize: 14);
}
