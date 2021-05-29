import 'package:flutter/material.dart';

class HomeSearchWidget extends StatelessWidget {
  const HomeSearchWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 50,
      width: media.width * 0.7,
      decoration: BoxDecoration(
//                            color: Colors.red,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.black),
      ),
      child: TextField(
        decoration: InputDecoration(
            hintText: "Search",
            hintStyle: TextStyle(fontSize: 20),
            prefixIcon: Icon(
              Icons.search,
              size: 30,
//                                  color: Colors.green,
            ),
//                                icon: Icon(Icons.search, size: 30),
            border: InputBorder.none),
      ),
    );
  }
}
