// ignore_for_file: prefer_const_constructors, unnecessary_new, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Data/data_firebase_authentication_service.dart';
import '../../Logic/logic_firebase_signup.dart';
import '../../Utility/DependencyInjection/dependencyInjection.dart';
import '../../Utility/ScreenNavigation/screenNavigation_functions.dart';
import '../../Utility/ScreenNavigation/screenNavigation_names.dart';
import '../Texts/text_custom.dart';
import '../Widgets/AppBar/appbar_basic.dart';
import '../Widgets/Buttons/button_raised.dart';
import '../Widgets/Icons/icon_custom.dart';
import '../Widgets/ProgressIndicator/progressIndicator_fullScreen.dart';
import '../Widgets/TextFields/textfield_custom.dart';

class SignUpScreen extends StatelessWidget  {
   SignUpScreen({Key? key}) : super(key: key);

    var dataLayer = locator<FireBaseAuthentication>();
        TextEditingController emailController = new TextEditingController();
    TextEditingController passwordController = new TextEditingController();
    TextEditingController confirmPasswordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: BasicAppBar(),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: BlocProvider(
          create: (context) => SignUpFirebaseLogic(dataLayer),
          child: BlocConsumer<SignUpFirebaseLogic, SignUpFirebaseBaseState>(
            listener: (context, state) {
              
            },
            builder: (context, state) {

              if(state is SignUpFirebaseLoading )
              {
                 return FullScreenProgressIndicator(screenBody: screenBodySignUp(logic: BlocProvider.of<SignUpFirebaseLogic>(context), screenHeight: screenHeight,screenWidth: screenWidth,emailController: emailController,passwordController: passwordController,confirmPasswordController: confirmPasswordController));
              }
              return screenBodySignUp(logic: BlocProvider.of<SignUpFirebaseLogic>(context), screenHeight: screenHeight,screenWidth: screenWidth,emailController: emailController,passwordController: passwordController,confirmPasswordController: confirmPasswordController);
            },
          ),
        ),
      ),
    );
  }

  Widget screenBodySignUp({required SignUpFirebaseLogic logic, required double screenHeight,required double screenWidth,required TextEditingController emailController,required TextEditingController passwordController, required TextEditingController confirmPasswordController })
  {
    return Container(
                  height: screenHeight,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  child: Center(
                    child: SingleChildScrollView(
                      child: Form(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Align(
                                alignment: Alignment.topCenter,
                                child: Text(
                                  "Jobs wipes",
                                  style: CustomTextStyle.logoText,
                                )), //epiesboj
                            SizedBox(height: 20),
                            CustomTextfield(
                              controller: emailController,
                              hint: "Email",
                              obscure: false,
                              icon: SizedBox.shrink(),
                            ),
                            SizedBox(height: 10),
                            CustomTextfield(
                                controller: passwordController,
                                hint: "Password",
                                obscure: true,
                                icon: CustomIcon(
                                  icon: Icons.visibility_off,
                                )),
                            SizedBox(height: 10),
                            CustomTextfield(
                                controller: confirmPasswordController,
                                hint: "Confirm Password",
                                obscure: true,
                                icon: CustomIcon(
                                  icon: Icons.visibility_off,
                                )),
                            SizedBox(height: 20),
                            new Container(
                              width: double.infinity,
                              padding: const EdgeInsets.only(right: 3, left: 3),
                              child: ButtonRaised(
                                pressed: () 
                                {
                                          ScreenNavigationFunctions.instance
                          .navigateTo(ScreenNavigationNames.onboardingScreen);
                                 // logic.add(SignUpFirebaseEvent(confirmPassword: confirmPasswordController.text,password: passwordController.text,email: emailController.text));
                                },
                                buttonTitle: "Sign up",
                              ),
                            ),

                            SizedBox(height: 30),
                          ],
                        ),
                      ),
                    ),
                  ));
  }
}
