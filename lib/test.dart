//import 'package:flutter/material.dart';
//import 'package:budge_food/models/Basket.dart';
//
//// ignore: must_be_immutable
//class AddToBasketButton extends StatelessWidget {
//  Basket basket = Basket();
//
//  @override
//  Widget build(BuildContext context) {
//    Size size = MediaQuery.of(context).size;
//
//    return Container(
//      padding: EdgeInsets.all(20),
//      width: size.width * 0.8,
//      decoration: BoxDecoration(
//        color: Colors.orange,
//        borderRadius: BorderRadius.circular(10),
//      ),
//      child: InkWell(
//        child: Row(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: [
//            Icon(
//              Icons.shopping_bag,
//              color: Colors.white,
//            ),
//            SizedBox(width: 10),
//            Text(
//              'Add To Basket',
//              style: TextStyle(
//                color: Colors.white,
//                fontSize: 18,
//                fontWeight: FontWeight.bold,
//              ),
//            ),
//          ],
//        ),
//        onTap: () {
//          ///TODO Implement functionality for Adding an Item to the basket
//          print('A');
//        },
//      ),
//    );
//  }
//}
