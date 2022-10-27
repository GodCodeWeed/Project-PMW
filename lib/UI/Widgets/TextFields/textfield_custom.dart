import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../Texts/text_custom.dart';
import '../../Themes&Colors/color_constant.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final bool obscure;
  final Widget icon;
   const CustomTextfield({Key? key,required this.controller,required this.hint, required this.obscure,  required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return  Card(
      color: Colors.white,
                          elevation: 0,
     child: Container(
          decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: CustomHexColors.primaryAppColor, width: 1.2)),
        height: 55,
       child: TextFormField(
                                  controller: controller,
                             
                                  obscureText: obscure,
                                  style: CustomTextStyle.textfieldText,
                                  decoration: InputDecoration(
                                    suffixIcon: icon,
                                      errorStyle: CustomTextStyle.textfieldErrorText,
                                      focusedErrorBorder: const UnderlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.transparent, width: 0),
                                      ),
                                      errorBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent, width: 0),
                                      ),
                                      contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                                      hintText: hint,
                                      hintStyle: CustomTextStyle.textfieldHintsText ,
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              const BorderSide(color: Colors.transparent),
                                          borderRadius: BorderRadius.circular(5)),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0),
                                          borderRadius: BorderRadius.circular(5)),
                                      filled: true,
                                      fillColor: Colors.transparent),
                                ),
     ),
   );
  }
}