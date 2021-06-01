import 'package:flutter/foundation.dart';

class BasketItem {
  final String id;
  final String shop;
  final String foodName;
  final String description;
  final String price;
//  final double ratings;
  final String imageName;
  final String foodOrSnacks;

  BasketItem({
    this.id,
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
  List<BasketItem> _basketItems = [
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

  // GET BASKET ITEMS
  List<BasketItem> get basketItems {
    return [..._basketItems];
  }

  // GET LENGTH OF BASKET ITEMS
  int getLength() {
    return _basketItems.length;
  }

  // ADD ITEM TO BASKET
  void addToBasket(BasketItem basketItem) {
    _basketItems.insert(
      0,
      BasketItem(
        id: DateTime.now().toString(),
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

  //TOTAL WORTH OF BASKET
  int get totalBasketAmount {
    var total = 0;

    _basketItems.forEach((basketItems) {
      total += int.parse(basketItems.price);
    });
    return total;
  }

  // DELETE AN ITEM FROM THE BASKET
  void deleteItemFromBasket(String itemId) {
    final existingStoryIndex =
        _basketItems.indexWhere((element) => element.id == itemId);

    _basketItems.removeAt(existingStoryIndex);

    notifyListeners();
  }
}
