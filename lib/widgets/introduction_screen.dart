import 'package:budge_food/data/introduction_pages.dart';
import 'package:budge_food/screens/authentication/login.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroductionScreenWidget extends StatelessWidget {
  const IntroductionScreenWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: pages,
      onDone: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Login(),
          ),
        );
      },
      showSkipButton: true,
      showNextButton: false,
      showDoneButton: true,
      next: Icon(Icons.arrow_forward),
      skip: Text('Skip'),
      done: Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: DotsDecorator(
        activeColor: Colors.red,
        size: Size.square(10.0),
        activeSize: Size(20.0, 10.0),
        color: Colors.black26,
        spacing: EdgeInsets.symmetric(horizontal: 3.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}
