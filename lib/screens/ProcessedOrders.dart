import 'package:budge_food/provider/Orders.dart';
import 'package:budge_food/widgets/order_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProcessedOrders extends StatefulWidget {
  static const routeName = '/processed-orders';

  @override
  _ProcessedOrdersState createState() => _ProcessedOrdersState();
}

class _ProcessedOrdersState extends State<ProcessedOrders> {
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);

    //    Widget fullList() {
//      List<Widget> foodList = [];
//      for (var i = 0; i < order.length; i++) {
//        for (var j = 0; j < order[i].length; j++) {
////          print('${order[i][j]}');
//
//          foodList.add(
//            Container(
//                width: 250,
//                child: Column(
//                  children: [
//                    Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                      children: [
//                        Text('${order[i][j]}', style: TextStyle(fontSize: 20)),
//                        Text('${order[i][++j]}',
//                            style: TextStyle(fontSize: 20)),
//                      ],
//                    ),
//                    SizedBox(height: 50),
//                  ],
//                )),
//          );
//        }
//      }
//      print(order);
//      print(foodList);
//      return Column(children: foodList);
//    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Order Details'),
      ),
//        drawer: AppDrawer(),
      body: orderData.orders.length == 0
          ? Center(
              child: Text(
                'No Orders..',
                style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                ),
              ),
            )
          : ListView.builder(
              itemCount: orderData.orders.length,
              itemBuilder: (context, index) =>
                  OrderItem(orderData.orders[index]),
//        itemBuilder: (context, index) => OrderItem(),
            ),
    );
  }
}
