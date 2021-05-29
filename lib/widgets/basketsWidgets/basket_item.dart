import 'package:flutter/material.dart';
import 'package:budge_food/provider/Basket.dart';

class BasketItemTile extends StatefulWidget {
  final BasketItem newItem;

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

  void _quantityAdd() {
    setState(() {
      _qtyCount++;
    });
    print(_qtyCount);
  }

  void _quantitySub() {
    if (_qtyCount != 1) {
      setState(() {
        _qtyCount--;
      });
      print(_qtyCount);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.only(top: 10, left: 20, bottom: 10),
        height: media.height * 0.18,
        decoration: BoxDecoration(
          color: Colors.yellow,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              height: 150,
              width: 120,
              color: Colors.black,
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
                        widget.newItem.shop,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        widget.newItem.description,
                        style: TextStyle(
                          fontSize: 13,
                          fontStyle: FontStyle.italic,
                          color: Colors.green,
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        widget.newItem.price,
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
                        onTap: _quantityAdd,
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
