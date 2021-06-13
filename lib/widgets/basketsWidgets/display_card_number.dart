import 'package:flutter/material.dart';

class DisplayCardNumber extends StatelessWidget {
  const DisplayCardNumber({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/master-card.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 30),
        Text(
          '4012*******81',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
          ),
        ),
        Spacer(),
        Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/credit_card.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
