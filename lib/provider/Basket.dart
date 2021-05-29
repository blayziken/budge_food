import 'package:flutter/foundation.dart';

class BasketItem {
  final String shop;
  final String foodName;
  final String description;
  final String price;
//  final double ratings;
  final String imageName;
  final String foodOrSnacks;

  BasketItem({
    this.foodOrSnacks,
    this.imageName,
    this.foodName,
    this.shop,
    this.description,
    this.price,
//    this.ratings,
  });
}

class Basket with ChangeNotifier {
  List<BasketItem> _basketList = [
//    BasketItemTile(
//        shopName: 'Mavis Campus',
//        description: 'Scaling up satisfaction',
//        price: 'N600'),
//    BasketItemTile(
//        shopName: 'Mavis Campus',
//        description: 'Scaling up satisfaction',
//        price: 'N600'),
//    BasketItemTile(
//        shopName: 'Mavis Campus',
//        description: 'Scaling up satisfaction',
//        price: 'N600'),
  ];

  List<BasketItem> get basketList {
    return [..._basketList];
  }

  void addToBasket(BasketItem basketItem) {
//    _basketList.add(
//      BasketItemTile(
//        foodName: basketItem.foodName,
//        shopName: basketItem.shop,
//        price: basketItem.price,
//      ),
//    );
    //
    _basketList.insert(
      0,
      BasketItem(
        foodName: basketItem.foodName,
        shop: basketItem.shop,
        price: basketItem.price,
        description: basketItem.description,
        imageName: basketItem.imageName,
        foodOrSnacks: basketItem.foodOrSnacks,
      ),
    );
    notifyListeners();
  }
}
