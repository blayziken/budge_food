import 'package:budge_food/screens/campus_newHall_education_dli_order/campus_order.dart';
import 'package:flutter/material.dart';

class CampusHomeGrid extends StatelessWidget {
  final String restaurantName;
  final String description;
  final String campusName;

  CampusHomeGrid(this.restaurantName, this.description, this.campusName);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return InkWell(
      child: Padding(
        padding: EdgeInsets.only(bottom: 25.0),
        child: Container(
          padding: EdgeInsets.all(1.5),
          decoration: BoxDecoration(
            color: Colors.brown,
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [
                Colors.lightGreen[700],
//              Colors.lightGreen[700],
                Colors.red,
              ],
              begin: Alignment(0, -1),
              end: Alignment(0, 0),
            ),
          ),
          child: Container(
            height: media.height / 5,
            padding: EdgeInsets.only(top: 20, bottom: 20, right: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 0.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 90,
                    backgroundImage: AssetImage('images/food/$campusName.png'),
                  ),
                ),
                Spacer(),
//            SizedBox(width: 10),
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
                          fontSize: 20,
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
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CampusOrderScreen(campusName: restaurantName),
          ),
        );
      },
    );
  }
}
