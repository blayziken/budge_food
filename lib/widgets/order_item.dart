import 'package:flutter/material.dart';
import 'package:budge_food/provider/Orders.dart' as ord;
import 'package:intl/intl.dart';

class OrderItem extends StatelessWidget {
  final ord.ProcessedOrder order;

  OrderItem(this.order);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    //
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Text(
            '${order.dateTime}',
//            'a',
            style: TextStyle(
              fontSize: 17,
            ),
          ),
          SizedBox(height: 5),
          Container(
            height: media.height * 0.19,
            width: media.width * 0.9,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  offset: Offset(0, 3),
                  blurRadius: 7,
                  spreadRadius: 5,
                )
              ],
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 10.0, left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order Added!',
                    style: TextStyle(
//                          fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 5),
                  InkWell(
                    child: Text(
                      'Your order has been added',
                      style: TextStyle(
//                          fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    onTap: () {
//                      Navigator.push(
//                          context,
//                          MaterialPageRoute(
//                            builder: (context) => OrderDetail(
//                              subTotal: order.amount,
//                              phoneNumber: order.phoneNumber,
//                              address: order.address,
//                              order: order.order,
//                              shopName: order.shopName,
//                              date: order.dateTime,
//                            ),
//                          ));
//
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 13.0, bottom: 10, right: 10),
                    child: Row(
                      children: [
                        Container(
                          width: media.width * 0.18,
                          height: media.height * 0.092,
                          decoration: BoxDecoration(
                            color: Colors.black,
//                              image: DecorationImage(
//                                image: AssetImage('images/image.png'),
//                                fit: BoxFit.cover,
//                              ),
                          ),
                        ),
                        SizedBox(width: 13),
                        Container(
                          width: media.width * 0.6,
                          height: media.height * 0.092,
                          color: Colors.grey.withOpacity(0.5),
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Delivery Time: 15 mins',
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(
                                  'Total: N${order.amount}',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
//          SizedBox(height: 15),
        ],
      ),
    );
  }
}
