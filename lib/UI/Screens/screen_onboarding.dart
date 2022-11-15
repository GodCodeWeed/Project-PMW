// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jop_swipper/UI/Widgets/AppBar/appbar_basic.dart';
import 'package:jop_swipper/UI/Widgets/Buttons/button_raised.dart';
import '../../Data/data_firebase_storage_service.dart';
import '../../Logic/logic_firebase_upload_file.dart';
import '../../Utility/ConstantVariables/constant.dart';
import '../../Utility/DependencyInjection/dependencyInjection.dart';
import '../Texts/text_custom.dart';

import '../Widgets/ProgressIndicator/progressIndicator_fullScreen.dart';
import '../Widgets/TextFields/textfield_custom.dart';

class OnboardingScreen extends StatelessWidget {
  final email;
  OnboardingScreen({Key? key, this.email}) : super(key: key);
  var dataLayer = locator<FireBaseStorage>();
  TextEditingController roleController = new TextEditingController();
  TextEditingController expirienceController = new TextEditingController();
  XFile? imageFile = null;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: BasicAppBar(),
      body: BlocProvider(
        create: (context) => FileUploadFirebaseLogic(dataLayer),
        child:
            BlocConsumer<FileUploadFirebaseLogic, FileUploadFirebaseBaseState>(
          listener: (context, state) {
            if (state is FileSelected) {
              imageFile = state.file;
            }
          },
          builder: (context, state) {
            if (state is FileUploadFirebaseLoading) {
              return FullScreenProgressIndicator(
                  screenBody: screenBodyOnboarding(
                      logic: BlocProvider.of<FileUploadFirebaseLogic>(context),
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                      roleController: roleController,
                      expirienceController: expirienceController));
            }
            return screenBodyOnboarding(
                logic: BlocProvider.of<FileUploadFirebaseLogic>(context),
                screenHeight: screenHeight,
                screenWidth: screenWidth,
                roleController: roleController,
                expirienceController: expirienceController);
          },
        ),
      ),
    );
  }

  Widget screenBodyOnboarding(
      {required FileUploadFirebaseLogic logic,
      required double screenHeight,
      required double screenWidth,
      required TextEditingController roleController,
      required TextEditingController expirienceController}) {
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
                        "Onboarding",
                        style: CustomTextStyle.logoText,
                      )),
                  SizedBox(height: 20),
                  CustomTextfield(
                    controller: roleController,
                    hint: "Desired Role",
                    obscure: false,
                    icon: SizedBox.shrink(),
                  ),
                  SizedBox(height: 10),
                  CustomTextfield(
                    controller: expirienceController,
                    hint: "Years of Expirience",
                    obscure: false,
                    icon: SizedBox.shrink(),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () async {
                      logic.add(FileSelectedEvent(file: imageFile));
                    },
                    child: Row(
                      children: [
                        Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                  image: _imagePlaceHolder(imageFile),
                                  fit: BoxFit.contain),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  new Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(right: 3, left: 3),
                    child: ButtonRaised(
                      pressed: ()
                       {
                  
                         logic.add(FileUploadFirebaseEvent(file:imageFile,email: "tuoyomichael@gmail.com"));
                       },
                      buttonTitle: "Upload Information",
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ));
  }

  ImageProvider _imagePlaceHolder(dynamic image) {
    if (image is String) {
      return AssetImage(Constants.placeHolderAsset);
    } 
     if (image is XFile) {
      XFile? f =  image;
      return FileImage(File(f.path));
    } else {
      return AssetImage(Constants.placeHolderAsset);
    }
  }
}
