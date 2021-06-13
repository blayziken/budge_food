import 'package:flutter/material.dart';
import 'package:budge_food/widgets/materialDialog/failedShowDialog.dart';
import 'package:provider/provider.dart';
import 'package:budge_food/provider/Basket.dart';
import 'package:budge_food/provider/Orders.dart';

class ProcessOrderButton extends StatefulWidget {
  final String address;

  const ProcessOrderButton({Key key, this.address}) : super(key: key);

  @override
  _ProcessOrderButtonState createState() => _ProcessOrderButtonState();
}

class _ProcessOrderButtonState extends State<ProcessOrderButton> {
  var _isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final processedOrder = Provider.of<Orders>(context);
    final basketProvider = Provider.of<Basket>(context, listen: false);

    return _isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Center(
            child: InkWell(
              child: Container(
                width: size.width * 0.4,
                height: size.height * 0.06,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: Text(
                    'Process Order',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              onTap: () {
                setState(() {
                  _isLoading = true;
                });

                print('Process Order');

                if (basketProvider.basketItems.isEmpty) {
                  setState(() {
                    _isLoading = false;
                  });
                  return failedShowDialog(context,
                      text: 'There\'s nothing in your basket');
                } else {
                  List allOrdersInBasket = basketProvider.allOrders;

                  ProcessedOrder _processedOrder = ProcessedOrder(
                    order: allOrdersInBasket,
                    address: widget.address,
                    amount: basketProvider.totalBasketAmount + 200,
                  );

                  processedOrder
                      .addProcessedOrder(_processedOrder)
                      .catchError((error) {
                    print('Error message: ${error.toString()}');
                    setState(() {
                      _isLoading = false;
                    });
                    return failedShowDialog(context,
                        text: 'Something went wrong');
                  }).then((_) {
                    setState(() {
                      _isLoading = false;
                    });

                    Navigator.pushReplacementNamed(context, 'home-screen');
                    basketProvider.clearBasket();
                  });

                  print(basketProvider.allOrders);
                }
              },
            ),
          );
  }
}
