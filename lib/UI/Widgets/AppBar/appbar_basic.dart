import 'package:flutter/material.dart';
import '../../../Utility/ScreenNavigation/screenNavigation_functions.dart';
import '../../Themes&Colors/color_constant.dart';

class BasicAppBar extends StatelessWidget with PreferredSizeWidget{ 
  const BasicAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  AppBar(
        elevation: 0,
        leading: InkWell(
          onTap: ()
          {
             ScreenNavigationFunctions.instance.goback();
          },
          child: Icon(Icons.arrow_back,color: CustomHexColors.primaryAppColor,)),
      );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}