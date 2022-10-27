import 'package:flutter/material.dart';

import '../../Themes&Colors/color_constant.dart';


class CustomIcon extends StatelessWidget {
  final IconData icon;
  const CustomIcon({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Icon(icon, size: 25,color: CustomHexColors.primaryAppColor,);
  }
}