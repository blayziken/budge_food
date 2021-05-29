import 'package:budge_food/screens/SpecialsDetail.dart';
import 'package:flutter/material.dart';

class SpecialsHomeGrid extends StatelessWidget {
  final String specialName;
  final String price;

  SpecialsHomeGrid(this.specialName, this.price);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.only(left: 15, right: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          border: Border.all(
            color: Colors.black,
          ),
        ),
        child: Column(
          children: [
//          Spacer(),
            Container(
              height: 160,
              width: 160,
              decoration: BoxDecoration(
                color: Colors.grey,
                image: DecorationImage(
                  image: AssetImage('images/budge_logo.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Spacer(),
            Text(
              specialName,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'N$price',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
            ),
            Spacer(),
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SpecialsDetailScreen(
              shop: 'Mariere Complex',
              specialName: specialName,
              description:
                  'Nowadays, making printed materials have become fast, easy and simple. Nowadays, making printed materials have become fast, easy and simple. Nowadays, making printed materials have become fast, easy and simple. Nowadays, making printed materials have become fast, easy and simple. Nowadays, making printed materials have become fast, easy and simple. Nowadays, making printed materials have become fast, easy and simple.',
              price: price,
              ratings: 4,
            ),
          ),
        );
      },
    );
  }
}
