import 'package:flutter/material.dart';
import 'package:budge_food/provider/Basket.dart';
import 'package:provider/provider.dart';

class BasketItemTile extends StatefulWidget {
  final BasketItem newItem;
  BasketItemTile(this.newItem);

  @override
  _BasketItemTileState createState() => _BasketItemTileState();
}

class _BasketItemTileState extends State<BasketItemTile> {
  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    List foodOrder = widget.newItem.foodOrder;

    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
      ),
      direction: DismissDirection.endToStart,
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: Container(
          padding: EdgeInsets.only(top: 10, left: 20, bottom: 10),
          height: media.height * 0.18,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[600]),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Container(
                height: 150,
                width: 120,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'images/${widget.newItem.foodOrSnacks}/${widget.newItem.imageName}.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Spacer(),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
//                      width: media.width * 0.54,
//                      color: Colors.yellow,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            widget.newItem.foodName,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                          SizedBox(height: 5),
                          InkWell(
                            child: Text(
                              'Check Details..',
                              style: TextStyle(
                                fontSize: 15,
                                fontStyle: FontStyle.italic,
                                color: Colors.green,
                              ),
                            ),
                            onTap: () {
                              print('details');
                              print(widget.newItem.foodOrder);

//                            Navigator.push(
//                              context,
//                              MaterialPageRoute(
//                                builder: (context) =>
//                                    FoodOrderDetails(order: foodOrder),
//                              ),
//                            );
                            },
                          ),
                          SizedBox(height: 15),
                          Text(
                            widget.newItem.price,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
      onDismissed: (direction) {
        Provider.of<Basket>(context, listen: false)
            .deleteItemFromBasket(widget.newItem.id);
      },
    );
  }
}
