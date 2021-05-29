import 'package:flutter/material.dart';
import 'package:budge_food/provider/Basket.dart';
import 'package:provider/provider.dart';
import 'package:budge_food/widgets/basketsWidgets/basket_item.dart';

class BasketScreen extends StatefulWidget {
  static const routeName = 'basket-screen';

  @override
  _BasketScreenState createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  Basket basket = Basket();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final basketData = Provider.of<Basket>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
//        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 0,
              child: Text(
                'My Basket',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              flex: 0,
              child: Container(
                height: 400,
                color: Colors.teal,
                child: ListView.builder(
                  itemCount: basketData.basketList.length,
                  itemBuilder: (context, index) =>
                      BasketItemTile(basketData.basketList[index]),
                ),
              ),
            )
//            basketData.basketList[index]
          ],
        ),
      ),
    );
  }
}

//
//import 'package:flutter/material.dart';
//import 'package:budge_food/models/Basket.dart';
//
//class BasketScreen extends StatefulWidget {
//  static const routeName = 'basket-screen';
//
//  @override
//  _BasketScreenState createState() => _BasketScreenState();
//}
//
//class _BasketScreenState extends State<BasketScreen> {
//  Basket basket = Basket();
//
//  @override
//  Widget build(BuildContext context) {
////    List<BasketItemTile> _basketList = [
////      BasketItemTile(
////          shopName: 'Mavis Campus',
////          description: 'Scaling up satisfaction',
////          price: 'N600'),
////    ];
//
//    return Scaffold(
//      appBar: AppBar(
//        backgroundColor: Colors.white,
//        elevation: 0,
//        leading: IconButton(
//          icon: Icon(
//            Icons.arrow_back,
//            color: Colors.black,
//          ),
//          onPressed: () {
//            Navigator.pop(context);
//          },
//        ),
//      ),
//      body: Container(
//        padding: EdgeInsets.only(left: 20, right: 20),
//        child: Column(
//          crossAxisAlignment: CrossAxisAlignment.start,
//          children: [
//            Expanded(
//              flex: 0,
//              child: Text(
//                'My Basket',
//                style: TextStyle(
//                  color: Colors.blueGrey,
//                  fontSize: 20,
//                ),
//              ),
//            ),
//            SizedBox(height: 10),
////            BasketItemTile(
////                shopName: 'Mavis Campus',
////                description: 'Scaling up satisfaction',
////                price: 'N600'),
////            SizedBox(height: 20),
////            BasketItemTile(
////                shopName: 'Olaiya',
////                description: 'Scaling up satisfaction',
////                price: 'N750'),
//            Expanded(
//              flex: 0,
//              child: Container(
////                height: 400,
//                color: Colors.teal,
//                child: Column(
////                  crossAxisAlignment: CrossAxisAlignment.stretch,
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  children: basket.basketList,
//                ),
//              ),
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}
