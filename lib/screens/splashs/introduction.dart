import 'package:budge_food/widgets/introduction_screen.dart';
import 'package:flutter/material.dart';

class IntroductionSlide extends StatelessWidget {
  static const routeName = '/introduction-slide';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: IntroductionScreenWidget(),
      ),
    );
  }
}
