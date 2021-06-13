import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';

class HomeTabs extends StatelessWidget {
  final String title;

  HomeTabs(this.title);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(1),
      width: width / 3.4,
      child: OutlineGradientButton(
        gradient: LinearGradient(colors: [
          Color(0XFF416785),
          Color(0XFFFFFFFF),
        ], begin: Alignment(-1, 0), end: Alignment(1, 1)),
        strokeWidth: 1.3,
        radius: Radius.circular(30),
        child: Tab(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
