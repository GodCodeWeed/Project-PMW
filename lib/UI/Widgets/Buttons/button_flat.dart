import 'package:flutter/material.dart';

import '../../Texts/text_custom.dart';
import '../../Themes&Colors/color_constant.dart';

// ignore: use_key_in_widget_constructors
class ButtonFlat extends StatelessWidget {
  final String buttonTitle;
   final VoidCallback pressed;
  const ButtonFlat({Key? key,required this.buttonTitle,required this.pressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
      child: TextButton(
                      onPressed: pressed,
                      child:  Text(
                        buttonTitle,
                     style: CustomTextStyle.flatButtonText,
                      ),    
       style: ButtonStyle(
          overlayColor: MaterialStateColor.resolveWith((states) => CustomHexColors.primaryAppColor),
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
          foregroundColor: MaterialStateProperty.all<Color>(CustomHexColors.primaryAppColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3.0),
              side: BorderSide(color: Colors.white,width: 1.5)
            )
          
       ))),
    );
  }
}