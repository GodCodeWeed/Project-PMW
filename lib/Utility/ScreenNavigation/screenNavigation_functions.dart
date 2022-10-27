import 'package:flutter/material.dart';

class ScreenNavigationFunctions{
 late GlobalKey<NavigatorState> navigationKey;

  static ScreenNavigationFunctions instance = ScreenNavigationFunctions();

   ScreenNavigationFunctions(){
     navigationKey = GlobalKey<NavigatorState>();
   }

  Future<dynamic> navigateToReplacement(String _rn){
return navigationKey.currentState!.pushReplacementNamed(_rn);
  }
 Future<dynamic> navigateTo(String _rn){
   return navigationKey.currentState!.pushNamed(_rn);
  }
 Future<dynamic> navigateToRoute(MaterialPageRoute _rn){
   return navigationKey.currentState!.push(_rn);
  }

 goback(){
   return navigationKey.currentState!.pop();

  }
  }