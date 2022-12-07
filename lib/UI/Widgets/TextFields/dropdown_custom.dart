import 'package:flutter/material.dart';
import 'package:jop_swipper/Logic/logic_firebase_upload_file.dart';
import 'package:jop_swipper/UI/Texts/text_custom.dart';
import '../../Themes&Colors/color_constant.dart';
typedef StringToVoidFunc =  String?  Function(String?  value);
class CustomDropDown extends StatelessWidget {
  final String? selectedValue;

  final List<DropdownMenuItem<String>> dropdownItems;
  final String hint;
  final StringToVoidFunc onPress;
   const CustomDropDown({Key? key,required this.onPress, required this.selectedValue, required this.dropdownItems,required this.hint}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return  Card(
      color: Colors.white,
                          elevation: 0,
     child: Container(
      width: double.infinity,
          decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: CustomHexColors.primaryAppColor, width: 1.2)),
        height: 55,
       child: Padding(
         padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
         child: DropdownButton(
          
          style: CustomTextStyle.textfieldText,
           hint: Text(hint,style: CustomTextStyle.textfieldHintsText ,),
      isExpanded: true,
          underline: SizedBox.shrink(),
             value: selectedValue,
             items: dropdownItems,
             onChanged: (String? value)
             {
              onPress(value);
             },
             ),
       )
     ),
   );
  }
}