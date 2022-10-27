import 'package:flutter/material.dart';

import '../../Themes&Colors/color_constant.dart';

class FullScreenProgressIndicator extends StatelessWidget {
final Widget screenBody;
  const FullScreenProgressIndicator({Key? key,required this.screenBody}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
    IntrinsicHeight(
                              child: Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  screenBody,
                                  Positioned(
                                    child: Container(
                                      color: Colors.black38.withOpacity(0.5),
                                      //    width: screenWidth,height: screenHeight,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      child: const CircularProgressIndicator(color: CustomHexColors.primaryAppColor ,),
                                    ),
                                  )
                                ],
                              ),
                            );
  }
}