// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jop_swipper/UI/Widgets/AppBar/appbar_basic.dart';
import 'package:jop_swipper/UI/Widgets/Buttons/button_raised.dart';
import 'package:jop_swipper/Utility/ScreenNavigation/screenNavigation_functions.dart';
import 'package:jop_swipper/Utility/ScreenNavigation/screenNavigation_names.dart';
import '../../Data/data_firebase_storage_service.dart';
import '../../Logic/logic_firebase_upload_file.dart';
import '../../Utility/ConstantVariables/constant.dart';
import '../../Utility/DependencyInjection/dependencyInjection.dart';
import '../Texts/text_custom.dart';

import '../Widgets/ProgressIndicator/progressIndicator_fullScreen.dart';
import '../Widgets/TextFields/dropdown_custom.dart';
import '../Widgets/TextFields/textfield_custom.dart';

class OnboardingScreen extends StatelessWidget {
  final email;
  List<DropdownMenuItem<String>> get roleDropdownItems{
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("Software Engineer",style: CustomTextStyle.textfieldText,),value: "Software Engineer"),
    DropdownMenuItem(child: Text("Cyber Security",style: CustomTextStyle.textfieldText,),value: "Cyber Security"),
    DropdownMenuItem(child: Text("Solution Architect",style: CustomTextStyle.textfieldText,),value: "Solution Architect"),
    DropdownMenuItem(child: Text("Network Engineer",style: CustomTextStyle.textfieldText,),value: "Network Engineer"),
  ];
  return menuItems;
}
  List<DropdownMenuItem<String>> get locationDropdownItems{
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("USA",style: CustomTextStyle.textfieldText,),value: "USA"),
    DropdownMenuItem(child: Text("UK",style: CustomTextStyle.textfieldText,),value: "UK"),
    DropdownMenuItem(child: Text("Canada",style: CustomTextStyle.textfieldText,),value: "Canada"),
    DropdownMenuItem(child: Text("India",style: CustomTextStyle.textfieldText,),value: "India"),
         DropdownMenuItem(child: Text("Nigeria",style: CustomTextStyle.textfieldText,),value: "Nigeria"),
  ];
  return menuItems;
}

  List<DropdownMenuItem<String>> get expirienceDropdownItems{
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("0 -  3 years",style: CustomTextStyle.textfieldText,),value: "Junior"),
    DropdownMenuItem(child: Text("4 - 6 years",style: CustomTextStyle.textfieldText,),value: "Mid Level"),
    DropdownMenuItem(child: Text("8 - 10 years",style: CustomTextStyle.textfieldText,),value: "Senior"),
    DropdownMenuItem(child: Text("10+ years",style: CustomTextStyle.textfieldText,),value: "Principal"),
  ];
  return menuItems;
}
  OnboardingScreen({Key? key, this.email}) : super(key: key);
  var dataLayer = locator<FireBaseStorage>();

  TextEditingController expirienceController = new TextEditingController();
  XFile? imageFile = null;
  String? role = null;
  String? expirience = null;
    String? location = null;
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
            if(state is RoleSelected)
            {
              role = state.role;
            }
            if(state is ExpirienceSelected)
            {
              expirience = state.expirience;
            }
          },
          builder: (context, state) {

 

            if (state is FileUploadFirebaseLoading) {
              return FullScreenProgressIndicator(
                  screenBody: screenBodyOnboarding(
                      logic: BlocProvider.of<FileUploadFirebaseLogic>(context),
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                      expirienceController: expirienceController));
            }
            return screenBodyOnboarding(
                logic: BlocProvider.of<FileUploadFirebaseLogic>(context),
                screenHeight: screenHeight,
                screenWidth: screenWidth,
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
                  CustomDropDown( onPress: (value) {
                  
                     logic.add(RoleSelectedEvent(role: value));
  
                  return value;
                  },dropdownItems: roleDropdownItems, selectedValue: role,hint:"Desired Role" ,),
                  // CustomTextfield(
                  //   controller: roleController,
                  //   hint: "Desired Role",
                  //   obscure: false,
                  //   icon: SizedBox.shrink(),
                  // ),
                  SizedBox(height: 10),
                                    CustomDropDown( onPress: (value) {
                  
                     logic.add(ExpirienceSelectedEvent(expirience: value));
  
                  return value;
                  },dropdownItems: expirienceDropdownItems, selectedValue: expirience,hint:"Years of Expirience" ,),

                         SizedBox(height: 10),
                                    CustomDropDown( onPress: (value) {
                  
                     logic.add(ExpirienceSelectedEvent(expirience: value));
  
                  return value;
                  },dropdownItems: locationDropdownItems, selectedValue: location,hint:"Desired Location" ,),
                  // CustomTextfield(
                  //   controller: expirienceController,
                  //   hint: "Years of Expirience",
                  //   obscure: false,
                  //   icon: SizedBox.shrink(),
                  // ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade200),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
               
                    width: double.infinity,
                    height: 100,
                    child: GestureDetector(
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
                  ),
                  SizedBox(height: 10),
                  new Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(right: 3, left: 3),
                    child: ButtonRaised(
                      pressed: ()
                       {    

                        if((expirience != null && role != null) && expirience!.isNotEmpty && role!.isNotEmpty)
                        {
                           ScreenNavigationFunctions.instance
                          .navigateTo(ScreenNavigationNames.swipeScreen);
                         //  logic.add(FileUploadFirebaseEvent(file:imageFile,role: role,expirience: expirience,   email: "tuoyomichael@gmail.com"));
                        }else
                        {
                          
                        }
               
                        
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
