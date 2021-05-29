import 'package:flutter/material.dart';

class DisplayCardNumber extends StatelessWidget {
  const DisplayCardNumber({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
//                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 30,
          width: 30,
          color: Colors.black,
        ),
        SizedBox(width: 20),
        Text(
          '4012*******81',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
          ),
        ),
        Spacer(),
        Container(
          height: 30,
          width: 30,
          color: Colors.black,
        ),
      ],
    );
  }
}
