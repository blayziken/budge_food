import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

List<PageViewModel> pages = [
  PageViewModel(
    title: "Relax and Shop",
    body: "Order online and get your food "
        "delivered from stores to you in as fast as 15 mins.",
    image: Padding(
      padding: EdgeInsets.only(top: 100.0),
      child: Center(
        child: Container(
          height: 350,
          width: 300,
          color: Colors.blue,
        ),
      ),
    ),
    decoration: PageDecoration(
      titleTextStyle: TextStyle(
          color: Colors.black, fontWeight: FontWeight.w900, fontSize: 30),
      bodyTextStyle: TextStyle(color: Colors.black87, fontSize: 20.0),
    ),
  ),
  //
  PageViewModel(
    title: "The Food You Love",
    body: "Delivered to you sharps! 🚀",
    image: Padding(
      padding: EdgeInsets.only(top: 100.0),
      child: Center(
        child: Container(
          height: 300,
          width: 300,
          color: Colors.blue,
        ),
      ),
    ),
    decoration: PageDecoration(
      titleTextStyle: TextStyle(
          color: Colors.black, fontWeight: FontWeight.w900, fontSize: 30),
      bodyTextStyle: TextStyle(color: Colors.black87, fontSize: 20.0),
    ),
  ),
  //
  PageViewModel(
    title: "Click. Click...,",
    body: "We have specials that'll blow your mind",
    image: Padding(
      padding: EdgeInsets.only(top: 100.0),
      child: Center(
        child: Container(
          height: 300,
          width: 300,
          color: Colors.blue,
        ),
//
      ),
    ),
    decoration: PageDecoration(
      titleTextStyle: TextStyle(
          color: Colors.black, fontWeight: FontWeight.w900, fontSize: 30),
      bodyTextStyle: TextStyle(color: Colors.black87, fontSize: 20.0),
    ),
  ),
  //
  PageViewModel(
    title: "That's not all",
    bodyWidget: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('You can order Party drinks also', style: TextStyle(fontSize: 20)),
        SizedBox(height: 15),
        Text('You can order from UNILAG Pharmacy',
            style: TextStyle(fontSize: 20)),
        SizedBox(height: 15),
        Text('You can order Stationaries', style: TextStyle(fontSize: 20)),
      ],
    ),
    image: Padding(
      padding: EdgeInsets.only(top: 100.0),
      child: Center(
        child: Container(
          height: 300,
          width: 300,
          color: Colors.blue,
        ),
      ),
    ),
    decoration: PageDecoration(
      titleTextStyle: TextStyle(
          color: Colors.black, fontWeight: FontWeight.w900, fontSize: 50),
    ),
  )
];
