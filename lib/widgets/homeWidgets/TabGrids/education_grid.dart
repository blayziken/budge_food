import 'package:flutter/material.dart';

class EducationGrid extends StatelessWidget {
  final String restaurantName;
  final String description;

  EducationGrid(this.restaurantName, this.description);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(bottom: 25.0),
      child: Container(
        height: media.height / 5,
        padding: EdgeInsets.only(top: 20, bottom: 20, right: 20),
        decoration: BoxDecoration(
//              color: Colors.yellow,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.green,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 80,
                backgroundImage: AssetImage('images/budge_logo.png'),
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(top: 18.0),
              child: Column(
                children: [
                  Text(
                    restaurantName,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 18,
//                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      letterSpacing: 1,
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
