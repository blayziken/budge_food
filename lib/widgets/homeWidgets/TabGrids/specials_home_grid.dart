import 'package:budge_food/screens/SpecialsDetail.dart';
import 'package:flutter/material.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';

class SpecialsHomeGrid extends StatelessWidget {
  final String specialName;
  final String price;
  final String imageName;

  SpecialsHomeGrid(this.specialName, this.price, this.imageName);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      child: Container(
//        padding: EdgeInsets.only(left: 15, right: 15),
//        decoration: BoxDecoration(
//          color: Colors.white,
//          borderRadius: BorderRadius.circular(13),
//          border: Border.all(
//            color: Colors.purple,
//          ),
//        ),
        child: OutlineGradientButton(
          gradient: LinearGradient(
            colors: [Color(0XFF416785), Color(0XFFFFFFFF)],
            begin: Alignment(0, 0),
            end: Alignment(-1, -1),
          ),
          strokeWidth: 1,
          radius: Radius.circular(13),
          child: Column(
            children: [
//          Spacer(),
              Container(
//                height: 160,
//                width: 160,
                height: size.height * 0.185,
                width: size.width * 0.4,
                decoration: BoxDecoration(
//                  color: Colors.grey,
                  image: DecorationImage(
                    image: AssetImage('images/snacks/$imageName.png'),
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
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SpecialsDetailScreen(
              shop: 'Mariere Complex',
              specialName: specialName,
              description:
                  'Nowadays, making printed materials have become fast, easy and simple. Nowadays, making printed materials have become fast, easy and simple.',
              price: price,
              ratings: 4,
              imageName: specialName.toLowerCase(),
            ),
          ),
        );
      },
    );
  }
}
