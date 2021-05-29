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

  SpecialsDetailScreen(
      {this.shop,
      this.specialName,
      this.description,
      this.price,
      this.ratings});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
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
          ItemImage(imgSrc: 'images/budge_logo.png'),
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
//                Text(
//                  'Nowadays, making printed materials have become fast, easy and simple. Nowadays, making printed materials have become fast, easy and simple. Nowadays, making printed materials have become fast, easy and simple. Nowadays, making printed materials have become fast, easy and simple. Nowadays, making printed materials have become fast, easy and simple. Nowadays, making printed materials have become fast, easy and simple.',
//                  style: TextStyle(height: 2),
//                ),
                  Text(
                    description,
                    style: TextStyle(height: 2),
                  ),
                  SizedBox(height: size.height * 0.05),
                  AddToBasketButton(
                    shopName: shop,
                    price: price,
                    foodName: specialName,
                  ),
                ],
              ),
            ),
          )
        ],

//      Body(),
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

//class Body extends StatelessWidget {
////  final String shop;
////  final String specialName;
////  final String description;
////  final String price;
////  final double ratings;
//
////  const Body(
////      {Key key,
////      this.shop,
////      this.specialName,
////      this.description,
////      this.price,
////      this.ratings})
////      : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    Size size = MediaQuery.of(context).size;
//
//    return Column(
//      children: [
//        ItemImage(imgSrc: 'images/budge_logo.png'),
//        SizedBox(height: 10),
//        Expanded(
//          child: Container(
//            padding: EdgeInsets.all(20),
//            decoration: BoxDecoration(
//              color: Colors.white,
//              borderRadius: BorderRadius.only(
//                topRight: Radius.circular(30),
//                topLeft: Radius.circular(30),
//              ),
//            ),
//            child: Column(
//              children: [
//                shopName('shop'),
//                TitlePriceRating(
//                  name: 'specialName',
//                  rating: 4,
////                  ratings,
//                  numOfReviews: 24,
//                  price: '4',
////                  price,
//                  onRatingChanged: (value) {},
//                ),
////                Text(
////                  'Nowadays, making printed materials have become fast, easy and simple. Nowadays, making printed materials have become fast, easy and simple. Nowadays, making printed materials have become fast, easy and simple. Nowadays, making printed materials have become fast, easy and simple. Nowadays, making printed materials have become fast, easy and simple. Nowadays, making printed materials have become fast, easy and simple.',
////                  style: TextStyle(height: 2),
////                ),
//                Text(
//                  'description',
//                  style: TextStyle(height: 2),
//                ),
//                SizedBox(height: size.height * 0.05),
//                OrderButton(
//                  onTap: () {},
//                ),
//              ],
//            ),
//          ),
//        )
//      ],
//    );
//  }
//
//  Row shopName(String shopName) {
//    return Row(
//      children: [
//        Icon(Icons.location_on, color: Colors.grey),
//        SizedBox(
//          width: 10,
//        ),
//        Text(shopName),
//      ],
//    );
//  }
//}

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
      height: size.height * 0.25,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }
}
