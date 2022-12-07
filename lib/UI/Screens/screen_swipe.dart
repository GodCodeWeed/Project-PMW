import 'package:flutter/material.dart';

import 'package:jop_swipper/UI/Widgets/Swipper/swipper_background_curve_widget.dart';
import 'package:jop_swipper/UI/Widgets/Swipper/swipper_cards_stack_widget.dart';

class SwipeScreen extends StatelessWidget {
 SwipeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: const [
            BackgroudCurveWidget(),
            CardsStackWidget(),
          ],
        ),
    );
  }
}