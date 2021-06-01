import 'package:budge_food/widgets/materialDialog/dialog.dart';
import 'package:flutter/material.dart';
import 'package:budge_food/provider/Basket.dart';
import 'package:provider/provider.dart';

class AddToBasketButton extends StatelessWidget {
  final String foodName;
  final String shopName;
  final String price;
  final String foodOrSnacks;
  final String imageName;
//  final String description;
//  final String ratings;

  AddToBasketButton({
    Key key,
    this.foodName,
    this.shopName,
    this.price,
    this.foodOrSnacks,
    this.imageName,
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
          BasketItem _addItem = BasketItem(
            foodName: foodName,
            shop: shopName,
            price: price,
            foodOrSnacks: foodOrSnacks,
            imageName: imageName,
          );

          Provider.of<Basket>(context, listen: false).addToBasket(_addItem);

          print(
              'Items in basket: ${Provider.of<Basket>(context, listen: false).getLength()}');

          materialDialog(context);

          ///TODO ADD ALERT DIALOG
          //materialDialog(context, restaurantName)
        },
      ),
    );
  }
}
