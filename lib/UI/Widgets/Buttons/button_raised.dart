import 'package:flutter/material.dart';

import '../../Texts/text_custom.dart';
import '../../Themes&Colors/color_constant.dart';

// ignore: use_key_in_widget_constructors
class ButtonRaised extends StatelessWidget {
  final String buttonTitle;
  final VoidCallback pressed;
  const ButtonRaised({Key? key,required this.buttonTitle,required this.pressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
                      onPressed: pressed,
                      child:  Text(
                        buttonTitle,

                     
                      ), 
                        style: ElevatedButton.styleFrom(
                          
                  primary:CustomHexColors.primaryAppColor,
                  textStyle: CustomTextStyle.raisedButtonText
                  ),          
                    ),
    );
  }
}