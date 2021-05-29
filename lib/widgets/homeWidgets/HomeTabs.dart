import 'package:flutter/material.dart';

class HomeTabs extends StatelessWidget {
  final String title;

  HomeTabs(this.title);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
//      width: double.infinity,
//      width: 120,
      height: 42,
      width: width / 3.5,
      decoration: BoxDecoration(
//          color: Colors.red,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: Colors.blueGrey,
          )),
      child: Tab(
        child: Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
