import 'package:budge_food/widgets/basketsWidgets/process_order_button.dart';
import 'package:flutter/material.dart';
import 'address_textField.dart';
import 'display_card_number.dart';
import 'order_total_column.dart';

class BottomBasketDetails extends StatelessWidget {
  const BottomBasketDetails({
    Key key,
    @required this.address,
    @required this.myAddressController,
  }) : super(key: key);

  final String address;
  final TextEditingController myAddressController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Delivery Address',
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 22,
            ),
          ),
          AddressTextField(
              address: address, myAddressController: myAddressController),
          SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Payment Method',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 22,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.0, right: 50),
                child: DisplayCardNumber(),
              ),
            ],
          ),
          SizedBox(height: 40),
          OrderTotalColumn(),
          SizedBox(height: 10),
          ProcessOrderButton(address: address),
        ],
      ),
    );
  }
}
