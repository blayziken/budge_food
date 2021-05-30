import 'package:flutter/material.dart';
import 'basket_item.dart';
import 'package:provider/provider.dart';
import 'package:budge_food/provider/Basket.dart';

Basket basket = Basket();

Widget emptyBasketOrNot(context) {
  final basketData = Provider.of<Basket>(context);
  Size size = MediaQuery.of(context).size;

  if (basketData.basketList.isEmpty) {
    return Expanded(
      flex: 0,
      child: Center(
        child: Container(
          height: 250,
          width: 250,
          child: Center(
            child: Text(
              'Empty',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 30,
                color: Colors.black,
              ),
            ),
          ),
          decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                image: AssetImage('images/empty_cart.jpg'),
              )),
        ),
      ),
    );
  } else
    return Expanded(
      flex: 0,
      child: Container(
        height: size.height * 0.39,
//        color: Colors.teal,
        child: ListView.builder(
          itemCount: basketData.basketList.length,
          itemBuilder: (context, index) =>
              BasketItemTile(basketData.basketList[index]),
        ),
      ),
    );
}
