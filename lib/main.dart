import 'package:flutter/material.dart';
import 'UI/Screens/screen_landing.dart';
import 'UI/Screens/screen_login.dart';
import 'UI/Screens/screen_signup.dart';
import 'UI/Themes&Colors/theme_custom.dart';
import 'Utility/DependencyInjection/dependencyInjection.dart';
import 'Utility/ScreenNavigation/screenNavigation_functions.dart';
import 'Utility/ScreenNavigation/screenNavigation_names.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
 
  await Firebase.initializeApp();
   WidgetsFlutterBinding.ensureInitialized();
 
 setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: ScreenNavigationFunctions.instance.navigationKey,
      initialRoute: ScreeNavigationNames.landingScreen,
      routes: {
ScreeNavigationNames.loginScreen:(BuildContext context) =>LoginScreen(),
ScreeNavigationNames.signupScreen:(BuildContext context) =>SignUpScreen(),
ScreeNavigationNames.landingScreen:(BuildContext context) =>LandingScreen(),
      },
      theme: CustomTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: LandingScreen(),
    );
  }
}


