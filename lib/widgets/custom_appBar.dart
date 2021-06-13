import 'package:flutter/material.dart';
import 'homeWidgets/homeSearch_widget.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key key,
    @required GlobalKey<ScaffoldState> scaffoldKey,
  })  : _scaffoldKey = scaffoldKey,
        super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              child: Icon(
                Icons.list,
                size: 40,
                color: Color(0xFF416785),
              ),
              onTap: () {
                _scaffoldKey.currentState.openDrawer();
              },
            ),
            HomeSearchWidget(),
            InkWell(
              child: Icon(
                Icons.shopping_cart,
                size: 40,
                color: Color(0xFF416785),
              ),
              onTap: () {
                Navigator.pushNamed(context, 'basket-screen');
              },
            ),
          ],
        ),
      ),
    );
  }
}
