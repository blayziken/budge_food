import 'package:flutter/material.dart';

class CampusOrderScreen extends StatelessWidget {
  static const routeName = 'campus-order-screen';

  String campusName;

  CampusOrderScreen({this.campusName});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Container(
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30, bottom: 30),
//                  height: 250,
                  height: size.height * 0.3,
//                  width: 330,
                  width: size.width * 0.85,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      image: DecorationImage(
                          image: AssetImage('images/food/$campusName.png'))),
                ),
                Text(
                  'Order Details',
                  style: TextStyle(fontSize: 30),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
