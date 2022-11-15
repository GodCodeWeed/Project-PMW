import 'package:flutter/material.dart';


import 'dart:async';

import '../../Model/model_slide.dart';


import '../../Utility/ScreenNavigation/screenNavigation_functions.dart';
import '../../Utility/ScreenNavigation/screenNavigation_names.dart';
import '../Widgets/Buttons/button_flat.dart';
import '../Widgets/Slides/slide_dots.dart';

import '../Widgets/Slides/slide_item.dart';
// ignore: use_key_in_widget_constructors
class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  int _currentPage = 0;
  bool longPress = false;

  final PageController _pageController = PageController(initialPage: 0);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

_timerMotion();
  
  }

_timerMotion()
{
    Timer.periodic(const Duration(seconds: 20), (Timer timer) {
      if (longPress == false) {
        if (_currentPage < 3) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }
      }
      _pageController.animateToPage(_currentPage,
          duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
    });
}
  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(
      alignment: AlignmentDirectional.centerEnd,
      children: <Widget>[
        PageView.builder(
          itemCount: slideList.length,
          itemBuilder: (slideContext, i) =>
              SlideItem(i, screenHeight, screenWidth),
          controller: _pageController,
          scrollDirection: Axis.horizontal,
          onPageChanged: _onPageChanged,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 200,
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    height: 20,
                    //      margin: const EdgeInsets.only(bottom: 35),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        for (int i = 0; i < slideList.length; i++)
                          if (i == _currentPage)
                            SlideDots(true)
                          else
                            SlideDots(false)
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
            ButtonFlat(
              pressed: ()
              {
 ScreenNavigationFunctions.instance.navigateTo(ScreenNavigationNames.loginScreen);
              },
                            buttonTitle: "Get started",
                          
                          ),
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}

//Helper methods

