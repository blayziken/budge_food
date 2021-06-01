import 'package:budge_food/widgets/basketsWidgets/bottom_basketDetails.dart';
import 'package:flutter/material.dart';
import 'package:budge_food/provider/Basket.dart';
import 'package:budge_food/widgets/basketsWidgets/widgets_functions.dart';
import 'package:provider/provider.dart';

class BasketScreen extends StatefulWidget {
  static const routeName = 'basket-screen';

  @override
  _BasketScreenState createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  Basket basket = Basket();
  final myAddressController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String address = myAddressController.text;
//    basket.basketList.
    return Scaffold(
      appBar: basketAppBar(context),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
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
              emptyBasketOrNot(context),
              SizedBox(height: 10),
              BottomBasketDetails(
                  address: address, myAddressController: myAddressController),
            ],
          ),
        ),
      ),
    );
  }

  AppBar basketAppBar(BuildContext context) {
    return AppBar(
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
    );
  }
}
