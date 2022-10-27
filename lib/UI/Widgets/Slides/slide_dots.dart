// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SlideDots extends StatelessWidget {
  bool isActive;
  // ignore: use_key_in_widget_constructors
  SlideDots(this.isActive);
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: isActive ? 12 : 8,
      width: isActive ? 12 : 8,
      decoration: BoxDecoration(
          color:
              isActive ? Theme.of(context).primaryColor : Colors.grey.shade200,
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }
}
