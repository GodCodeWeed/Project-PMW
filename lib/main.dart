import 'package:flutter/material.dart';
import 'package:jop_swipper/UI/Screens/screen_onboarding.dart';
import 'package:jop_swipper/UI/Screens/screen_swipe.dart';
import 'UI/Screens/screen_landing.dart';
import 'UI/Screens/screen_login.dart';
import 'UI/Screens/screen_signup.dart';
import 'UI/Themes&Colors/theme_custom.dart';
import 'Utility/DependencyInjection/dependencyInjection.dart';
import 'Utility/ScreenNavigation/screenNavigation_functions.dart';
import 'Utility/ScreenNavigation/screenNavigation_names.dart';
import 'package:firebase_core/firebase_core.dart';
//git config --global user.name "holaryiwola"
void main() async{
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

 
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
      initialRoute: ScreenNavigationNames.landingScreen,
      routes: {
ScreenNavigationNames.loginScreen:(BuildContext context) =>LoginScreen(),
ScreenNavigationNames.signupScreen:(BuildContext context) =>SignUpScreen(),
ScreenNavigationNames.landingScreen:(BuildContext context) =>LandingScreen(),
ScreenNavigationNames.onboardingScreen:(BuildContext context) => OnboardingScreen(),
ScreenNavigationNames.swipeScreen:(BuildContext context) => SwipeScreen(),
      },
      theme: CustomTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: LandingScreen(),
    );
  }
}


