import 'package:flutter/material.dart';

class ProcessOrderButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Center(
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
        onTap: () {},
      ),
    );
  }
}
