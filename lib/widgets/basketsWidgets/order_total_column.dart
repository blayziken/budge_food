import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:budge_food/provider/Basket.dart';

class OrderTotalColumn extends StatefulWidget {
  const OrderTotalColumn({
    Key key,
  }) : super(key: key);

  @override
  _OrderTotalColumnState createState() => _OrderTotalColumnState();
}

class _OrderTotalColumnState extends State<OrderTotalColumn> {
  @override
  Widget build(BuildContext context) {
    int subTotal;
    int commission = 200;
    int totalBasketAmount;

    setState(() {
      subTotal = Provider.of<Basket>(context, listen: false).totalBasketAmount;

      totalBasketAmount = subTotal + commission;
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Order Total',
          style: TextStyle(
            color: Colors.blueGrey,
            fontSize: 22,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8.0, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sub Total',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    '$subTotal',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Commission',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    '$commission',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    '$totalBasketAmount',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
