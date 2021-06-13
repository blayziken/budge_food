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
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Orders>(context).fetchProcessedOrders();
      setState(() {
        _isLoading = false;
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Order Details'),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.orange,
              ),
            )
          : orderData.orders.length == 0
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
                ),
    );
  }
}
