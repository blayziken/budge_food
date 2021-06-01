import 'package:budge_food/screens/BasketScreen.dart';
import 'package:budge_food/screens/home.dart';
import 'package:flutter/material.dart';
import 'materialDialog_icon_buttons.dart';
import 'material_dialogs.dart';

Future<void> materialDialog(context) {
  return Dialogs.materialDialog(
      msg: 'Item has been added to the basket',
      title: "Added!!",
      titleStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      msgStyle: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
      color: Colors.white,
      context: context,
      actions: [
        IconsOutlineButton(
          onPressed: () {
//            Navigator.pushNamed(context, '/basket-screen');
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BasketScreen(),
                ));
          },
          text: 'Check Basket',
          iconData: Icons.view_list,
          color: Colors.orange,
          textStyle: TextStyle(color: Colors.white),
          iconColor: Colors.white,
        ),
        IconsButton(
          onPressed: () {
//            Navigator.pushReplacementNamed(context, '/home-screen');
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ));
          },
          text: "Home",
          iconData: Icons.add,
          color: Colors.orange,
          textStyle: TextStyle(color: Colors.white),
          iconColor: Colors.white,
        ),
      ]);
}
