import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jop_swipper/UI/Texts/text_custom.dart';
import 'package:jop_swipper/UI/Widgets/AppBar/appbar_basic.dart';
import 'package:jop_swipper/UI/Widgets/Buttons/button_raised.dart';
import 'package:jop_swipper/UI/Widgets/Icons/icon_custom.dart';
import 'package:jop_swipper/UI/Widgets/TextFields/textfield_custom.dart';
import '../../Data/data_firebase_authentication_service.dart';
import '../../Logic/logic_firebase_login.dart';
import '../../Utility/DependencyInjection/dependencyInjection.dart';
import '../../Utility/ScreenNavigation/screenNavigation_functions.dart';
import '../../Utility/ScreenNavigation/screenNavigation_names.dart';


class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  var dataLayer = locator<FireBaseAuthentication>();
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
          create: (context) => LoginFirebaseLogic(dataLayer),
          child: BlocConsumer<LoginFirebaseLogic, LoginFirebaseBaseState>(
            listener: (context, state) {
             
            },
            builder: (context, state) {
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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  //  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Remember me',
                                        textAlign: TextAlign.right,
                                      ),
                                    ),
                                    Switch(
                                      value: false,
                                      onChanged: (value) {},
                                      activeTrackColor: Colors.lightGreenAccent,
                                      activeColor: Colors.green,
                                    )
                                  ],
                                ),
                                new Container(
                                  padding:
                                      const EdgeInsets.only(right: 3, left: 3),
                                  child: ButtonRaised(
                                    pressed: () {},
                                    buttonTitle: "Login",
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 30),
                            GestureDetector(
                              onTap: () {
                                ScreenNavigationFunctions.instance.navigateTo(
                                    ScreeNavigationNames.signupScreen);
                              },
                              child: SizedBox(
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.transparent)),
                                  child: Text.rich(TextSpan(
                                      text: 'Dont have an account? ',
                                      style:
                                          CustomTextStyle.plainInformationText,
                                      children: const <InlineSpan>[
                                        TextSpan(
                                          text: 'Sign Up',
                                          style: CustomTextStyle
                                              .coloredInformationText,
                                        )
                                      ])),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ));
            },
          ),
        ),
      ),
    );
  }
}