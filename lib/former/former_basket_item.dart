import 'package:flutter/material.dart';
import 'package:budge_food/provider/Basket.dart';

class BasketItemTile extends StatefulWidget {
  final BasketItem newItem;
//  final String foodOrSnacks;
//  final String image;

  BasketItemTile(this.newItem);

//  final String shopName;
//  final String foodName;
//  final String description;
//  final String price;

//  const BasketItemTile({
//    Key key,
//    this.shopName,
//    this.description,
//    this.price,
//    this.foodName,
//    this.newItem,
//  }) : super(key: key);

  @override
  _BasketItemTileState createState() => _BasketItemTileState();
}

class _BasketItemTileState extends State<BasketItemTile> {
  int _qtyCount = 1;
  int price;
  int newPriceBasedOnQty;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    price = int.parse(widget.newItem.price);
    newPriceBasedOnQty = price;
  }

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;

    void _quantityAdd() {
      setState(() {
        _qtyCount++;
        newPriceBasedOnQty = price * _qtyCount;
      });
      print(newPriceBasedOnQty);
    }

    void _quantitySub() {
      if (_qtyCount != 1) {
        setState(() {
          newPriceBasedOnQty = (price * _qtyCount) - price;
          _qtyCount--;
          print(newPriceBasedOnQty);
        });
      }
    }

//    void amountOnQty() {
//      setState(() {
//        price*_qtyCount;
//      });
//    }

    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Container(
        padding: EdgeInsets.only(top: 10, left: 20, bottom: 10),
        height: media.height * 0.18,
        decoration: BoxDecoration(
//          color: Colors.yellow,
          border: Border.all(color: Colors.grey[600]),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              height: 150,
              width: 120,
              decoration: BoxDecoration(
//                color: Colors.black,
                image: DecorationImage(
                  image: AssetImage(
                      'images/${widget.newItem.foodOrSnacks}/${widget.newItem.imageName}.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: media.width * 0.54,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
//                        widget.newItem.shop,
                        widget.newItem.foodName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Yummy',
                        style: TextStyle(
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                          color: Colors.green,
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
//                        widget.newItem.price,
                        '$newPriceBasedOnQty',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 5),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  width: media.width * 0.54,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
//                        crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Qty:',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      InkWell(
                        child: Icon(Icons.remove_circle_outline),
                        onTap: _quantitySub,
                      ),
                      Text(
                        '$_qtyCount',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      InkWell(
                        child: Icon(Icons.add_circle_outline),
                        onTap: () {
                          _quantityAdd();
                        },
                      ),
                      Icon(
                        Icons.delete,
                        color: Colors.blueGrey,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
