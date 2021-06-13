import 'package:budge_food/widgets/order_button.dart';
import 'package:budge_food/widgets/title_price_rating.dart';
import 'package:flutter/material.dart';

class SpecialsDetailScreen extends StatelessWidget {
  static const routeName = 'special-detail-screen';

  final String shop;
  final String specialName;
  final String description;
  final String price;
  final double ratings;
//  final String foodOrSnacks;
  final String imageName;

  SpecialsDetailScreen(
      {this.shop,
      this.specialName,
      this.description,
      this.price,
      this.ratings,
//      this.foodOrSnacks,
      this.imageName});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String foodOrSnacks = 'snacks';

    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          ItemImage(imgSrc: 'images/snacks/$imageName.png'),
          SizedBox(height: 10),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  shopName(shop),
                  TitlePriceRating(
                    name: specialName,
                    rating: ratings,
                    numOfReviews: 24,
                    price: price,
                    onRatingChanged: (value) {},
                  ),
                  Text(
                    description,
                    style: TextStyle(height: 2),
                  ),
                  SizedBox(height: size.height * 0.05),
                  AddToBasketButton(
                    shopName: shop,
                    price: price,
                    foodName: specialName,
                    imageName: specialName.toLowerCase(),
                    foodOrSnacks: foodOrSnacks,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Row shopName(String shopName) {
    return Row(
      children: [
        Icon(Icons.location_on, color: Colors.grey),
        SizedBox(
          width: 10,
        ),
        Text(shopName),
      ],
    );
  }
}

class ItemImage extends StatelessWidget {
  final String imgSrc;
  const ItemImage({
    Key key,
    this.imgSrc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Image.asset(
      imgSrc,
      height: size.height * 0.4,
      width: double.infinity,
      fit: BoxFit.contain,
    );
  }
}
