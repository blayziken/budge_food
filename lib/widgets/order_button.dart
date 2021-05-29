import 'package:flutter/material.dart';
import 'package:budge_food/provider/Basket.dart';
import 'package:budge_food/screens/BasketScreen.dart';
import 'package:provider/provider.dart';

class AddToBasketButton extends StatelessWidget {
  final String foodName;
  final String shopName;
  final String price;
//  final String description;
//  final String ratings;

  AddToBasketButton({
    Key key,
    this.foodName,
    this.shopName,
    this.price,
//      this.description,
//      this.ratings,
  }) : super(key: key);

  Basket basket = Basket();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.all(20),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_bag,
              color: Colors.white,
            ),
            SizedBox(width: 10),
            Text(
              'Add To Basket',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        onTap: () {
          ///TODO Implement functionality for Adding an Item to the basket
          BasketItem _addItem = BasketItem(
            foodName: foodName,
            shop: shopName,
            price: price,
          );

          Provider.of<Basket>(context, listen: false).addToBasket(_addItem);
          print('A');
          Navigator.pushNamed(context, 'basket-screen');
        },
      ),
    );
  }
}
