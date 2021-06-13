import 'package:flutter/material.dart';

class AddressTextField extends StatelessWidget {
  String address;

  AddressTextField({
    Key key,
    @required this.myAddressController,
    this.address,
  }) : super(key: key);

  final TextEditingController myAddressController;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 0, left: 30),
      height: 30,
      width: size.width * 0.9,
      child: TextFormField(
        controller: myAddressController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          suffixIcon: Icon(Icons.edit),
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
//
        ),
        style: TextStyle(
          fontSize: 17.0,
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Address required';
          }
          return null;
        },
        onSaved: (String value) {
          address = value;
        },
      ),
    );
  }
}
