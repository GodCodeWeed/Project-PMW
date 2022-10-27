import 'package:flutter/material.dart';

import '../Logic/logic_firebase_signup.dart';

abstract class IScreen{

Widget screenBodySignUp({required SignUpFirebaseLogic logic, required double screenHeight,required double screenWidth,required TextEditingController emailController,required TextEditingController passwordController,required TextEditingController confirmPasswordController })
{
  return const SizedBox.shrink();
}
}